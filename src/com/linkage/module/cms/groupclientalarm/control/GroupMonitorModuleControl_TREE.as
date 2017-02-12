package com.linkage.module.cms.groupclientalarm.control
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclientalarm.GroupMonitorModule_TREE;
	import com.linkage.module.cms.groupclientalarm.data.GroupMonitorDataManager;
	import com.linkage.module.cms.groupclientalarm.data.GroupMonitorDataManagerBS;
	import com.linkage.module.cms.groupclientalarm.event.AlarmStatCompEvent;
	import com.linkage.module.cms.groupclientalarm.event.CustFlowAlarmWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.FilterFormEvent;
	import com.linkage.module.cms.groupclientalarm.event.HealthInfoCompEvent;
	import com.linkage.module.cms.groupclientalarm.event.MonitorAlarmListWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.NavTreeEvent;
	import com.linkage.module.cms.groupclientalarm.event.PerfTopoTotalWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.PerfTopoWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.ProcessCompEvent;
	import com.linkage.module.cms.groupclientalarm.event.ProdTopoNavEvent;
	import com.linkage.module.cms.groupclientalarm.event.RealMonitorAlarmListWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.RealMonitorCustListGroupEvent;
	import com.linkage.module.cms.groupclientalarm.event.RealMonitorPerfCompEvent;
	import com.linkage.module.cms.groupclientalarm.event.ResourceCompEvent;
	import com.linkage.module.cms.groupclientalarm.event.SLACompEvent;
	import com.linkage.module.cms.groupclientalarm.renderer.AlarmCustRenderer;
	import com.linkage.module.cms.groupclientalarm.renderer.AlarmLerver1Renderer;
	import com.linkage.module.cms.groupclientalarm.renderer.AlarmLerver2Renderer;
	import com.linkage.module.cms.groupclientalarm.renderer.AlarmLerver3Renderer;
	import com.linkage.module.cms.groupclientalarm.renderer.AlarmLerver4Renderer;
	import com.linkage.module.cms.groupclientalarm.renderer.CustAlarmGroupWarnRenderer;
	import com.linkage.module.cms.groupclientalarm.renderer.CustSLAWarnRenderer;
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
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	import flash.utils.setTimeout;
	
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

	/**
	 * 
	 * @author shiliang
	 * 
	 */	
	public class GroupMonitorModuleControl_TREE extends EventDispatcher
	{
		private var loadManager:LoadManager;
		private var app:GroupMonitorModule_TREE;
		private var dataManager:GroupMonitorDataManager = null;
		// log
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclientalarm.control.GroupMonitorModuleControl_TREE");
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
		
		public function GroupMonitorModuleControl_TREE(app:GroupMonitorModule_TREE,target:IEventDispatcher=null)
		{
			super(target);
			var userParams:String = String(app.parameters["user"]).replace(/\'/g, "\"");
			log.info("user--->"+userParams);
			user = JSON.decode(userParams);
			this.app = app;
			defaultCustId = String(app.parameters["custId"]);
			log.info("defaultCustId--->"+defaultCustId);
			loadManager=app.loadManager;
			dataManager = new GroupMonitorDataManagerBS(String(app.parameters["urlContext"]));
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
//				expandTreeItemByCustId(defaultCustId,app.treeData.children());
			}else{
				app.navTree.expandItem(app.treeData[0],true);
				currentCityId = app.treeData[0].@B;
				currentCityName=app.treeData[0].@A;
				currentServLevel=null;
				currentCustId=null;
				currentBussType=null;
				dispatchEvent(new Event(TREE_CITY_SELECT));
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
			windowRestore();
			app.currentState = CITY_STATE;
			groupCusStaticParam = new Object();
			showRealMonitor();
			if(currentCityId){
				groupCusStaticParam.cityId = currentCityId;
				groupCusStaticParam.areaId = String(user.areaId);
				app.custListGroup.dispatchEvent(new RealMonitorCustListGroupEvent(RealMonitorCustListGroupEvent.REFRESH));
				var filter:String;
				if(currentCityName == '跨省')
					filter="ismetropolis=\"3\"";
				else if(currentCityName == '省级')
					filter="ismetropolis=\"2\"";
				else if(currentCityName == '全省'){
					filter="ismetropolis!=";
				}else{
					filter="ismetropolis!=&custcity=\""+currentCityName+"\"";
				}
				//filter += "&alarmseverity=1";
				log.info('---->>##<<----  过滤告警：' + filter);
				try{
					pubflowAlarmFilter(filter,true);
				}catch(e:Error){
					log.info("集客流水窗口过滤告警失败");
				}
			}
		}
		
		/**
		 *树服务级别选择处理 
		 * @param event
		 * 
		 */		
		private function treeLeverSelectHandler(event:Event):void{
			windowRestore();
			app.currentState = LEVER_STATE;
			groupCusStaticParam = new Object();
			showRealMonitor();
			if(currentCityId){
				groupCusStaticParam.cityId = currentCityId;
				if(currentServLevel){
					groupCusStaticParam.servLevel=currentServLevel;
					var filter:String;
					if(currentCityName == '跨省')
						filter="ismetropolis=\"3\"";
					else if(currentCityName == '省级')
						filter="ismetropolis=\"2\"";
					else if(currentCityName == '全省'){
						filter="ismetropolis!=";
					}else{
						//filter="ismetropolis!=&businesslevel="+currentServLevel+"&custcity=\""+currentCityName+"\"";
						filter="ismetropolis!=&custcity=\""+currentCityName+"\"";
					}
					filter += "&businesslevel="+currentServLevel;
					//filter += "&alarmseverity=1";
					pubflowAlarmFilter(filter,true);
				}
				groupCusStaticParam.areaId = String(user.areaId);
				app.custListGroup.dispatchEvent(new RealMonitorCustListGroupEvent(RealMonitorCustListGroupEvent.REFRESH));
			}
		}
		/**
		 *树集客选择处理 
		 * @param event
		 * 
		 */		
		private function treeCustSelectHandler(event:Event):void{
			windowRestore();
			app.currentState = CUST_STATE;
			var indexChaneEvent:IndexChangeEvent = new IndexChangeEvent(IndexChangeEvent.CHANGE);
			indexChaneEvent.newIndex = app.rightTabBar.selectedIndex;
			app.rightTabBar.dispatchEvent(indexChaneEvent);
			var filter:String="ismetropolis!=&groupcustomerid=\"" + currentCustId + "\"";
			pubflowAlarmFilter(filter);
			//TODO
			app.img3.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			/*if(app.custRealPerfComp){
				log.info("custRealPerfComp");
				app.custRealPerfComp.dispatchEvent(new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERQUERY));
			}*/
		}
		/**
		 *重载告警 
		 * @param filter
		 * @param flag-true:设置页面过滤规则，false:不设置
		 * 
		 */		
		private function pubflowAlarmFilter(filter:String,flag:Boolean=false):void{
			log.info("加载集客流水："+filter+","+flag);
			var param:Object = new Object();
			param.filter = filter;
			param.flag = flag;
			if(app.alarmWindow){
				var evt:CustFlowAlarmWindowEvent = new CustFlowAlarmWindowEvent(CustFlowAlarmWindowEvent.LOADALARM);
				evt.param = param;
				app.alarmWindow.dispatchEvent(evt);
			}
		}
		
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
			if(isRunStatOpen){
				showRunStat();
				isRunStatOpen = false;
			}
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
				log.info("[buildColumns]name:"+name+",column:"+result.colum[i]);
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
		
		private function windowRestore():void{
			log.info("windowRestore");
			if(app.alarmWindow && !app.alarmWindow.visible){
				app.alarmWindow.visible=true;
				app.alarmWindow.includeInLayout=true;
				app.alarmWindow.restoreButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			}
		}
			
		/**
		 *切换到实时监控视图 
		 * 
		 */		
		public function showRealMonitor():void{
			if(app.rightTabBar.selectedIndex!=0){
				app.rightTabBar.selectedIndex=0;
				var indexChangeEvent:IndexChangeEvent = new IndexChangeEvent(IndexChangeEvent.CHANGE);
				indexChangeEvent.newIndex=0;
				app.rightTabBar.dispatchEvent(indexChangeEvent);
			}
		}
		/**
		 * 切换到运行统计视图 
		 * 
		 */		
		public function showRunStat():void{
			if(app.rightTabBar.selectedIndex!=1){
				app.rightTabBar.selectedIndex=1;
				var indexChangeEvent:IndexChangeEvent = new IndexChangeEvent(IndexChangeEvent.CHANGE);
				indexChangeEvent.newIndex=1;
				app.rightTabBar.dispatchEvent(indexChangeEvent);
			}
		}

		public function filterAlarm(filter:String):void{
			var alarmregion:String;
			if(currentCityName == '跨省')
				alarmregion="&ismetropolis=\"3\"";
			else if(currentCityName == '省级')
				alarmregion="&ismetropolis=\"2\"";
			else{
//				alarmregion="&alarmregion=\""+currentCityName+"\"";
			}
			log.info("[filterAlarm]:"+filter+"&groupcustomerid=\""+currentCustId+"\"");
			pubflowAlarmFilter(filter+"&groupcustomerid=\""+currentCustId+"\"");
//			app.pubflowAlarm.reload(filter+"&groupcustomerid=\""+currentCustId+"\"&alarmregion=\""+alarmregion);
//			app.pubflowAlarm.filterAlarm=filter+"&groupcustomerid="+currentCustId+"&alarmregion="+currentCityName;
		}
		
		public function queryAlarmByProduct(productId:String, startTime:String, endTime:String,searchFlag:String=null):void
		{
			var param:Object = new Object();
			param.product_id = productId;
			param.cust_no = currentCustId;
			param.start_time = startTime;
			param.end_time = endTime;
			if(searchFlag){
				param.searchFlag = searchFlag;
			}
			loadManager.showLoading();
			log.info("查询集客告警信息参数： product_id＝" +productId+",cust_no=" + currentCustId + ",start_time=" + startTime + ",end_time=" + endTime+",searchFlag="+searchFlag);
			dataManager.getAlarmList(param,loadAlarmByProductSucc,null,loadAlarmByProductErr);
		}
		
		private function loadAlarmByProductSucc(obj:Object):void
		{
			loadManager.hideLoading();
			var evt:MonitorAlarmListWindowEvent = new MonitorAlarmListWindowEvent(MonitorAlarmListWindowEvent.DATACHANGE);
			evt.param = obj;
			app.alarmListWindow.dispatchEvent(evt);
		}
		
		private function loadAlarmByProductErr(obj:Object):void
		{
			loadManager.hideLoading();
			log.error("查询集客告警信息失败！"+obj);
		}
		
		private function showAlarmListWindow(flag:Boolean):void{
			app.alarmListWindow.visible = flag;
			app.alarmListWindow.x=(app.width-app.alarmListWindow.width)/2;
			app.alarmListWindow.y=(app.height-app.alarmListWindow.height)/2;
		}
		
		public function queryCustByFilter(param:Object):void{
			if(app.currentState != CITY_STATE){
				app.currentState=CITY_STATE;
			}
			windowRestore();
			showRealMonitor();
			groupCusStaticParam = param;
			groupCusStaticParam.areaId = String(user.areaId);
			app.custListGroup.dispatchEvent(new RealMonitorCustListGroupEvent(RealMonitorCustListGroupEvent.REFRESH));
			//TODO
			
			var filter:String="ismetropolis!=";
			var cityName:String = groupCusStaticParam.cityName;
			var cityLever:String = groupCusStaticParam.cityLever;
			var servTypeName:String = groupCusStaticParam.servTypeName;
			var servLevel:String = groupCusStaticParam.servLevel;
			var custName:String = groupCusStaticParam.cusName;
			var servName:String = groupCusStaticParam.servName;
			if(cityName != "全部"){
				if(cityLever == "1"){
					filter += "&custcity=\""+cityName+"\"";
				}else if(cityLever == "2"){
					filter += "&custcounty=\""+cityName+"\"";
				}
			}
			
			if(servTypeName && servTypeName != "全部"){
				filter += "&businesssystem=\""+servTypeName+"\"";
			}
			
			if(servLevel){
				filter += "&businesslevel=\""+servLevel+"\"";
			}
			
			if(custName && custName != ""){
				filter += "&groupcustomer%=\""+custName+"\"";
			}
			if(servName && servName != ""){
				filter += "&cusbuss_id=\""+servName+"\"";
			}
			pubflowAlarmFilter(filter);
		}
		
		private var time:Number;
		public function queryAlarmCust(param:Object):void{
			groupCusStaticParam.curPage_splitPage=param.curPage_splitPage;
			groupCusStaticParam.num_splitPage = param.num_splitPage;
			
			log.info("[加载有告警的集客]areaId:"+groupCusStaticParam.areaId+",cityId:"+groupCusStaticParam.cityId+",servLevel:"+groupCusStaticParam.servLevel+",servType:"+groupCusStaticParam.servType+",cusName:"+groupCusStaticParam.cusName+",curPage_splitPage:"+groupCusStaticParam.curPage_splitPage+",num_splitPage:"+groupCusStaticParam.num_splitPage);
			log.info(groupCusStaticParam);
			loadManager.showLoading("加载数据，请稍后");
			time = new Date().getTime();
			dataManager.getAlarmGroupCusStatic(groupCusStaticParam,queryAlarmCustHandler,onComplete,onError);
		}
		
		private function queryAlarmCustHandler(result:Object):void{
			log.info("[加载有告警的集客所需时间]"+(new Date().getTime()-time));
			time = new Date().getTime();
			loadManager.hideLoading();
			var data:Object = result;
			var evt:RealMonitorCustListGroupEvent = new RealMonitorCustListGroupEvent(RealMonitorCustListGroupEvent.DATACHANGE);
			evt.param = data;
			app.custListGroup.dispatchEvent(evt);
			log.info("[渲染有告警的集客所需时间]"+(new Date().getTime()-time));
			//TODO
//			filterCustsAlarm(data.dataList);
		}
		
//		private function filterCustsAlarm(dataList:Object):void{
//			var custIds:Array = new Array;
//			for each(var cust:Object in dataList){
//				custIds.push(cust.cust_no);
//			}
//			
//			
//		}
		
		public function queryAllCust(param:Object):void{
			groupCusStaticParam.curPage_splitPage=param.curPage_splitPage;
			groupCusStaticParam.num_splitPage = param.num_splitPage;
			log.info("[加载所有集客]areaId:"+groupCusStaticParam.areaId+",cityId:"+groupCusStaticParam.cityId+",servLevel:"+groupCusStaticParam.servLevel+",servType:"+groupCusStaticParam.servType+",cusName:"+groupCusStaticParam.cusName+",curPage_splitPage:"+groupCusStaticParam.curPage_splitPage+",num_splitPage:"+groupCusStaticParam.num_splitPage);
			log.info(groupCusStaticParam);
			loadManager.showLoading("加载数据，请稍后");
			dataManager.getGroupCusStatic(groupCusStaticParam,queryAllCustHandler,onComplete,onError);
		}
		
		private function queryAllCustHandler(result:Object):void{
			loadManager.hideLoading();
			var data:Object = result;
			var evt:RealMonitorCustListGroupEvent = new RealMonitorCustListGroupEvent(RealMonitorCustListGroupEvent.DATACHANGE);
			evt.param = data;
			app.custListGroup.dispatchEvent(evt);
//			//TODO
//			filterCustsAlarm(data.dataList);
		}
		
		public function realCustAlarmQuery():void{
			if(currentCustId){
				var param:Object = new Object();
				param.custId = currentCustId;
				log.info("[根据集客ID加载告警]custId:"+param.custId);
				loadManager.showLoading("加载数据，请稍后");
				dataManager.getGroupCusStaticByCust(param,realCustAlarmQueryHandler,onComplete,onError);
			}
		}
		
		private function realCustAlarmQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorAlarmListWindowEvent = new RealMonitorAlarmListWindowEvent(RealMonitorAlarmListWindowEvent.DATACHANGE);
			evt.param = result;
			app.custAlarmWindow.dispatchEvent(evt);
		}
		
		public function custNumQuery():void{
			
			log.info("[获取告警集客数量和总数]areaId:"+groupCusStaticParam.areaId+",cityId:"+groupCusStaticParam.cityId+",servLevel:"+groupCusStaticParam.servLevel+",servType:"+groupCusStaticParam.servType+",cusName:"+groupCusStaticParam.cusName+",curPage_splitPage:"+groupCusStaticParam.curPage_splitPage+",num_splitPage:"+groupCusStaticParam.num_splitPage);
			log.info(groupCusStaticParam);
			dataManager.getCustNum(groupCusStaticParam,custNumQueryHandler,onComplete,onError);
		}
		
		private function custNumQueryHandler(result:Object):void{
			var evt:RealMonitorCustListGroupEvent = new RealMonitorCustListGroupEvent(RealMonitorCustListGroupEvent.CUSTNUMCHANGE);
			evt.param = result;
			log.info("影响客户数："+Number(result));
			app.custListGroup.dispatchEvent(evt);
		}
		
		public function realPerfQuery(param:Object):void{
			loadManager.showLoading();
			param.cusId = currentCustId;
			dataManager.getRealPm(param,realPerfQueryHandler,onComplete,onError);
		}
		
		private function realPerfQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.PERFDATACHANGE);
			evt.param = result;
//			app.custRealPerfComp.dispatchEvent(evt);
		}
		
		public function realPerfServerTypeQuery():void{
			var param:Object = new Object();
			if(currentCustId){
				param.custId = currentCustId;
				log.info("[根据集客ID加载集客业务]custId:"+param.custId);
				loadManager.showLoading();
				dataManager.getServByCust(param,realPerfServerTypeQueryHandler,onComplete,onError);
			}
		}
		
		private function realPerfServerTypeQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERCHANGE);
			evt.param = result;
//			app.custRealPerfComp.dispatchEvent(evt);
		}
		
		public function realPerfServerTargetQuery(param:Object):void{
			loadManager.showLoading();
			dataManager.getServertarget(param,realPerfServerTargetQueryHandler,onComplete,onError);
		}
		
		private function realPerfServerTargetQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERTARGETCHANGE);
			evt.param = result;
//			app.custRealPerfComp.dispatchEvent(evt);
		}
		
		/////////////////////////////////////////////
		
		private function onComplete():void{
			loadManager.hideLoading();
		}
		private function onError(event:FaultEvent):void{
			loadManager.hideLoading();
		}
		
	}
}