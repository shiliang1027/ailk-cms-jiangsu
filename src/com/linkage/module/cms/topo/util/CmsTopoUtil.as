package com.linkage.module.cms.topo.util
{
	import com.linkage.module.cms.topo.constant.CmsTopoConstants;
	import com.linkage.module.topo.framework.Constants;
	import com.linkage.module.topo.framework.core.model.element.IElement;
	import com.linkage.module.topo.framework.core.model.element.point.INode;
	import com.linkage.module.topo.framework.data.IDataSource;
	import com.linkage.module.topo.framework.util.DataUtil;
	import com.linkage.module.topo.framework.util.MessageUtil;
	import com.linkage.module.topo.framework.util.TopoNameBuffer;
	import com.linkage.module.topo.framework.util.loading.ILoadingInfo;
	import com.linkage.module.topo.framework.view.component.TopoCanvas;
	import com.linkage.module.topo.framework.view.component.panel.ElementListPanel;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.utils.StringUtils;
	
	import mx.collections.XMLListCollection;

	public class CmsTopoUtil
	{
		// log
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.topo.util.CmsTopoUtil");

		/**
		 * 搜索网元ID
		 * @param topoCanvas 画布
		 * @param dataSource 数据源
		 * @param elementListPanel 元素列表面板
		 * @param loading 加载...
		 * @param topoName 拓扑数据源名称
		 * @param moId 网元id
		 * @param rootPid 搜索的根
		 * @param moTypeId 网元类型id
		 * @param specId 专业id
		 * @param changeLayerConfirm 切换层次时是否弹出确认
		 * @param locateMultFirst 多个查询结果时是否定位到第一个
		 * @param locateCallback 定位成功后的回调函数,参数为: feature:Feature <br/>
		 * 		例如: function(feature:Feature):void{...}
		 *
		 */
		public static function searchMoId(topoCanvas:TopoCanvas, dataSource:IDataSource, elementListPanel:ElementListPanel, loading:ILoadingInfo, topoName:String, moId:String, rootPid:String = null, changeLayerConfirm:Boolean =
			false, locateMultFirst:Boolean = true, locateCallback:Function = null):void
		{
			log.debug("searchMoId {0} in {1}", moId, topoName);
			if (StringUtils.isNullStr(topoName))
			{
				if (StringUtils.isNullStr(topoCanvas.topoName))
				{
					topoName = Constants.DEFAULT_TOPONAME;
				}
				else
				{
					topoName = topoCanvas.topoName;
				}
			}
			searchMoIdFromTopoNames(topoCanvas, dataSource, elementListPanel, loading, [topoName], moId, rootPid, changeLayerConfirm, locateMultFirst, locateCallback);
		}

		/**
		 * 根据toponame的正则表达式去符合条件的 toponame下搜索网元ID
		 * @param topoCanvas 画布
		 * @param dataSource 数据源
		 * @param elementListPanel 元素列表面板
		 * @param loading 加载...
		 * @param topoNameRegex 拓扑数据源名称正则表达式
		 * @param moId 网元id
		 * @param rootPid 搜索的根
		 * @param moTypeId 网元类型id
		 * @param specId 专业id
		 * @param changeLayerConfirm 切换层次时是否弹出确认
		 * @param locateMultFirst 多个查询结果时是否定位到第一个
		 * @param locateCallback 定位成功后的回调函数,参数为: feature:Feature <br/>
		 * 		例如: function(feature:Feature):void{...}
		 *
		 */
		public static function searchMoIdByTopoNameRegex(topoCanvas:TopoCanvas, dataSource:IDataSource, elementListPanel:ElementListPanel, loading:ILoadingInfo, topoNameRegex:String, moId:String, rootPid:String =
			null, changeLayerConfirm:Boolean = false, locateMultFirst:Boolean = true, locateCallback:Function = null):void
		{
			log.debug("searchMoIdByTopoNameRegex {0} in regex: {1}", moId, topoNameRegex);
			TopoNameBuffer.getInstance().loadTopoNames(topoNameRegex, dataSource, function(topoNames:Array):void
				{
					if (topoNames == null)
					{
						if (StringUtils.isNullStr(topoCanvas.topoName))
						{
							topoNames = [Constants.DEFAULT_TOPONAME];
						}
						else
						{
							topoNames = [topoCanvas.topoName];
						}
					}
					searchMoIdFromTopoNames(topoCanvas, dataSource, elementListPanel, loading, topoNames, moId, rootPid, changeLayerConfirm, locateMultFirst, locateCallback);
				});
		}

		/**
		 * 从指定的topoName数组中搜索网元ID
		 *
		 * @param topoCanvas 画布
		 * @param dataSource 数据源
		 * @param elementListPanel 元素列表面板
		 * @param loading 加载...
		 * @param searchTopoNames 拓扑数据源名称数组
		 * @param moId 网元id
		 * @param rootPid 搜索的根
		 * @param moTypeId 网元类型id
		 * @param specId 专业id
		 * @param changeLayerConfirm 切换层次时是否弹出确认
		 * @param locateMultFirst 多个查询结果时是否定位到第一个
		 * @param locateCallback 定位成功后的回调函数,参数为: feature:Feature <br/>
		 * 		例如: function(feature:Feature):void{...}
		 *
		 */
		private static function searchMoIdFromTopoNames(topoCanvas:TopoCanvas, dataSource:IDataSource, elementListPanel:ElementListPanel, loading:ILoadingInfo, searchTopoNames:Array, moId:String, rootPid:String =
			null, changeLayerConfirm:Boolean = false, locateMultFirst:Boolean = true, locateCallback:Function = null):void
		{
			if (StringUtils.isNullStr(moId))
			{
				MessageUtil.showMessage("未定义待搜索对象!");
				return;
			}
			log.debug("【搜索MO】 {0} in {1}", moId, searchTopoNames);

			// ============= 构造 搜索的boxname ==========
			var boxNameArray:Array = [];
			boxNameArray.push(Constants.TOPOSQL_TYPE_NODE);
			// ============= 构造 topoSql ==============
			var topoSqlArray:Array = [];
			topoSqlArray.push(DataUtil.buildTopoSqlEqual("visible", "1"));
			topoSqlArray.push(DataUtil.buildTopoSqlEqual(CmsTopoConstants.XML_KEY_MO_ID, moId));
			if (!StringUtils.isNullStr(rootPid))
			{
				if (rootPid.indexOf(",") == -1)
				{
					topoSqlArray.push(DataUtil.buildTopoSqlEqual(Constants.XML_KEY_ROOTPID, rootPid));
				}
				else
				{
					topoSqlArray.push(DataUtil.buildTopoSqlExist(Constants.XML_KEY_ROOTPID, rootPid.split(",")));
				}
			}

			elementListPanel.hide();
			elementListPanel.clearList();
			elementListPanel.changeLayerConfirm = changeLayerConfirm;
			elementListPanel.locateMultFirst = locateMultFirst;
			elementListPanel.locateCallback = locateCallback;

			prepareToSearch(boxNameArray, topoSqlArray, searchTopoNames, dataSource, elementListPanel, loading, function():Boolean
				{
					return topoCanvas.someNode(function(id:String, node:INode):Boolean
						{
							if (moId == node.getExtendProperty(CmsTopoConstants.XML_KEY_MO_ID))
							{
								// 当前层搜索到对象,直接定位
								topoCanvas.locateElement(node.id, node.name, topoCanvas.topoName);
								return true;
							}
							else
							{
								return false;
							}
						});
				});
		}



		/**
		 * 搜索集客ID
		 * @param topoCanvas 画布
		 * @param dataSource 数据源
		 * @param elementListPanel 元素列表面板
		 * @param loading 加载...
		 * @param custId 集客id
		 * @param changeLayerConfirm 切换层次时是否弹出确认
		 * @param locateMultFirst 多个查询结果时是否定位到第一个
		 *
		 */
		public static function searchCustId(topoCanvas:TopoCanvas, dataSource:IDataSource, elementListPanel:ElementListPanel, loading:ILoadingInfo, id:String, changeLayerConfirm:Boolean = false, locateMultFirst:Boolean = true):void
		{
			if (StringUtils.isNullStr(id))
			{
				MessageUtil.showMessage("未定义待搜索对象!");
				return;
			}
			var charIndex:int = id.indexOf("_");
			var pord:String = null;
			if(charIndex != -1){
				pord = id.substr(charIndex+1);
				id = id.substr(0,charIndex);
			}
			log.debug("【搜索集客】 {0}", id);
			var element:IElement = topoCanvas.findElementById(id);
			if (element != null)
			{
				// 在当前层次中,直接定位
				topoCanvas.locateElement(element.id, element.name, topoCanvas.topoName, changeLayerConfirm);
			}
			else
			{
				TopoNameBuffer.getInstance().loadTopoNames("^.*jtkh.*$", dataSource, function(searchTopoNames:Array):void
				{
					if (searchTopoNames == null)
					{
						searchTopoNames = [CmsTopoConstants.DEFAULT_TOPONAME_JTKH];
					}
					log.debug("【搜索集客】 {0} in {1}", id, searchTopoNames);
					// ============= 构造 搜索的boxname ==========
					var boxNameArray:Array = [];
					boxNameArray.push(Constants.TOPOSQL_TYPE_SEGMENT);
					boxNameArray.push(Constants.TOPOSQL_TYPE_LINK);
					boxNameArray.push(Constants.TOPOSQL_TYPE_NODE);

					// ============= 构造 topoSql ==============
					var topoSqlArray:Array = [];
					topoSqlArray.push(DataUtil.buildTopoSqlEqual("visible", "1"));
					topoSqlArray.push(DataUtil.buildTopoSqlEqual(Constants.XML_KEY_ROOTPID, Constants.TOP_PID_JTKH));
					topoSqlArray.push(DataUtil.buildTopoSqlEqual("pid", id));
					if(pord != null)
					{
						topoSqlArray.push(DataUtil.buildTopoSqlEqual("_ea_.prod_no", pord));
					}
					elementListPanel.hide();
					elementListPanel.clearList();
					elementListPanel.changeLayerConfirm = changeLayerConfirm;
					elementListPanel.locateMultFirst = locateMultFirst;
					
					prepareToSearch(boxNameArray, topoSqlArray, searchTopoNames, dataSource, elementListPanel, loading);
				});
			}
		}

		/**
		 * 准备搜索
		 * @param boxNameArray 搜索的boxName
		 * @param topoSqlArray AND的toposql
		 * @param searchTopoNames 搜索的topoName
		 * @param dataSource  数据源
		 * @param elementListPanel  展示列表
		 * @param loading 加载中提示
		 * @param changeLayerConfirm 切换层次时是否弹出确认
		 * @param locateMultFirst 多个查询结果时是否定位到第一个
		 * @param localSearchFun 当前层搜索的回调函数.无入参,返回Boolean true:当前层找到;false:当前层没找到, 例如: function():Boolean{...}
		 *
		 */
		private static function prepareToSearch(boxNameArray:Array, topoSqlArray:Array, searchTopoNames:Array, dataSource:IDataSource, elementListPanel:ElementListPanel, loading:ILoadingInfo, localSearchFun:Function =
			null):void
		{
			var topoSql:String = DataUtil.buildFinalTopoSql_And(topoSqlArray);
			var boxnames:String = boxNameArray.join(",");

			log.debug("【搜索拓扑】 topoNames={0} boxnames={1} topoSql={2}", searchTopoNames, boxnames, topoSql);
			loading.loadingStart();

			var size:int = searchTopoNames.length;
			var index:int = 0;
			var totalSearchNum:int = 0;
			doSearchTopo(dataSource, elementListPanel, searchTopoNames[index], boxnames, topoSql, afterSearchTopoCallback);

			function afterSearchTopoCallback(searchNum:int):void
			{
				index++;
				totalSearchNum += searchNum;
				if (index == size)
				{
					if (totalSearchNum == 0)
					{
						// 未搜索到对象,尝试当前层搜索
						if (localSearchFun == null || localSearchFun.call() == false)
						{
							MessageUtil.showMessage("未搜索到对象!");
						}
					}
					loading.loadingEnd();
					return;
				}
				doSearchTopo(dataSource, elementListPanel, searchTopoNames[index], boxnames, topoSql, afterSearchTopoCallback);
			}
		}

		/**
		 * 执行真正的搜索拓扑
		 *
		 * @param dataSource 数据源
		 * @param elementListPanel 展示列表
		 * @param topoName
		 * @param boxnames
		 * @param topoSql
		 * @param callback 执行完后的回调,入参为： searchNum(搜索到的对象数量)
		 */
		private static function doSearchTopo(dataSource:IDataSource, elementListPanel:ElementListPanel, topoName:String, boxnames:String, topoSql:String, callback:Function = null):void
		{
			log.debug("开始搜索 {0} ......", topoName);
			dataSource.loadTopoDataBySql(topoName, boxnames, topoSql, function(data:XML):void
				{
					var topoName:String = data.@toponame;
					var netView:XML = data.child("NetView")[0];
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

					var searchNum:int = searchList.length;
					if (searchNum > 0)
					{
						// 放到列表面板中
						elementListPanel.appendDataXML(searchList);
						elementListPanel.show();
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