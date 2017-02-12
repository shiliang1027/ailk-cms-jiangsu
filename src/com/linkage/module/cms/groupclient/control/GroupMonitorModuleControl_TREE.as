package com.linkage.module.cms.groupclient.control
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclient.GroupMonitorModule_TREE;
	import com.linkage.module.cms.groupclient.components.CustNetTopuComp;
	import com.linkage.module.cms.groupclient.data.GroupCustDataManager;
	import com.linkage.module.cms.groupclient.data.GroupCustDataManagerBS;
	import com.linkage.module.cms.groupclient.data.GroupMonitorDataManager;
	import com.linkage.module.cms.groupclient.data.GroupMonitorDataManagerBS;
	import com.linkage.module.cms.groupclient.event.AlarmStatCompEvent;
	import com.linkage.module.cms.groupclient.event.CustFlowAlarmWindowEvent;
	import com.linkage.module.cms.groupclient.event.FilterFormEvent;
	import com.linkage.module.cms.groupclient.event.HealthInfoCompEvent;
	import com.linkage.module.cms.groupclient.event.MonitorAlarmListWindowEvent;
	import com.linkage.module.cms.groupclient.event.NavTreeEvent;
	import com.linkage.module.cms.groupclient.event.PerfTopoTotalWindowEvent;
	import com.linkage.module.cms.groupclient.event.PerfTopoWindowEvent;
	import com.linkage.module.cms.groupclient.event.ProcessCompEvent;
	import com.linkage.module.cms.groupclient.event.ProdTopoNavEvent;
	import com.linkage.module.cms.groupclient.event.RealMonitorAlarmListWindowEvent;
	import com.linkage.module.cms.groupclient.event.RealMonitorCustListGroupEvent;
	import com.linkage.module.cms.groupclient.event.RealMonitorPerfCompEvent;
	import com.linkage.module.cms.groupclient.event.ResourceCompEvent;
	import com.linkage.module.cms.groupclient.event.SLACompEvent;
	import com.linkage.module.cms.groupclient.renderer.AlarmCustRenderer;
	import com.linkage.module.cms.groupclient.renderer.AlarmLerver1Renderer;
	import com.linkage.module.cms.groupclient.renderer.AlarmLerver2Renderer;
	import com.linkage.module.cms.groupclient.renderer.AlarmLerver3Renderer;
	import com.linkage.module.cms.groupclient.renderer.AlarmLerver4Renderer;
	import com.linkage.module.cms.groupclient.renderer.CustAlarmGroupWarnRenderer;
	import com.linkage.module.cms.groupclient.renderer.CustSLAWarnRenderer;
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
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.control.GroupMonitorModuleControl_TREE");
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
		
		public function topoInitGroup():void{
			app.baseInfoComp.topo.iconContext = app.parameters["iconContext"];
			app.baseInfoComp.topo.iconFillContext = app.parameters["iconFillContext"];
			app.baseInfoComp.topo.urlContext = app.parameters["urlContext"];
			app.baseInfoComp.topo.sessionId = app.parameters["sessionId"];
			app.baseInfoComp.topo.user = user;
//			app.topo.menuUrl = app.parameters["urlContext"] + "cms/groupcustom/groupTopoMenu.xml";
			app.baseInfoComp.topo.menuUrl = app.parameters["menuUrl"];
//			app.topo.jkTopoNames = TopoUtil.jsonDecode(app.parameters[Constants.PARAM_JK_TOPONAMES]) as Array;
			app.baseInfoComp.topo.navigationEnabled = false;
			app.baseInfoComp.topo.workStatRefreshEnable = true;
			app.baseInfoComp.topo.resStatEnabled = false;
			app.baseInfoComp.topo.resStatDefaultShow = false;
			app.baseInfoComp.topo.isGroupTopo=true;
			app.baseInfoComp.topo.flowAlarmEnable = false;
			log.info("topo.iconContext:"+app.parameters["iconContext"]+",topo.iconFillContext:"+app.parameters["iconFillContext"]+",topo.urlContext:"+app.parameters["urlContext"]+",topo.sessionId:"+app.parameters["sessionId"]);
			app.baseInfoComp.topo.startTopo();
//			app.topo.topoCanvas.addEventListener(CanvasEvent.LAYER_CHANGED,onTopoLayerChange);
			topoLoadGroup();
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
			if(app.custRealPerfComp){
				app.custRealPerfComp.dispatchEvent(new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERQUERY));
			}
			if(app.runMonitorPerf){
				app.runMonitorPerf.dispatchEvent(new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERQUERY));
			}
			
			if(app.custNetTopuComp)
			{
				log.info("custNetTopuComp");
				app.custNetTopuComp.dispatchEvent(new HealthInfoCompEvent(HealthInfoCompEvent.REFRESH));
				app.custNetTopuComp.dispatchEvent(new HealthInfoCompEvent(HealthInfoCompEvent.INITCUST));
			}
			/*if(app.baseInfoComp){
				log.info("baseInfoComp");
				app.baseInfoComp.dispatchEvent(new HealthInfoCompEvent(HealthInfoCompEvent.CLIENTINFOQUERY));
				app.baseInfoComp.dispatchEvent(new HealthInfoCompEvent(HealthInfoCompEvent.THICKNESSTABLEDATAQUERY));
				app.baseInfoComp.dispatchEvent(new HealthInfoCompEvent(HealthInfoCompEvent.EQUIPMENTINFOQUERY));
				app.baseInfoComp.dispatchEvent(new HealthInfoCompEvent(HealthInfoCompEvent.TOPOLOAD));
			
				
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
		
		public function topoLoadGroup():void{
			var topoId:String = "1/jtkh/custId/"+currentCustId;
			var topoName:String=app.parameters["topoName"];
			log.info("[集客拓扑group]topoId:"+topoId+",topoName:"+topoName);
			try{
				app.baseInfoComp.topo.loadTopo(topoId,null,false);
			}catch(e:Error){
				log.error("topoLoadGroup ERROR:{0}",e);
			}
			
		}

		public function perfTopoWindowInit(param:Object):void{
			loadManager.showLoading();
			log.info("[集客性能拓扑展示]"+String(param.custId)+",prod_no:"+String(param.prodNo));
			dataManager.getCustPerf(param,getCustPerfHandler,onComplete,onError);
		}
		
		private function getCustPerfHandler(result:Object):void{
			loadManager.hideLoading();
			log.info("[集客性能拓扑展示]"+result.length);
			var evt:PerfTopoWindowEvent = new PerfTopoWindowEvent(PerfTopoWindowEvent.DATACHANGE);
			evt.param = result;
			app.perfTopoWindow.dispatchEvent(evt);
		}
		
		
		public function perfTopoTotalWindowInit():void{
//			loadManager.showLoading();
			var param:Object = new Object();
			param.custId=currentCustId;
			log.info("[集客总体性能情况拓扑展示]"+String(param.custId)+",prod_no:"+String(param.prodNo));
			dataManager.getCustPerfTotal(param,getCustPerfTotalHandler,onComplete,onError);
		}
		
		private function getCustPerfTotalHandler(result:Object):void{
//			loadManager.hideLoading();
			log.info("[集客总体性能情况拓扑展示]"+result.length);
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
			evt.param = result;
			app.custRealPerfComp.dispatchEvent(evt);
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
			app.custRealPerfComp.dispatchEvent(evt);
		}
		
		public function realPerfServerTargetQuery(param:Object):void{
			loadManager.showLoading();
			dataManager.getServertarget(param,realPerfServerTargetQueryHandler,onComplete,onError);
		}
		
		private function realPerfServerTargetQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERTARGETCHANGE);
			evt.param = result;
			app.custRealPerfComp.dispatchEvent(evt);
		}
		
		/////////////////////////////////////////////
		
		public function hisPerfQuery(param:Object):void{
			loadManager.showLoading();
			param.cusId = currentCustId;
			param.cityId = currentCityId;
			log.info("[性能查询]cusId:"+param.cusId+",cityId:"+param.cityId+",bussType:"+param.bussType+",perfTypeId:"+param.perfTypeId+",startTime:"+param.startTime+",endTime:"+param.endTime);
			dataManager.getPmList(param,hisPerfQueryHandler,onComplete,onError);
		}
		
		private function hisPerfQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.PERFDATACHANGE);
			evt.param = result;
			app.runMonitorPerf.dispatchEvent(evt);
		}
		
		public function hisPerfServerTypeQuery():void{
			var param:Object = new Object();
			if(currentCustId){
				param.custId = currentCustId;
				log.info("[根据集客ID加载集客业务]custId:"+param.custId);
				loadManager.showLoading();
				dataManager.getServByCust(param,hisPerfServerTypeQueryHandler,onComplete,onError);
			}
		}
		
		private function hisPerfServerTypeQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERCHANGE);
			evt.param = result;
			app.runMonitorPerf.dispatchEvent(evt);
		}
		
		public function hisPerfServerTargetQuery(param:Object):void{
			loadManager.showLoading();
			dataManager.getServertarget(param,hisPerfServerTargetQueryHandler,onComplete,onError);
		}
		
		private function hisPerfServerTargetQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERTARGETCHANGE);
			evt.param = result;
			app.runMonitorPerf.dispatchEvent(evt);
		}
		
		public function SLAQuery(param:Object):void{
			loadManager.showLoading();
			param.cusId = currentCustId;
			log.info("[SLAQuery]cusId:"+param.cusId+",statTime:"+param.statTime);
			dataManager.getSLA(param,getSLAHandler,onComplete,onError);
		}
		
		private function getSLAHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:SLACompEvent = new SLACompEvent(SLACompEvent.DATACHANGE);
			evt.param = result;
			app.SLAComp.dispatchEvent(evt);
		}
		
		public function resourceInfoQuery():void{
			loadManager.showLoading();
			var param:Object = new Object();
			param.cusId = currentCustId;
			log.info("[客户信息查询]cusId:"+param.cusId);
			dataManager.getCustomServerInfo(param,getCustomServerInfoHandler,onComplete,onError);
		}
		
		private function getCustomServerInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ResourceCompEvent = new ResourceCompEvent(ResourceCompEvent.RESINFODATACHANGE);
			evt.param = result;
			app.resourceComp.dispatchEvent(evt);
		}
		
		public function resourceServQuery():void{
			var param:Object = new Object();
			param.cusId = currentCustId;
			log.info("[业务信息查询]cusId:"+param.cusId);
			dataManager.getServerByCustom(param,getServerByCustomHandler,onComplete,onError);
		}
		
		private function getServerByCustomHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ResourceCompEvent = new ResourceCompEvent(ResourceCompEvent.RESSERVDATACHANGE);
			evt.param = result;
			app.resourceComp.dispatchEvent(evt);
		}
		
		public function alarmStatQuery(param:Object):void{
			param.cusId=currentCustId;
			loadManager.showLoading();
			dataManager.getGroupWarnStat(param,getGroupWarnStatHandler,onComplete,onError);
		}
		
		private function getGroupWarnStatHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:AlarmStatCompEvent = new AlarmStatCompEvent(AlarmStatCompEvent.DATACHANGE);
			evt.param = result;
			app.alarmStatComp.dispatchEvent(evt);
		}
		
		public function processQuery():void{
			loadManager.showLoading();
			var param:Object = new Object();
			param.cust_no = currentCustId;
			log.info("[工程割接]cust_no:"+param.cust_no);
			dataManager.getCustEngineeringInfo(param,getCustEngineeringInfoHandler,onComplete,onError);
		}
		
		private function getCustEngineeringInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ProcessCompEvent = new ProcessCompEvent(ProcessCompEvent.DATACHANGE);
			evt.param = result;
			app.processComp.dispatchEvent(evt);
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
		
		public function baseInfoclientInfoQuery():void{
			loadManager.showLoading();
			var param:Object = new Object();
			param.cusId = currentCustId;
			param.name = currentCustName;
			log.info("[基本信息]cusId:"+param.cusId + "   name="+param.name);
			
			dataManager.getBaseInfoclientInfoQuery(param,getBaseInfoclientInfoHandler,onComplete,onError);
		}
		
		private function getBaseInfoclientInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.RESBASEINFODATACHANGE);
			evt.param = result;
			app.baseInfoComp.dispatchEvent(evt);
		}
		
		public function thicknessTableInfoQuery():void{
			loadManager.showLoading();
			var param:Object = new Object();
			param.cusId = currentCustId;
			param.name = currentCustName;
			log.info("[基本表--厚度表查询]cusId:"+param.cusId + "   name="+param.name);
			dataManager.getThicknessTableInfoQuery(param,getThicknessTableInfoHandler,onComplete,onError);
		}
		
		private function getThicknessTableInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.THICKNESSTABLEDATACHANGE);
			evt.param = result;
			log.info("getThicknessTableInfoHandler");
			log.info(evt.param);
			app.baseInfoComp.dispatchEvent(evt);
		}
		
		public function equipmentInfoQuery():void{
			loadManager.showLoading();
			var param:Object = new Object();
			param.cusId = currentCustId;
			log.info("[基本表--设备信息表查询]cusId:"+param.cusId);
			
			dataManager.getGroupCustDevInfo(param,getEquipmentInfoHandler,onComplete,onError);
		}
		
		private function getEquipmentInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.EQUIPMENTINFOCHANGE);
			evt.param = result;
			log.info("基本表--设备信息表结果-------");
			log.info(evt.param);
			app.baseInfoComp.dispatchEvent(evt);
		}
		public function saveGroupCustomerInfo(evt:Object):void{
			loadManager.showLoading();
			var param:Object = new Object();
			param = evt;
			param.cust_id = currentCustId;
			
			log.info("[保存 基本表--saveGroupCustomerInfo]:");
			log.info(param)
			
			dataManager.saveGroupCustomerInfo(param,getGroupCustomerInfoHandler,onComplete,onError);
		}
		
		public function exportBaseInfo():void{
			log.info("客户网络数据 ---[exportBaseInfo数据]currentCustId:"+currentCustId);
			var url:String = "/cms/groupcustom/analybusiness/analybusinessAction!expCustomerNetInfo.action?cust_id="+currentCustId;
			log.info(url);
			navigateToURL(new URLRequest(url));
		}
		
		private function getGroupCustomerInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.ISSAVECUSTINFO);
			evt.param = result;
			log.info("保存 基本表--saveGroupCustomerInfo结果-------");
			log.info(evt.param);
			app.baseInfoComp.dispatchEvent(evt);
		}
		
		public function specInfodataQuery():void{
			loadManager.showLoading();
			var param:Object = new Object();
			param.cusId = currentCustId;
			log.info("[业务信息表--业务专线查询]cusId:"+param.cusId);
			dataManager.getServerDataByCustom(param,getSpecInfodataHandler,onComplete,onError);
		}
		public function exportBusiness():void{
			log.info("导出业务信息表--业务专线数据 ---[业务信息表数据]currentCustId:"+currentCustId);
			var url:String = "/cms/groupcustom/analybusiness/analybusinessAction!expServerData.action?cust_id="+currentCustId;
			log.info(url);
//			http://10.40.9.185:54321/cms/groupcustom/analybusiness/analybusinessAction!expServerData.action?cust_id=25010000044
			navigateToURL(new URLRequest(url));
		}
		
		private function getSpecInfodataHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.SPECINFOCHANGE);
			evt.param = result;
			app.businessInfoComp.dispatchEvent(evt);
		}
		
		
		public function alarmSignQuery(e:Object):void{
			log.info("alarmSignQuery---");
			log.info(e);
			loadManager.showLoading();
			var date:Date=new Date();
			dateFormatter.formatString = "YYYY-MM-DD JJ:NN:SS";
			
			var param:Object = new Object();
			
			log.info("-----");
			
			if(e == null)
			{
				param.endTime = dateFormatter.format(date);
				date.setDate(date.getDate()- 7);
				param.startTime = dateFormatter.format(date);
				
				param.alarmTitle = "";
				param.alarmLevel = 0;
				param.currentPage = 0;
				param.pageSize =200;
				param.type = 0; //查询
			}else{
				param = e;
			}
			param.cusId = currentCustId;
			
			log.info("[维护信息--告警信息查询]cusId:"+param.cusId);
			log.info(param);
			dataManager.getGroupCustAlarmInfo(param,getAlarmSignHandler,onComplete,onError);
		}
		
		private function getAlarmSignHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.ALARMSIGNCHANGE);
			evt.param = result;
			app.alarmSignComp.dispatchEvent(evt);
		}
		
		public function CustNetTopoInitHandler():void{
			loadManager.showLoading();
			var cust_id:String = currentCustId;
			log.info("[集客网络拓扑信息查询~~~~~]cusId:"+cust_id);
			dataManagerCust.load(cust_id,getCustNetTopoInitHandlerHandler,onComplete,onError);
		}
		
		private function getCustNetTopoInitHandlerHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.CUSTNETTOPODATA);
			log.info(result);
			evt.param = result;
			app.custNetTopuComp.dispatchEvent(evt);
		}
		
		public function save(evt:Object):void{
			log.info("save数据---");
			log.info(evt);
			loadManager.showLoading();
			var param:Object = new Object();
			param = evt;
			param.cust_id = currentCustId;
			
			log.info("[save数据]cusId:"+param.cust_id);
			log.info(param);
			dataManagerCust.save(param,getSaveDataHandler,onComplete,onError);
		}
		public function exportTopo():void{
			
			log.info("集客网络拓扑 ---[exportTopo数据]currentCustId:"+currentCustId);
			var url:String = "/cms/groupcustom/analybusiness/analybusinessAction!expBusinessAnaly.action?cust_id="+currentCustId;
//			http://10.40.9.185:54321/cms/groupcustom/analybusiness/analybusinessAction!expBusinessAnaly.action?cust_id=25010000044集客网络拓扑
			log.info(url);
			navigateToURL(new URLRequest(url));
		}
		
		private function getSaveDataHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.ISSAVESUC);
			evt.param = result;
			log.info("save数据");
			log.info(result);
//			log.info(evt.param);
			app.custNetTopuComp.dispatchEvent(evt);
		}
		
		public function loadCompetitors():void{
			log.info("loadCompetitors数据---");
			loadManager.showLoading();
			var param:Object = new Object();
			
			log.info("[loadCompetitors数据]currentCustId:"+currentCustId);
			dataManagerCust.loadCompetitors(currentCustId,getloadCompetitorsDataHandler,onComplete,onError);
		}
		public function exportCompData():void{
			log.info("导出竞争对手数据 ---[loadCompetitors数据]currentCustId:"+currentCustId);
			var url:String = "/cms/groupcustom/analybusiness/analybusinessAction!expCompetitorsData.action?cust_id="+currentCustId;
			log.info(url);
//			http://10.40.9.185:54321/cms/groupcustom/analybusiness/analybusinessAction!expCompetitorsData.action?cust_id=25010005463
			navigateToURL(new URLRequest(url));
		}
		
		private function getloadCompetitorsDataHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.DATACHANGECMP);
			evt.param = result;
			/*log.info("getloadCompetitorsDataHandler ");
			log.info(result);*/
//			log.info(evt.param);
			app.competitorDataComp.dispatchEvent(evt);
		}
		
		public function saveCompetitors(evt:Object):void{
			log.info("saveCompetitors数据---");
			loadManager.showLoading();
			log.info(evt);
			var param:Object = new Object();
			param = evt;
			param.cust_id = currentCustId;
			log.info(param);
			dataManagerCust.saveCompetitors(param,getsaveCompetitorsDataHandler,onComplete,onError);
		}
		
		private function getsaveCompetitorsDataHandler(result:Object):void{
			loadManager.hideLoading(); 
			var evt:HealthInfoCompEvent = new HealthInfoCompEvent(HealthInfoCompEvent.ISSAVESUC);
			evt.param = result;
			log.info("loadCompetitors数据");
			log.info(result);
			app.competitorDataComp.dispatchEvent(evt);
		}
		
		private function onComplete():void{
		}
		private function onError(event:FaultEvent):void{
			loadManager.hideLoading();
		}
		
	}
}