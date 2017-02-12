package com.linkage.module.cms.topo.service.extend
{
	import com.linkage.module.cms.topo.assets.CmsTopoIcons;
	import com.linkage.module.cms.topo.constant.CmsTopoConstants;
	import com.linkage.module.cms.topo.data.ICmsDataSource;
	import com.linkage.module.cms.topo.event.TopoEventTypes;
	import com.linkage.module.cms.topo.util.CmsTopoUtil;
	import com.linkage.module.topo.framework.Constants;
	import com.linkage.module.topo.framework.controller.event.CanvasEvent;
	import com.linkage.module.topo.framework.controller.event.TopoEvent;
	import com.linkage.module.topo.framework.core.Feature;
	import com.linkage.module.topo.framework.core.model.element.IElement;
	import com.linkage.module.topo.framework.core.model.element.point.INode;
	import com.linkage.module.topo.framework.data.IDataSource;
	import com.linkage.module.topo.framework.service.Service;
	import com.linkage.module.topo.framework.util.DataUtil;
	import com.linkage.module.topo.framework.util.MessageUtil;
	import com.linkage.module.topo.framework.util.loading.ILoadingInfo;
	import com.linkage.module.topo.framework.util.loading.LoadingManager;
	import com.linkage.module.topo.framework.view.component.TopoLayer;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.structure.map.IMap;
	import com.linkage.system.structure.map.ISet;
	import com.linkage.system.structure.map.Set;

	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.setTimeout;

	import mx.collections.ArrayList;
	import mx.controls.Image;
	import mx.core.UIComponent;

	/**
	 * CMS的扩展业务
	 * @author duangr
	 *
	 */
	public class CmsExtendService extends Service
	{
		// log
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.topo.service.extend.CmsExtendService");
		// 数据源
		private var _dataSource:IDataSource = null;
		// CMS数据源
		private var _cmsDataSource:ICmsDataSource = null;
		// loading
		private var _loading:ILoadingInfo = null;

		// ----- 工程状态相关 -----
		// 刷新工程状态定时器 Timer (60s)
		private var _workStatTimer:Timer = new Timer(60000);
		// 是否允许刷新工程状态
		private var _workStatRefreshEnable:Boolean = false;
		// 工程状态的网元
		private var _workStatElements:ISet = new Set();

		public function CmsExtendService(dataSource:IDataSource, cmsDataSource:ICmsDataSource)
		{
			super();
			_dataSource = dataSource;
			_cmsDataSource = cmsDataSource;
		}

		override public function get name():String
		{
			return "CMS扩展业务";
		}

		override public function set attributes(attr:Object):void
		{
		}

		override public function start():void
		{
			if (_dataSource == null)
			{
				throw new ArgumentError("CmsExtendService参数异常,必须设置[dataSource]参数!");
			}

			_loading = LoadingManager.getInstance().loadingInfo;

			topoCanvas.addEventListener(TopoEventTypes.FIND_LINKS, topoEventHandler_FindLinks);
			
			topoCanvas.addEventListener(TopoEventTypes.AUTOCREATE_ACCESS_TOPO, topoEventHandler_FindAccessTopo);

			// --- 工程状态 ---
			if (_workStatRefreshEnable)
			{
				_workStatTimer.addEventListener(TimerEvent.TIMER, onWorkStatTimer);
				_workStatTimer.start();
				topoCanvas.addEventListener(CanvasEvent.LAYER_CHANGED, function(event:CanvasEvent):void
					{
						loadWorkStat();
					});
			}
		}

		// 【生成选中对象链路】
		private function topoEventHandler_FindAccessTopo(event:TopoEvent):void
		{
			MessageUtil.confirm("确认生成接入网拓扑吗?", function():void
			{
				var data:String = DataUtil.buildMapXML(Constants.XML_KEY_PID, topoCanvas.topoId);
				data = DataUtil.buildXML(Constants.TP_MC_CREATE_ACCESS_TOPO, data);
				
				_loading.loadingStart();
				_dataSource.notify(topoCanvas.topoName, data, function(result:String):void
				{
					var map:IMap = DataUtil.getActionResultMap(new XML(result));
					
					if (map.get(Constants.XML_KEY_SUCCESS) == "1")
					{
						MessageUtil.showMessage("生成接入网拓扑成功");
						topoCanvas.loadCurrentTopo();
					}
					else
					{
						MessageUtil.showMessage("生成接入网拓扑失败!\n\n(" + map.get(Constants.XML_KEY_MSG) + ")");
					}
				}, function():void
				{
					_loading.loadingEnd();
				}, function():void
				{
					MessageUtil.showMessage("生成接入网拓扑失败!(通信异常)");
				});
			});
		}
		
		// 【生成选中对象链路】
		private function topoEventHandler_FindLinks(event:TopoEvent):void
		{
			MessageUtil.confirm("确认生成选中对象链路吗?", function():void
				{
					var elementIds:Array = new Array();

					topoCanvas.eachSelect(function(id:String, element:IElement):void
						{
							elementIds.push(id);
						});
					var data:String = DataUtil.buildListXML(Constants.XML_KEY_OBJIDS, elementIds);
					data += DataUtil.buildMapXML(Constants.XML_KEY_PID, topoCanvas.topoId);
					data += DataUtil.buildMapXML("isCreateSelectedAndOtherLink", "false");

					_loading.loadingStart();
					_dataSource.notify(topoCanvas.topoName, DataUtil.buildXML(Constants.TP_MC_AUTOFIND_ELEMENTS_LINK, data), function(result:String):void
						{
							var map:IMap = DataUtil.getActionResultMap(new XML(result));

							if (map.get(Constants.XML_KEY_SUCCESS) == "1")
							{
								topoCanvas.addDataXML(new XML(map[Constants.XML_KEY_ELEMENTXML]));
							}
							else
							{
								MessageUtil.showMessage("生成选中对象链路失败!\n\n(" + map.get(Constants.XML_KEY_MSG) + ")");
							}

						}, function():void
						{
							_loading.loadingEnd();
						}, function():void
						{
							MessageUtil.showMessage("生成选中对象链路失败!(通信异常)");
						});
				});
		}

		// --------------------------------------
		//              工程状态 
		// --------------------------------------
		/**
		 * 工程状态刷新是否启用
		 *
		 */
		public function set workStatRefreshEnable(value:Boolean):void
		{
			_workStatRefreshEnable = value;
		}

		/**
		 * 工程状态定时刷新
		 * @param event
		 *
		 */
		private function onWorkStatTimer(event:TimerEvent):void
		{
			if (_workStatRefreshEnable)
			{
				loadWorkStat();
			}
			else
			{
				_workStatTimer.stop();
			}
		}

		/**
		 * 加载工程状态
		 *
		 */
		private function loadWorkStat():void
		{
			loadTopoWorkStat(topoCanvas);
		}

		/**
		 * 加载某一拓扑层次的工程状态
		 * @param topoLayer
		 *
		 */
		private function loadTopoWorkStat(topoLayer:TopoLayer):void
		{
			if (topoLayer == null)
			{
				return;
			}
			var startTime:Number = new Date().getTime();
//			log.debug("[刷新工程状态]Start... {0}:{1}@{2}", topoLayer.topoId, topoLayer.topoViewName, topoLayer.topoName);
			// 【1】清除工程状态
			_workStatElements.forEach(function(element:IElement):void
				{
					element.feature.clearExtendComponents();
				});
			_workStatElements.clear();

			var data:String = DataUtil.buildMapXML(Constants.XML_KEY_PID, topoCanvas.topoId);
			data = DataUtil.buildXML(Constants.TP_MC_ELEMENTS_WORK_STATS, data);
			_dataSource.notify(topoCanvas.topoName, data, function(result:String):void
				{
//					log.debug("[刷新工程状态]查询数据结束,耗时:{0}s", (new Date().getTime() - startTime) / 1000.00);
					var map:IMap = DataUtil.getActionResultMap(new XML(result));
					if (map.get(Constants.XML_KEY_SUCCESS) == "1")
					{
						var data:XML = new XML(map.get(Constants.XML_KEY_ELEMENTXML));
						// <WorkStat>
						//  <w id=''></w>
						// </WorkStat>
						for each (var xml:XML in data.children())
						{
							var id:String = xml.@id;
							var workStat:String = xml.toString();
							var node:INode = topoCanvas.findNodeById(id);
							refreshNodeWorkStat(node, workStat);
						}
//						log.debug("[刷新工程状态]End. {0}:{1}@{2} 耗时:{3}s", topoLayer.topoId, topoLayer.topoViewName, topoLayer.topoName, (new Date().getTime() - startTime) / 1000.00);
					}
					else
					{
						log.error("[刷新工程状态]Fail: {0}", map.get(Constants.XML_KEY_MSG));
					}
				});
		}

		// 刷新节点的工程状态(注意元素可能还没初始化好,需要延时处理)
		private function refreshNodeWorkStat(node:INode, workStat:String):void
		{
			if (node)
			{
				var feature:Feature = node.feature;
				if (!feature.creationComplete)
				{
					setTimeout(function():void
						{
							refreshNodeWorkStat(node, workStat);
						}, 500);
					return;
				}
				feature.clearExtendComponents();
				var iconSource:Class = findWorkStatIcon(workStat);
				if (iconSource)
				{
					var icon:Image = new Image();
					icon.source = iconSource;
					icon.x = 0;
					icon.y = feature.height - 16;

					feature.appendExtendComponent(icon);
				}
				_workStatElements.add(node);
			}
		}

		/**
		 * 找到工程状态对应的图标
		 * @param workStat
		 * @return
		 *
		 */
		private function findWorkStatIcon(workStat:String):Class
		{
			if (workStat == null)
			{
				return null;
			}
			switch (workStat)
			{
				case "1": //工程
				case "4": //工程
					return CmsTopoIcons.workStatusIcon_1;
					break;
				case "2": // 正常
				case "9": // 正常
					return null;
					break;
				case "3": // 维护
					return CmsTopoIcons.workStatusIcon_3;
					break;
				case "5": //工程新建
					return CmsTopoIcons.workStatusIcon_5;
					break;
				case "6": //临时退网(中断)
					return CmsTopoIcons.workStatusIcon_6;
					break;
				case "7": //备份网元
					return CmsTopoIcons.workStatusIcon_7;
					break;
				default:
					return CmsTopoIcons.workStatusIcon_1;
			}
		}

	}
}