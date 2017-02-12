package com.linkage.module.cms.groupclientNew.control
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclientNew.GroupMonitorModule_TREE;
	import com.linkage.module.cms.groupclientNew.components.CustNetTopuComp;
	import com.linkage.module.cms.groupclientNew.data.GroupCustDataManager;
	import com.linkage.module.cms.groupclientNew.data.GroupCustDataManagerBS;
	import com.linkage.module.cms.groupclientNew.data.GroupMonitorDataManager;
	import com.linkage.module.cms.groupclientNew.data.GroupMonitorDataManagerBS;
	import com.linkage.module.cms.groupclientNew.event.AlarmStatCompEvent;
	import com.linkage.module.cms.groupclientNew.event.ComplaintInfoEvent;
	import com.linkage.module.cms.groupclientNew.event.CustFlowAlarmWindowEvent;
	import com.linkage.module.cms.groupclientNew.event.FilterFormEvent;
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
		private var dataManagerCust:GroupCustDataManager = null;
		// log
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclientNew.control.GroupMonitorModuleControl_TREE");
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
			loadManager=app.loadManager;
			
			dataManagerCust = new GroupCustDataManagerBS(String(app.parameters["urlContext"]));
			
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
		
		
		public function topoInit():void{
			log.info("topo:"+app.topo);
			app.topo.iconContext = app.parameters["iconContext"];
			app.topo.iconFillContext = app.parameters["iconFillContext"];
			app.topo.urlContext = app.parameters["urlContext"];
			app.topo.sessionId = app.parameters["sessionId"];
			app.topo.user = user;
//			app.topo.menuUrl = app.parameters["urlContext"] + "cms/groupcustom/groupTopoMenu.xml";
			app.topo.menuUrl = app.parameters["menuUrl"];
//			app.topo.jkTopoNames = TopoUtil.jsonDecode(app.parameters[Constants.PARAM_JK_TOPONAMES]) as Array;
			app.topo.navigationEnabled = false;
			app.topo.workStatRefreshEnable = true;
			app.topo.resStatEnabled = false;
			app.topo.resStatDefaultShow = false;
			app.topo.isGroupTopo=true;
			app.topo.flowAlarmEnable = false;
			log.info("topo.iconContext:"+app.parameters["iconContext"]+",topo.iconFillContext:"+app.parameters["iconFillContext"]+",topo.urlContext:"+app.parameters["urlContext"]+",topo.sessionId:"+app.parameters["sessionId"]);
			app.topo.startTopo();
			app.topo.topoCanvas.addEventListener(CanvasEvent.LAYER_CHANGED,onTopoLayerChange);
			topoLoad();
		}
		
		private function onTopoLayerChange(event:CanvasEvent):void{
			
			var prod_no:String = app.topo.topoCanvas.getProperty("prod_no");
			var cust_id:String = app.topo.topoCanvas.getProperty("cust_id");
			var serv_type:String = app.topo.topoCanvas.getProperty("serv_type");
			log.info("[集客拓扑层次切换]cust_id:{0},prod_no:{1},serv_type:{2}",cust_id,prod_no,serv_type);
			if(prod_no){
				var evt:PerfTopoWindowEvent = new PerfTopoWindowEvent(PerfTopoWindowEvent.INIT);
				var param:Object = new Object();
				param.prodNo=String(prod_no);
				param.custId=String(currentCustId);
				evt.param = param;
				app.perfTopoWindow.dispatchEvent(evt);
				app.perfTopoTotalWindow.visible=false;

				if(serv_type){
					currentProdNo = prod_no;
					var topoViewName:String = app.topo.topoCanvas.getProperty("topoViewName");
					param.servTypeName=topoViewName.substr(0,topoViewName.indexOf("("));
					param.serv_type = serv_type;
					var prodTopoNavEvent:ProdTopoNavEvent = new ProdTopoNavEvent(ProdTopoNavEvent.QUERY);
					prodTopoNavEvent.param=param;
					app.prodTopoNav.dispatchEvent(prodTopoNavEvent);
				}
			}else{
				app.perfTopoWindow.visible=false;
				app.prodTopoNav.visible=false;
			}
			
			if(cust_id){
				// 说明切换到集客云图,此时要将拓扑一屏显示
//				app.topo.topoCanvas.oneScreenView(); 
				app.perfTopoTotalWindow.dispatchEvent(new PerfTopoTotalWindowEvent(PerfTopoTotalWindowEvent.INIT));
			}
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
				rightViewStackLocation();
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
				rightViewStackLocation();
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
		/*	if(app.custRealPerfComp){
				app.custRealPerfComp.dispatchEvent(new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERQUERY));
			}*/
			/*if(app.custAlarmWindow){
				app.custAlarmWindow.dispatchEvent(new RealMonitorAlarmListWindowEvent(RealMonitorAlarmListWindowEvent.DATAQUERY));
			}*/
			app.rightViewStack.top = 0;
			app.rightTabBar.visible = false;
			app.rightTabBar.includeInLayout = false;
		}
		
		
		private function rightViewStackLocation():void{
			app.rightViewStack.top = 23;
			app.rightTabBar.visible = true;
			app.rightTabBar.includeInLayout = true;
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
		public function topoLoad():void{
			var topoId:String = "1/jtkh/custId/"+currentCustId;
			//			var topoId:String="1/0";
			var topoName:String=app.parameters["topoName"];
////			currentCustCity
//			if(currentCustCity == '0100' || currentCustCity=='0300' || currentCustCity=='0400'){
//				topoName += "_njwxcz";
//			}else if(currentCustCity == '0200' || currentCustCity=='0900'){
//				topoName += "_szxz";
//			}
			log.info("[集客拓扑]topoId:"+topoId+",topoName:"+topoName);
//			app.topo.loadTopo(topoId,topoName);
			try{
				app.topo.loadTopo(topoId,null,false);
			}catch(e:Error){
				log.error("loadTopo ERROR:{0}",e);
			}
			if(app.perfTopoTotalWindow){
				app.perfTopoTotalWindow.dispatchEvent(new PerfTopoTotalWindowEvent(PerfTopoTotalWindowEvent.INIT));
			}
		}

		public function perfTopoWindowInit(param:Object):void{
			loadManager.showLoading("55555");
			log.info("[集客性能拓扑展示  5]"+String(param.custId)+",prod_no:"+String(param.prodNo));
			dataManager.getCustPerf(param,getCustPerfHandler,onComplete,onError);
		}
		
		private function getCustPerfHandler(result:Object):void{
			loadManager.hideLoading();
			log.info("[集客性能拓扑展示  5 o]"+result.length);
			var evt:PerfTopoWindowEvent = new PerfTopoWindowEvent(PerfTopoWindowEvent.DATACHANGE);
			evt.param = result;
			app.perfTopoWindow.dispatchEvent(evt);
		}
		
		
		public function perfTopoTotalWindowInit():void{
//			loadManager.showLoading();C
			var param:Object = new Object();
			param.custId=currentCustId;
//			log.info("[集客总体性能情况拓扑展示]"+String(param.custId)+",prod_no:"+String(param.prodNo));
			log.info("[集客总体性能情况拓扑展示 5]"+String(param.custId));
			dataManager.getCustPerfTotal(param,getCustPerfTotalHandler,onComplete,onError);
		}
		
		private function getCustPerfTotalHandler(result:Object):void{
//			loadManager.hideLoading();
			log.info("[集客总体性能情况拓扑展示  5]"+result.length);
			var evt:PerfTopoTotalWindowEvent = new PerfTopoTotalWindowEvent(PerfTopoTotalWindowEvent.DATACHANGE);
			evt.param = result;
			app.perfTopoTotalWindow.dispatchEvent(evt);
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
			rightViewStackLocation();
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
			loadManager.showLoading("加载数据，请稍后");
			log.info(groupCusStaticParam);
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
				log.info("[告警监控  param.custId  1]custId:"+param.custId +"currentCustId="+currentCustId);
				loadManager.showLoading("加载数据，请稍后  111");
				setTimeout(function():void{
					dataManager.getGroupCusStaticByCust(param,realCustAlarmQueryHandler,onComplete,onError);
				},2000);
			}
		}
		
		private function realCustAlarmQueryHandler(result:Object):void{
			loadManager.hideLoading();
			log.info("告警监控  1");
			var evt:RealMonitorAlarmListWindowEvent = new RealMonitorAlarmListWindowEvent(RealMonitorAlarmListWindowEvent.DATACHANGE);
			evt.param = result;
			app.custAlarmWindow.dispatchEvent(evt);
		}
		
		public function custNumQuery():void{
			log.info("[获取告警集客数量和总数]areaId:"+groupCusStaticParam.areaId+",cityId:"+groupCusStaticParam.cityId+",servLevel:"+groupCusStaticParam.servLevel+",servType:"+groupCusStaticParam.servType+",cusName:"+groupCusStaticParam.cusName+",curPage_splitPage:"+groupCusStaticParam.curPage_splitPage+",num_splitPage:"+groupCusStaticParam.num_splitPage);
			dataManager.getCustNum(groupCusStaticParam,custNumQueryHandler,onComplete,onError);
		}
		
		private function custNumQueryHandler(result:Object):void{
			var evt:RealMonitorCustListGroupEvent = new RealMonitorCustListGroupEvent(RealMonitorCustListGroupEvent.CUSTNUMCHANGE);
			evt.param = result;
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
			log.info(result.dataList);
			evt.param = result;
			app.custRealPerfComp.dispatchEvent(evt);
		}
		
		public function realPerfServerTypeQuery():void{
			log.info("realPerfServerTypeQuery  currentCustId="+currentCustId);
			var param:Object = new Object();
			if(currentCustId){
				param.custId = currentCustId;
				log.info("8  [根据集客ID加载集客业务]custId:"+param.custId);
				loadManager.showLoading("8888888");
				dataManager.getServByCust(param,realPerfServerTypeQueryHandler,onComplete,onError);
			}
		}
		
		private function realPerfServerTypeQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERCHANGE);
			log.info("8  [根据集客ID加载集客业");
			evt.param = result;
			app.custRealPerfComp.dispatchEvent(evt);
		}
		
		public function realPerfServerTargetQuery(param:Object):void{
			loadManager.showLoading();
			log.info("realPerfServerTargetQuery");
			dataManager.getServertarget(param,realPerfServerTargetQueryHandler,onComplete,onError);
		}
		
		private function realPerfServerTargetQueryHandler(result:Object):void{
			loadManager.hideLoading();
			log.info("realPerfServerTargetQueryHandler");
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERTARGETCHANGE);
			evt.param = result;
			app.custRealPerfComp.dispatchEvent(evt);
		}
		
		/////////////////////////////////////////////
		public function SLAQuery(param:Object):void{
			loadManager.showLoading("22222");
			param.cusId = currentCustId;
			log.info("[SLAQuery 2]cusId:"+param.cusId+",statTime:"+param.statTime);
			dataManager.getSLA(param,getSLAHandler,onComplete,onError);	
		}
		
		private function getSLAHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:SLACompEvent = new SLACompEvent(SLACompEvent.DATACHANGE);
			evt.param = result;
			app.SLAComp.dispatchEvent(evt);
			log.info("[SLAQuery end");
		}
		
		public function resourceInfoQuery():void{
			loadManager.showLoading("333333");
			var param:Object = new Object();
			param.cusId = currentCustId;
			log.info("[客户信息查询 4]cusId:"+param.cusId);
			dataManager.getCustomServerInfo(param,getCustomServerInfoHandler,onComplete,onError);
		}
		
		private function getCustomServerInfoHandler(result:Object):void{
			loadManager.hideLoading();
			
			log.info("[客户信息查询 4]");
			var evt:ResourceCompEvent = new ResourceCompEvent(ResourceCompEvent.RESINFODATACHANGE);
			evt.param = result;
			app.resourceComp.dispatchEvent(evt);
		}
		
		public function resourceServQuery():void{
			var param:Object = new Object();
			param.cusId = currentCustId;
			log.info("[业务信息查询 4]cusId:"+param.cusId);
			dataManager.getServerByCustom(param,getServerByCustomHandler,onComplete,onError);
		}
		
		private function getServerByCustomHandler(result:Object):void{
			loadManager.hideLoading();
			
			log.info("[客户信息查询 4]");
			var evt:ResourceCompEvent = new ResourceCompEvent(ResourceCompEvent.RESSERVDATACHANGE);
			evt.param = result;
			app.resourceComp.dispatchEvent(evt);
		}
		
		public function alarmStatQuery(param:Object):void{
			param.cusId=currentCustId;
			loadManager.showLoading();
			log.info("alarmStatQuery 7");
			dataManager.getGroupWarnStat(param,getGroupWarnStatHandler,onComplete,onError);
		}
		
		private function getGroupWarnStatHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:AlarmStatCompEvent = new AlarmStatCompEvent(AlarmStatCompEvent.DATACHANGE);
			log.info("alarmStatQuery 77");
			evt.param = result;
			app.alarmStatComp.dispatchEvent(evt);
		}
		
		public function processQuery(par:Object):void{
			loadManager.showLoading("666666");
			var param:Object = new Object();
			
			
			if(par == null || par == "")
			{
				param.pageSize = 15;
				param.currentPage = 1;
			}else{
				param = par;
			}
			param.custId = currentCustId;
			log.info("[工程割接 6]cust_no:"+param.custId);
			log.info(param);
//			dataManager.getCustEngineeringInfo(param,getCustEngineeringInfoHandler,onComplete,onError);
			dataManager.queryProjectInfo(param,getCustEngineeringInfoHandler,onComplete,onError);
		}
		
		private function getCustEngineeringInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ProcessCompEvent = new ProcessCompEvent(ProcessCompEvent.DATACHANGE);
			log.info("result.datas.length:"+result.datas.length);
			evt.param = result;
			app.processComp.dispatchEvent(evt);
			log.info("[工程割接 6] end");
		}
		public function processInfoQuery(param:Object):void{
			loadManager.showLoading();
			log.info("[工程割接信息]cust_no:"+param.cust_no+",pro_no:"+param.pro_no+",info_id:"+param.info_id);
			dataManager.getCustEngineeringDetail(param,getCustEngineeringDetailHandler,onComplete,onError);
		}
		
		private function getCustEngineeringDetailHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ProcessCompEvent = new ProcessCompEvent(ProcessCompEvent.INFOCHANGE);
			evt.param = result;
			app.processComp.dispatchEvent(evt);
		}
		
		public function prodQuery(param:Object):void{
			log.info("[prodQuery]cust_no:{0},serv_type:{1}",param.custId,param.serv_type);
			param.cust_no=param.custId;
			dataManager.getProInfo(param,getProInfoHandler,onComplete,onError);
		}
		
		private function getProInfoHandler(result:Object):void{
			log.info("[prodQuery]result.length:{0}",result.dataList.length);
			result.currentProdNo=currentProdNo;
			var evt:ProdTopoNavEvent = new ProdTopoNavEvent(ProdTopoNavEvent.DATACHANGE);
			evt.param = result;
			app.prodTopoNav.dispatchEvent(evt);
		}
		
		private var currentProdNo:String;
		public function prodTopoChange(param:Object):void{
			if(currentProdNo != param.prod_no){
				var topoId:String = "1/jtkh/custId/"+param.cust_no+"/prod/"+param.prod_no+"/cc/"+param.circuit_code;
				log.info("[prodTopoChange]topoId:{0}",topoId);
				app.topo.loadTopo(topoId,null,false,false);
			}
		}
		
		public function sheetInfoQuery(par:Object):void
		{
			loadManager.showLoading();
			var param:Object = new Object();
			if(par == null || par == "")
			{
				param.pageSize = 15;
				param.currentPage = 1;
			}else{
				param = par;
			}
			
			param.custId = currentCustId;
			param.name = currentCustName;
			
			log.info("[3 工单信息 custId:"+param.custId + "   name="+param.name);
			log.info(param);
			dataManager.queryFaultInfo(param,getSheetInfoHandler,onComplete,onError);
		}
		
		private function getSheetInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:SheetInfoEvent = new SheetInfoEvent(SheetInfoEvent.SHOWSHEETINFO);
		 	evt.param = result;
			log.info("result。datas.length:"+result.datas.length);
			app.sheetInfoComp.dispatchEvent(evt);
			log.info("getSheetInfoHandler 4  结果");
		}
		
		private var sheetDetailUrl:String = "warn/sheet/sheetAction!tosheetInfo.action?";
		public function sheetDetailShow(param:Object):void
		{
			log.info("sheetDetailShow:"+param.flowid);
			
			sheetDetailUrl = "http://10.40.10.68/eoms4/LogonServlet?u=lianchuang&p=123456Lc!&url=/eoms4/newgrmFaultTaskAction!centerHandle.ilf?state=3&flowId="+param.flowid;
			log.info('sheetDetailUrl' + sheetDetailUrl);
			navigateToURL(new URLRequest(sheetDetailUrl));
		}
		
		public function complaintInfoQuery(par:Object):void
		{
			loadManager.showLoading();
			var param:Object = new Object();
			
			if(par == null || par == "")
			{
				param.pageSize = 15;
				param.currentPage = 1;
			}else{
				param = par;
			}
			param.custId = currentCustId;
			param.name = currentCustName;
			log.info("[9 投诉信息 cusId:"+param.custId + "   name="+param.name);
			
			log.info(param);
			dataManager.queryComplainInfo(param,getComplaintInfoHandler,onComplete,onError);
		}
		
		private function getComplaintInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ComplaintInfoEvent = new ComplaintInfoEvent(ComplaintInfoEvent.SHOWCOMPLAINTINFO);
			log.info("result.datas.length:"+result.datas.length);
			evt.param = result;
			//app.complaintInfoComp.dispatchEvent(evt);
			log.info("getComplaintInfoHandler   end");
		}
		
		public function complaintDetailQuery(param:Object):void
		{
			loadManager.showLoading();
			log.info("complaintDetailQuery");
			log.info("[投诉详细信息 cusId:"+param.sheetNo);
			dataManager.getComplaintDetail(param,getComplaintDetailHandler,onComplete,onError);
		}
		
		private function getComplaintDetailHandler(result:Object):void{
			log.info("getComplaintDetailHandler");
			log.info(result);
			var evt:ComplaintInfoEvent = new ComplaintInfoEvent(ComplaintInfoEvent.SHOWCOMPLAINTDETAIL);
			evt.param = result;
			//app.complaintInfoComp.dispatchEvent(evt);
		}
		
		private function onComplete():void{
		}
		private function onError(event:FaultEvent):void{
			loadManager.hideLoading();
		}
		
	}
}