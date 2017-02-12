package com.linkage.module.cms.groupclientNew.control
{
	import com.adobe.serialization.json.JSON;
	import com.ailk.common.ui.gis.core.GisDynamicServiceLayer;
	import com.ailk.common.ui.gis.core.GisFeature;
	import com.ailk.common.ui.gis.core.GisFeatureLayer;
	import com.ailk.common.ui.gis.core.GisLayer;
	import com.ailk.common.ui.gis.core.metry.GisPoint;
	import com.ailk.common.ui.gis.core.styles.GisMarkerPictureStyle;
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclientNew.GroupImageModule;
	import com.linkage.module.cms.groupclientNew.GroupMonitorModule_TREE;
	import com.linkage.module.cms.groupclientNew.components.CustNetTopuComp;
	import com.linkage.module.cms.groupclientNew.data.GroupCustDataManager;
	import com.linkage.module.cms.groupclientNew.data.GroupCustDataManagerBS;
	import com.linkage.module.cms.groupclientNew.data.GroupImageDataManager;
	import com.linkage.module.cms.groupclientNew.data.GroupImageDataManagerBS;
	import com.linkage.module.cms.groupclientNew.data.GroupMonitorDataManager;
	import com.linkage.module.cms.groupclientNew.data.GroupMonitorDataManagerBS;
	import com.linkage.module.cms.groupclientNew.event.AlarmStatCompEvent;
	import com.linkage.module.cms.groupclientNew.event.ComplaintInfoEvent;
	import com.linkage.module.cms.groupclientNew.event.CustFlowAlarmWindowEvent;
	import com.linkage.module.cms.groupclientNew.event.FilterFormEvent;
	import com.linkage.module.cms.groupclientNew.event.GroupImageMapEvent;
	import com.linkage.module.cms.groupclientNew.event.HealthInfoCompEvent;
	import com.linkage.module.cms.groupclientNew.event.MonitorAlarmListWindowEvent;
	import com.linkage.module.cms.groupclientNew.event.NavTreeEvent;
	import com.linkage.module.cms.groupclientNew.event.PerfTopoTotalWindowEvent;
	import com.linkage.module.cms.groupclientNew.event.PerfTopoWindowEvent;
	import com.linkage.module.cms.groupclientNew.event.ProcessCompEvent;
	import com.linkage.module.cms.groupclientNew.event.ProdTopoNavEvent;
	import com.linkage.module.cms.groupclientNew.event.RealMonitorAlarmListWindowEvent;
	import com.linkage.module.cms.groupclientNew.event.RealMonitorCustListGroupEvent;
	import com.linkage.module.cms.groupclientNew.event.RealMonitorPerfCompEvent;
	import com.linkage.module.cms.groupclientNew.event.ResourceCompEvent;
	import com.linkage.module.cms.groupclientNew.event.SLACompEvent;
	import com.linkage.module.cms.groupclientNew.event.SheetInfoEvent;
	import com.linkage.module.cms.groupclientNew.renderer.AlarmCustRenderer;
	import com.linkage.module.cms.groupclientNew.renderer.AlarmLerver1Renderer;
	import com.linkage.module.cms.groupclientNew.renderer.AlarmLerver2Renderer;
	import com.linkage.module.cms.groupclientNew.renderer.AlarmLerver3Renderer;
	import com.linkage.module.cms.groupclientNew.renderer.AlarmLerver4Renderer;
	import com.linkage.module.cms.groupclientNew.renderer.CustAlarmGroupWarnRenderer;
	import com.linkage.module.cms.groupclientNew.renderer.CustSLAWarnRenderer;
	import com.linkage.module.cms.gsscene.view.util.ImageLayerFactory;
	import com.linkage.module.topo.framework.Constants;
	import com.linkage.module.topo.framework.controller.event.CanvasEvent;
	import com.linkage.module.topo.framework.util.TopoUtil;
	import com.linkage.system.component.panel.Window;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.ILoggingTarget;
	import com.linkage.system.logging.Log;
	import com.linkage.system.logging.LogEventLevel;
	import com.linkage.system.logging.targets.DeMonsterTarget;
	import com.linkage.system.logging.targets.MonsterTarget2;
	import com.linkage.system.utils.StringUtils;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.media.Video;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.utils.setTimeout;
	import flash.xml.XMLNode;
	
	import mx.collections.ArrayCollection;
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Alert;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.core.ClassFactory;
	import mx.core.ScrollPolicy;
	import mx.events.ListEvent;
	import mx.formatters.DateFormatter;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import spark.components.CheckBox;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.events.IndexChangeEvent;

	public class GroupImageControl extends EventDispatcher
	{
		private var loadManager:LoadManager;
		private var app:GroupImageModule;
		
		private var dataManager:GroupMonitorDataManager = null;
		private var dataManagerCust:GroupImageDataManager = null;
		
		// log
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclientNew.control.GroupImageControl");
		private var user:Object;
		private var defaultCustId:String;
		
		public var currentCityName:String;
		private var currentCityId:String;
		private var currentBussType:String;
		private var currentServLevel:String;
		public var currentCustId:String;
		public var currentCustCity:String;
		public var currentCustName:String;
		private var isPubflowAlarmInfo:Boolean=false;
		
		private static var dateFormatter:DateFormatter = new DateFormatter();

		/**
		 *事件类型：导航树地市选择 事件
		 */		
		public static const TREE_CITY_SELECT:String = "tree_city_select";
		/**
		 * 事件类型：导航树服务级别选择 事件
		 */		
		public static const TREE_LEVER_SELECT:String="tree_lever_select";
		/**
		 * 事件类型：导航树集团客户选择 事件
		 */		
		public static const TREE_CUST_SELECT:String="tree_cust_select";
		/**
		 *视图状态：属地状态 
		 */		
		public static const CITY_STATE:String = "city_state";
		/**
		 *视图状态：服务级别状态 
		 */		
		public static const LEVER_STATE:String = "lever_state";
		/**
		 *视图状态：集客状态 
		 */		
		public static const CUST_STATE:String = "cust_state";
		
		/**
		 * 集客告警参数变量
		 */		
		private var groupCusStaticParam:Object;
		
		private static const CITY_ALL:String="00";
		private static const CITY_TransProvince:String="0000";
		private static const CITY_Province:String="000";
		public var layerCache:Object = {};
		public var curParam:Object;
		public function GroupImageControl(app:GroupImageModule,target:IEventDispatcher=null)
		{
//			super(target);
			var userParams:String = String(app.parameters["user"]).replace(/\'/g, "\"");
			log.info("user--->"+userParams);
			user = JSON.decode(userParams);
			this.app = app;
			defaultCustId = String(app.parameters["custId"]);
			loadManager=app.loadManager;
			
			log.info("defaultCustId:"+defaultCustId);
			dataManager = new GroupMonitorDataManagerBS(String(app.parameters["urlContext"]));
			
			dataManagerCust = new GroupImageDataManagerBS(String(app.parameters["urlContext"]));
//			initTreeData();
			//initServerTypes();
			addEventListener(TREE_CITY_SELECT,treeCitySelectHandler);
			addEventListener(TREE_LEVER_SELECT,treeLeverSelectHandler);
			addEventListener(TREE_CUST_SELECT,treeCustSelectHandler);
		}
		private var treeHttpService:HTTPService;
		public function initTreeData():void{
//			log.info("init tree data");
//			var param:Object = new Object();
//			param.areaId = user.areaId;
//			dataManager.getNavTree(param,getNavTreeHandler);
			loadManager.showLoading("加载数据，请稍后");
			if(!treeHttpService){
				treeHttpService = new HTTPService();
				treeHttpService.method="POST";
				treeHttpService.resultFormat = "e4x";
				treeHttpService.url = String(app.parameters["urlContext"])+"/cms/groupcustom/tree/gctree!getDefaultTree.action";
				treeHttpService.addEventListener(ResultEvent.RESULT,getNavTreeXMLHandler);
			}
			var param:Object = new Object;
			param.area_id=Number(user.areaId);
			if(defaultCustId){
				param.cust_id=String(defaultCustId);
			}
			log.info("[获取默认树]area_id:"+param.area_id+",cust_id:"+param.cust_id);
			log.info(param);
			treeHttpService.send(param);
		}
		
		private function getNavTreeXMLHandler(resultEvent:ResultEvent):void{
			loadManager.hideLoading();
			try{
				app.treeData=treeHttpService.lastResult as XML;
			}catch(e:Error){
				Alert.show(e.message.toString(),"ERROR");
				return;
			}
			app.navTree.validateNow();
			if(defaultCustId){
				custSelected(defaultCustId);
//				log.info("1111");
//				expandTreeItemByCustId(defaultCustId,app.treeData.children());
			}else{
//				app.navTree.expandItem(app.treeData[0],true);
				log.info(XML(XML(app.treeData[0]).child(2)).child(0));
				
				expandParent(XML(XML(app.treeData[0]).child(2)));
				var param:Object = new Object();
				param.area_id = Number(user.areaId); 
				param.cityId = String(XML(app.treeData[0]).child(2).@B);
				param.cityName = String(XML(app.treeData[0]).child(2).@A);
//				param.servLevel = String(XML(XML(app.treeData[0]).child(2)).child(0).@C);
				param.servLevel = "ALL";
				log.info(param);
//				loadManager.showLoading();
//				dataManagerCust.getCustInfo(param,getCustListHandler);
				showLayer(param);
			}
			
		}
		
		private var treeOpenItem:Object;
//		public function treeItemOpen(event:TreeEvent):void{
//			treeOpenItem = event.item;
//			log.info("[treeItemOpen]@C:"+Boolean(String(treeOpenItem.@C)));
//			if(Boolean(String(treeOpenItem.@C))){
//				treeOpenItem.@cp=1;
//				loadTreeOpenItem();
//			}
//		}
		
		private var treeHttpService1:HTTPService;
		private function loadTreeOpenItem():void{
			if(!treeHttpService1){
				treeHttpService1 = new HTTPService();
				treeHttpService1.url = String(app.parameters["urlContext"])+"/cms/groupcustom/tree/gctree!getSubTree.action";
				treeHttpService1.method="POST";
				treeHttpService1.resultFormat = "e4x";
				treeHttpService1.addEventListener(ResultEvent.RESULT,treeItemOpenHandler);
			}
			var param:Object = new Object;
			param.area_id=Number(user.areaId);
			param.city_id=String(app.navTree.getParentItem(treeOpenItem).@B);
			param.serv_level=Number(treeOpenItem.@C);
			param.requestpagenum=Number(treeOpenItem.@cp);
			param.name = String(app.navTree.getParentItem(treeOpenItem).@A);
			log.info("[获取某个服务等级的节点树]area_id:"+param.area_id+",city_id:"+param.city_id+",serv_level:"+param.serv_level+",requestpagenum:"+param.requestpagenum);
			treeHttpService1.send(param);
		}
		
		public function treeItemOpenHandler(resultEvent:ResultEvent):void{
			log.info("[treeItemOpenHandler]"+treeHttpService.lastResult);
			var result:XML = treeHttpService1.lastResult as XML;
			treeOpenItem.@cp=result.@cp;
			treeOpenItem.@tp=result.@tp;
			(treeOpenItem as XML).setChildren(result.children());
//			app.myTree.dataProvider = app.treeData;
			app.navTree.expandItem(treeOpenItem,false);
			expandParent(treeOpenItem as XML);
			app.navTree.selectedItem = treeOpenItem;
			var index:Number = app.navTree.getItemIndex(treeOpenItem);
			app.navTree.verticalScrollPosition=index;
//			app.myTree.invalidateDisplayList();
//			app.myTree.expandItem(treeOpenItem,true);
		}
		
		/**
		 *定位集客 
		 * @param custId
		 * @param childNodes
		 * 
		 */		
		private function expandTreeItemByCustId(custId:String,childNodes:XMLList):void{
			for each(var node:XML in childNodes){
//				log.info("=--->"+node.@A);
				log.info("expandTreeItemByCustId"+node.@D);
				if(custId == node.@D){
					app.navTree.expandItem(node.parent(),true);
					expandParent(node.parent().parent());
					app.navTree.selectedItem=node;
					var index:Number = app.navTree.getItemIndex(node);
					app.navTree.verticalScrollPosition=index;
					app.navTree.dispatchEvent(new ListEvent(ListEvent.CHANGE));
					break;
				}else if(node.hasComplexContent()){
					expandTreeItemByCustId(custId,node.children());
				}
			}
		}
		/**
		 *层层展开父节点 
		 * @param item
		 * 
		 */		
		private function expandParent(item:XML):void{
			log.info("expandParent");
			if(item && !app.navTree.isItemOpen(item)){
				app.navTree.expandItem(item,true);
				expandParent(item.parent());
			}
		}
	
		/**
		 *树选择处理 
		 * @param event
		 * 
		 */		
		public function treeChang(event:ListEvent):void
		{
			log.info("treeChang");
			log.info(event.target.selectedItem);
			var item:Object=event.target.selectedItem;
			if(Boolean(String(item.@pageChange))){
				log.info("[treeChang]分页展示服务级别集客:"+item);
				treeOpenItem = item;
				loadTreeOpenItem();
				item.@pageChange = "";
				return;
			}
			if(Boolean(String(item.@servClick))){
				log.info("[treeChang]展开服务级别集客:"+item);
				treeOpenItem = item;
				treeOpenItem.@cp=1;
				loadTreeOpenItem();
				item.@servClick="";
			}
			var param:Object=new Object();
			if (!StringUtils.isEmpty(item.@B))
			{
				log.info("111");
				currentCityId = String(item.@B);
				currentCityName = String(item.@A);
				currentServLevel=null;
				currentCustId=null;
				currentBussType=null;
				dispatchEvent(new Event(TREE_CITY_SELECT));
			}
			else if (!StringUtils.isEmpty(item.@C))
			{
				log.info("222");
				currentCityId = String(event.target.getParentItem(item).@B);
				currentCityName = String(event.target.getParentItem(item).@A);
				currentServLevel = String(item.@C);
				currentCustId=null;
				currentBussType=null;
				dispatchEvent(new Event(TREE_LEVER_SELECT));
			}
			else if (!StringUtils.isEmpty(item.@D))
			{
				log.info("333");
				currentCityId = String(event.target.getParentItem(event.target.getParentItem(item)).@B);
				currentCityName = String(event.target.getParentItem(event.target.getParentItem(item)).@A);
				currentServLevel = String(event.target.getParentItem(item).@C);
				currentCustId = String(item.@D);
				currentCustCity = String(item.@F);
				currentCustName = String(item.@A);
				currentBussType=null;
				dispatchEvent(new Event(TREE_CUST_SELECT));
			}
			else if (!StringUtils.isEmpty(item.@G))
			{
				log.info("444");
				currentCityId = String(event.target.getParentItem(event.target.getParentItem(event.target.getParentItem(item))).@B);
				currentCityName = String(event.target.getParentItem(event.target.getParentItem(event.target.getParentItem(item))).@A);
				currentServLevel = String(event.target.getParentItem(event.target.getParentItem(item)).@C);
				currentCustId = String(event.target.getParentItem(item).@D);
				currentBussType = String(item.@G);
			}else{//全省
				log.info("555");
				currentCityId = CITY_ALL;
				currentCityName = "全省";
				currentServLevel=null;
				currentCustId=null;
				currentBussType=null;
				dispatchEvent(new Event(TREE_CITY_SELECT));
			}
			log.info("treeChang:[cityId:"+currentCityId+"][lerverId:"+currentServLevel+"][custId:"+currentCustId+"][bussType:"+currentBussType+"]");
		}
		/**
		 *树属地选择处理 
		 * @param event
		 * 
		 */		
		private function treeCitySelectHandler(event:Event):void{
			
			var param:Object = new Object();
			param.cityName = this.currentCityName;
			param.cityId = this.currentCityId;
			param.area_id = Number(this.user.areaId);
			param.servLevel = "ALL";
			log.info(param);
//			loadManager.showLoading();
//			dataManagerCust.getCustInfo(param,getCustListHandler);
			log.info("[点击地市]");
//			log.info(layerCache);
			showLayer(param);
		}
		
		/**
		 *树服务级别选择处理 
		 * @param event
		 * 
		 */		
		private function treeLeverSelectHandler(event:Event):void{
			var param:Object = new Object();
			param.servLevel = this.currentServLevel;
			param.cityName = this.currentCityName;
			param.cityId = this.currentCityId;
			param.area_id = Number(this.user.areaId);
			log.info(param);
//			loadManager.showLoading();
//			dataManagerCust.getCustInfo(param, this.getCustListHandler);
			log.info("[点击服务等级]");
//			log.info(layerCache);
			showLayer(param);
		}
		/**
		 *树集客选择处理 
		 * @param event
		 * 
		 */		
		private function treeCustSelectHandler(event:Event):void{
			
			log.info("树集客选择处理  currentCustId:" + this.currentCustId);
			var param:* = new Object();
			param.custId = this.currentCustId;
			param.custName = this.currentCustName;
			param.cityName = this.currentCityName;
			param.cityId = this.currentCityId;
			param.area_id = Number(this.user.areaId);
			log.info(param);
//			loadManager.showLoading();
			dataManagerCust.getCustInfo(param,getCustListHandler);
		}
		
		private var dlayer:GisDynamicServiceLayer = new GisDynamicServiceLayer(); 
		
		private function showLayer(param:Object):void{
			curParam = param;
			var layerData:Object = layerCache[param.cityId];
			log.info("showLayer");
			log.info(layerData);
			if(dlayer && app.mapWork.map.getGisLayer(dlayer.id)){
				app.mapWork.map.removeGisLayer(dlayer);
			}
			if(layerData){
				var layerUrl:String=layerData.layerUrl;
				var showIds:String = layerData.layerMap[param.servLevel]["showIds"];
				log.info(layerUrl);
				log.info(showIds);
				dlayer.url = layerUrl;
				dlayer.visibleLayers = new ArrayCollection(showIds.split(','));
				app.mapWork.map.addGisLayer(dlayer);
			}
		}
		
		private function getCustListHandler(result:ArrayCollection):void{
//			mapPointShowHandler(result);
			
			loadManager.hideLoading();
			var e:GroupImageMapEvent = new GroupImageMapEvent(GroupImageMapEvent.MAPPOINTSHOW);
			e.param = result;
			log.info("getCustListHandler~~~~~");
			dispatchEvent(e);
		}
		
		
		
//		private function featureClickHandler(param1:GisFeature, param2:MouseEvent) : void
//		{
//			var gisFeature:* = param1;
//			var event:* = param2;
//			var data:* = gisFeature.attributes;
//			this.moInfoData = data;
//			this.custId = this.moInfoData["cust_no"];
//			log.info("featureClickHandler");
//			log.info(this.moInfoData);
//			this.moInfoPanel.visible = true;
//			this.moInfoPanel.includeInLayout = true;
//			this.moInfoPanel.x = this.mouseX + 5;
//			this.moInfoPanel.y = this.mouseY;
//			setTimeout(function () : void
//			{
//				log.info("setTimeout");
//				moInfoPanel.visible = false;
//				moInfoPanel.includeInLayout = false;
//				return;
//			}// end function
//				, 20 * 1000);
//			return;
//		}
		
		private var treeHttpService2:HTTPService;
		public function custSelected(custId:String):void{
			log.info("[集客选择]:"+custId);
			if(custId){
				defaultCustId = custId;
				if(!treeHttpService2){
					treeHttpService2 = new HTTPService();
					treeHttpService2.method="POST";
					treeHttpService2.resultFormat = "e4x";
					treeHttpService2.url = String(app.parameters["urlContext"])+"/cms/groupcustom/tree/gctree!getSubTreeByCustId.action";
					treeHttpService2.addEventListener(ResultEvent.RESULT,custSelectedHandler);
				}
				
				var param:Object = new Object;
				param.area_id=Number(user.areaId);
				param.cust_no=defaultCustId;
				log.info("[获取某个集客所在的节点的树]area_id:"+param.area_id+",cust_no:"+param.cust_no);
//				treeHttpService2.send(param);
				treeHttpService2.send(param);
			}
		}
		
		public var isRunStatOpen:Boolean = false;
		private function custSelectedHandler(resultEvent:ResultEvent):void{
			var result:XML = treeHttpService2.lastResult as XML;
			log.info("custSelectedHandler2:"+result);
			//TODO
//			setTreeItemByServ(result,app.treeData.children());
//			if(result){
//				setTreeItemByServ(defaultCustId,result,app.treeData.children());
			try{
				setTreeItemByServ(defaultCustId,result,app.treeData);
			}catch(e:Error){
//				Alert.show("设置集客节点异常！","错误");
			}
			
//			}else{
//				Alert.show("集客不存在或无此集客权限！","提示");
//			}
			
//			expandTreeItemByCustId(defaultCustId,app.treeData.children());
		}
		
		/**
		 *设置集客树节点
		 * @param result
		 * @param childNodes
		 * 
		 */		
		private function setTreeItemByServ(custId:String,result:XML,childNodes:XML):void{
			for each(var node:XML in childNodes.children()){
				if(result.@B == node.@B){
					app.navTree.expandItem(node.parent(),true);
					for each(var child:XML in node.children()){
						if(result.@C == child.@C){
							app.navTree.expandItem(node,true);
							child.@cp=result.@cp;
							child.@tp=result.@tp;
							child.setChildren(result.children());
							app.navTree.expandItem(child,true);
							for each(var cust:XML in child.children()){
								if(custId == cust.@D){
									app.navTree.selectedItem=cust;
									var index:Number = app.navTree.getItemIndex(cust);
									app.navTree.verticalScrollPosition=index;
									app.navTree.dispatchEvent(new ListEvent(ListEvent.CHANGE));
									break;
								}
							}
							break;
						}
					}
					break;
				}
			}
//			for each(var node:XML in childNodes){
//				if(result.@B == node.@B){
//					for each(var child:XML in node.children()){
//						if(result.@C == child.@C){
//							child.@cp=result.@cp;
//							child.@tp=result.@tp;
//							child.setChildren(result.children());
//							for each(var cust:XML in child.children()){
//								if(custId == cust.@D){
//									expandParent(cust);
//									app.navTree.selectedItem=cust;
//									var index:Number = app.navTree.getItemIndex(cust);
//									app.navTree.verticalScrollPosition=index;
//									app.navTree.dispatchEvent(new ListEvent(ListEvent.CHANGE));
//									break;
//								}
//							}
//							break;
//						}
//					}
//					break;
//				}
				//else if(node.hasComplexContent()){
				//	setTreeItemByServ(custId,result,node.children());
				//}
//			}
		}
		
		
		private function buildColumns(result:Object):Array{
			var columns:Array = new Array();
			var i:Number=0;
			for each(var name:String in result.name){
//				log.info("[buildColumns]name:"+name+",column:"+result.colum[i]);
				var dataGridColumn:AdvancedDataGridColumn = new AdvancedDataGridColumn();
				dataGridColumn.width=100;
				dataGridColumn.headerText = name;
				dataGridColumn.dataField = result.colum[i];
				columns.push(dataGridColumn);
				i++;
			}
			return columns;
		}
		
		public function initFilter():void{
			var param:Object = new Object;
			param.areaId=user.areaId;
			dataManager.getCityList(param,getCityListHandler);
			dataManager.getAllServ(param,getAllServHandler);
			dataManager.getServLevel(param,getServLevelHandler);
		}
		
		private function getCityListHandler(result:Object):void{
			var evt:FilterFormEvent = new FilterFormEvent(FilterFormEvent.CITYCHANGE);
			evt.param = result;
			app.filterForm.dispatchEvent(evt);
		}
		
		private function getAllServHandler(result:Object):void{
			var evt:FilterFormEvent = new FilterFormEvent(FilterFormEvent.SERVTYPECHANGE);
			evt.param = result;
			app.filterForm.dispatchEvent(evt);
		}
		
		private function getServLevelHandler(result:Object):void{
			var evt:FilterFormEvent = new FilterFormEvent(FilterFormEvent.SERVLEVELCHANGE);
			evt.param = result;
			app.filterForm.dispatchEvent(evt);
		}
		
		public function queryCustByFilter(param:Object):void{
			if(app.currentState != CITY_STATE){
				app.currentState=CITY_STATE;
			}
			groupCusStaticParam = param;
			groupCusStaticParam.areaId = String(user.areaId);
			
			log.info(param);
			loadManager.showLoading();
			dataManagerCust.getCustInfo(param,getCustListHandler);
		/*	var filter:String="ismetropolis!=";
			var cityName:String = groupCusStaticParam.cityName;
			var cityLever:String = groupCusStaticParam.cityLever;
			var servTypeName:String = groupCusStaticParam.servTypeName;
			var servLevel:String = groupCusStaticParam.servLevel;
			var custName:String = groupCusStaticParam.cusName;
			var servName:String = groupCusStaticParam.servName;*/
		}

		private function onComplete():void{
		}
		
		private function onError(event:FaultEvent):void{
			loadManager.hideLoading();
		}
		
		
		public function queryCustByExtends():void{
			if(curParam.servLevel=="ALL"){
				delete curParam.servLevel;
			}
			curParam.minX = app.mapWork.map.gisExtent.xmin;
			curParam.minY = app.mapWork.map.gisExtent.ymin;
			curParam.maxX = app.mapWork.map.gisExtent.xmax;
			curParam.maxY = app.mapWork.map.gisExtent.ymax;
			log.info("[queryCustByExtends]");
			log.info(curParam);
			dataManagerCust.getCustInfo(curParam,getCustListHandler);
		}
	}
}