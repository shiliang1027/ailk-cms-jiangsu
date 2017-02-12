package com.linkage.module.cms.topo.service.extend
{
	import com.linkage.module.cms.topo.constant.CmsTopoConstants;
	import com.linkage.module.cms.topo.event.TopoEventTypes;
	import com.linkage.module.cms.topo.util.CmsTopoUtil;
	import com.linkage.module.topo.framework.Constants;
	import com.linkage.module.topo.framework.controller.event.CanvasEvent;
	import com.linkage.module.topo.framework.controller.event.TopoEvent;
	import com.linkage.module.topo.framework.core.Feature;
	import com.linkage.module.topo.framework.data.IDataSource;
	import com.linkage.module.topo.framework.service.Service;
	import com.linkage.module.topo.framework.util.DataUtil;
	import com.linkage.module.topo.framework.util.MessageUtil;
	import com.linkage.module.topo.framework.util.TopoNameBuffer;
	import com.linkage.module.topo.framework.util.loading.ILoadingInfo;
	import com.linkage.module.topo.framework.util.loading.LoadingManager;
	import com.linkage.module.topo.framework.view.component.panel.ElementListPanel;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.structure.map.IMap;
	import com.linkage.system.utils.StringUtils;

	import flash.utils.setTimeout;

	import mx.collections.XMLListCollection;

	/**
	 * 拓扑定位的业务
	 * @author duangr
	 *
	 */
	public class TopoLocateService extends Service
	{
		// log
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.topo.service.extend.TopoLocateService");
		// loading
		private var _loading:ILoadingInfo = null;
		// toponame缓存
		private var _topoNameBuffer:TopoNameBuffer = TopoNameBuffer.getInstance();
		// 数据源
		private var _dataSource:IDataSource = null;
		// 搜索列表面板
		private var _elementListPanel:ElementListPanel = null;
		// 集客搜索的正则表达式
		private var _jkTopoNamesRegex:String = null;
		// 集客搜索范围的topoName
		private var _jkSearchTopoNames:Array = null;

		public function TopoLocateService(dataSource:IDataSource, elementListPanel:ElementListPanel, jkTopoNamesRegex:String = null)
		{
			super();
			_dataSource = dataSource;
			_elementListPanel = elementListPanel;
			_jkTopoNamesRegex = jkTopoNamesRegex;
		}


		override public function get name():String
		{
			return "拓扑定位业务";
		}

		override public function start():void
		{
			if (_dataSource == null)
			{
				throw new ArgumentError("TopoLocateService参数异常,必须设置[dataSource]参数!");
			}
			if (_elementListPanel == null)
			{
				throw new ArgumentError("TopoLocateService参数异常,必须设置[elementListPanel]参数!");
			}
			_loading = LoadingManager.getInstance().loadingInfo;

			topoCanvas.addEventListener(TopoEventTypes.LOCATE_TRAN_TOPO, topoEventHandler_LocateTranTopo);
			topoCanvas.addEventListener(TopoEventTypes.SEARCH_ALARMED_CIRCUIT, topoEventHandler_SearchAlarmedCircuit);

			if (_jkTopoNamesRegex != null)
			{
				_topoNameBuffer.loadTopoNames(_jkTopoNamesRegex, _dataSource, function(topoNames:Array):void
					{
						_jkSearchTopoNames = topoNames;
					});

			}
		}

		// 【定位到传输子网拓扑】
		private function topoEventHandler_LocateTranTopo(event:TopoEvent):void
		{
			var moId:String = event.getProperty(CmsTopoConstants.XML_KEY_MO_ID);
			var rootPid:String = event.getProperty(Constants.XML_KEY_ROOTPID);
			var topoName:String = event.getProperty("topoName")
			if (StringUtils.isNullStr(rootPid))
			{
				rootPid = "1/transport/subnet";
			}
			// ------ 搜索定位 -------
			CmsTopoUtil.searchMoId(topoCanvas, _dataSource, _elementListPanel, _loading, topoName, moId, rootPid, false, true, function(feature:Feature):void
				{
					// 传输网定位后需要高亮
					topoCanvas.dispatchEvent(new TopoEvent(TopoEvent.HIGHTLIGHT_CONNECT, feature));
				});

		}


		// 【搜索有告警的传输电路】
		private function topoEventHandler_SearchAlarmedCircuit(event:TopoEvent):void
		{
			var topoNames:Array = null;
			if (_jkSearchTopoNames != null && _jkSearchTopoNames.length > 0)
			{
				topoNames = _jkSearchTopoNames;
			}
			else
			{
				topoNames = [topoCanvas.topoName];
			}
			log.debug("搜索有告警的传输电路 IN " + topoNames);
			var data:String = DataUtil.buildXML(Constants.TP_MC_PRINT_ALARMED_CIRCUIT, "");
			_elementListPanel.hide();
			_elementListPanel.clearList();
			_elementListPanel.changeLayerConfirm = true;
			_elementListPanel.locateMultFirst = false;
			_loading.loadingStart();

			var size:int = topoNames.length;
			var index:int = 0;
			var totalSearchNum:int = 0;
			doSearchTopo(topoNames[index], data, afterSearchTopoCallback);

			function afterSearchTopoCallback(searchNum:int):void
			{
				index++;
				totalSearchNum += searchNum;
				if (index == size)
				{
					if (totalSearchNum == 0)
					{
						MessageUtil.showMessage("未搜索到对象!");
					}
					_loading.loadingEnd();
					return;
				}
				doSearchTopo(topoNames[index], data, afterSearchTopoCallback);
			}

		}

		/**
		 * 执行真正的搜索拓扑
		 *
		 * @param topoName
		 * @param data
		 * @param callback 执行完后的回调,入参为： searchNum(搜索到的对象数量)
		 */
		private function doSearchTopo(topoName:String, data:String, callback:Function = null):void
		{
			log.debug("开始搜索 {0} ...", topoName);
			_dataSource.notify(topoName, data, function(result:String):void
				{
					var searchNum:int = 0;
					var map:IMap = DataUtil.getActionResultMap(new XML(result));
					if (map.get(Constants.XML_KEY_SUCCESS) == "1")
					{
						var dataXML:XML = new XML(map.get(Constants.XML_KEY_ELEMENTXML));
						var topoName:String = dataXML.@toponame;
						var netView:XML = dataXML.child("NetView")[0];
						var obj:XML = null;
						var searchList:XMLListCollection = new XMLListCollection();
						// ------------- 拼装查询结果列表 -------------
						// Nodes
						var nodes:XMLList = netView.Nodes;
						if (nodes)
						{
							for each (obj in nodes.Node)
							{
								obj["@topoName"] = topoName;
								searchList.addItem(obj);
							}
						}
						// Segments
						var segments:XMLList = netView.Segments;
						if (segments)
						{
							for each (obj in segments.Segment)
							{
								obj["@topoName"] = topoName;
								searchList.addItem(obj);
							}
						}
						// Objects
						var objects:XMLList = netView.Objects;
						if (objects)
						{
							for each (obj in objects.Object)
							{
								obj["@topoName"] = topoName;
								searchList.addItem(obj);
							}
						}
						// Groups
						var groups:XMLList = netView.Groups;
						if (groups)
						{
							for each (obj in groups.Group)
							{
								obj["@topoName"] = topoName;
								searchList.addItem(obj);
							}
						}
						// Links
						var links:XMLList = netView.Links;
						if (links)
						{
							for each (obj in links.Link)
							{
								obj["@topoName"] = topoName;
								searchList.addItem(obj);
							}
						}

						searchNum = searchList.length;
						if (searchNum > 0)
						{
							// 放到列表面板中
							_elementListPanel.appendDataXML(searchList);
							_elementListPanel.show();
						}
					}
					if (callback != null)
					{
						callback.call(null, searchNum);
					}
				}, function():void
				{

				}, function():void
				{
					log.error("搜索拓扑异常!(通信异常)");
					if (callback != null)
					{
						callback.call(null, 0);
					}
				});
		}

	}
}