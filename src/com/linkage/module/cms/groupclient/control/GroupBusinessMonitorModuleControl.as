package com.linkage.module.cms.groupclient.control
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclient.GroupBusinessMonitorModule;
	import com.linkage.module.cms.groupclient.data.GroupMonitorDataManager;
	import com.linkage.module.cms.groupclient.data.GroupMonitorDataManagerBS;
	import com.linkage.module.cms.groupclient.event.FilterFormEvent;
	import com.linkage.module.cms.groupclient.event.RealMonitorCustListGroupEvent;
	import com.linkage.module.cms.groupclient.event.RealMonitorPerfCompEvent;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.ILoggingTarget;
	import com.linkage.system.logging.Log;
	import com.linkage.system.logging.LogEventLevel;
	import com.linkage.system.logging.targets.MonsterTarget2;
	import com.linkage.system.utils.StringUtils;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	import mx.collections.ArrayCollection;
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Alert;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.events.ListEvent;
	import mx.formatters.DateFormatter;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	/**
	 * 
	 * @author shiliang
	 * 
	 */	
	public class GroupBusinessMonitorModuleControl extends EventDispatcher
	{
		private var loadManager:LoadManager;
		private var app:GroupBusinessMonitorModule;
		private var dataManager:GroupMonitorDataManager = null;
		// log
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.control.GroupBusinessMonitorModule");
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
		 * 集客告警参数变量
		 */		
		private var groupCusStaticParam:Object;
		
		private static const CITY_ALL:String="00";
		private static const CITY_TransProvince:String="0000";
		private static const CITY_Province:String="000";
		
		public function GroupBusinessMonitorModuleControl(app:GroupBusinessMonitorModule,target:IEventDispatcher=null)
		{
			super(target);
			var userParams:String = String(app.parameters["user"]).replace(/\'/g, "\"");
			log.info("user--->"+userParams);
			user = JSON.decode(userParams);
			this.app = app;
			defaultCustId = String(app.parameters["custId"]);
			defaultCustId = "25010000762";//江苏省电力公司
			log.info("defaultCustId--->"+defaultCustId);
			loadManager=app.loadManager;
			dataManager = new GroupMonitorDataManagerBS(String(app.parameters["urlContext"]));
//			initTreeData();
			//initServerTypes();
//			addEventListener(TREE_CITY_SELECT,treeCitySelectHandler);
//			addEventListener(TREE_LEVER_SELECT,treeLeverSelectHandler);
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
//				treeHttpService.url = String(app.parameters["urlContext"])+"/cms/groupcustom/tree/gctree!getDefaultTree.action";
				treeHttpService.url = String(app.parameters["urlContext"])+"/cms/groupcustom/tree/gctree!getDefaultTreeForGs.action";
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
			}
//			else{
//				app.navTree.expandItem(app.treeData[0],true);
//				currentCityId = app.treeData[0].@B;
//				currentCityName=app.treeData[0].@A;
//				currentServLevel=null;
//				currentCustId=null;
//				currentBussType=null;
//				dispatchEvent(new Event(TREE_CITY_SELECT));
//			}
			
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
//				treeHttpService1.url = String(app.parameters["urlContext"])+"/cms/groupcustom/tree/gctree!getSubTree.action";
				treeHttpService1.url = String(app.parameters["urlContext"])+"/cms/groupcustom/tree/gctree!getSubTreeForGs.action";
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
		 *树集客选择处理 
		 * @param event
		 * 
		 */		
		
		private function treeCustSelectHandler(event:Event):void{
			//修改成业务性能查询，2013-10-11，汪炜。
			this.setServViewParam();
			this.perfServerTypeQuery();  
			this.hisPerfServerTypeQuery();
		}
		/**
		 *把一些参数设置到业务指标展示中。
		 * @param event
		 * 
		 */		
		public function setServViewParam():void{
			if(currentCustId){
				app.runMonitorPerf.currentCustName = currentCustName;
				app.runHistoryMonitorPerf.currentCustName = currentCustName;
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
//					treeHttpService2.url = String(app.parameters["urlContext"])+"/cms/groupcustom/tree/gctree!getSubTreeByCustId.action";
					treeHttpService2.url = String(app.parameters["urlContext"])+"/cms/groupcustom/tree/gctree!getSubTreeByCustIdForGs.action";
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
		
		public function queryCustByFilter(param:Object):void{
			groupCusStaticParam = param;
			groupCusStaticParam.areaId = String(user.areaId);
			app.custListGroup.dispatchEvent(new RealMonitorCustListGroupEvent(RealMonitorCustListGroupEvent.REFRESH));
			if(!app.custListGroup.visible){
				app.img.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			}
		}
		
		/////////////////////////////////////////////
		
		public function perfQuery(param:Object):void{
			loadManager.showLoading();
			param.cusId = currentCustId;
			param.cityId = currentCityId;
			log.info("[性能查询]cusId:"+param.cusId+",cityId:"+param.cityId+",bussType:"+param.bussType+",perfTypeId:"+param.perfTypeId+",startTime:"+param.startTime+",endTime:"+param.endTime);
			dataManager.getNewPmList(param,perfQueryHandler,onComplete,onError);
		}
		
		private function perfQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.PERFDATACHANGE);
			evt.param = result;
			app.runMonitorPerf.dispatchEvent(evt);
		}
		
		public function perfServerTypeQuery():void{
			var param:Object = new Object();
			if(currentCustId){
				param.custId = currentCustId;
				log.info("[根据集客ID加载集客业务]custId:"+param.custId);
				loadManager.showLoading();
//				dataManager.getServByCust(param,perfServerTypeQueryHandler,onComplete,onError);
				dataManager.getServByCustForGs(param,perfServerTypeQueryHandler,onComplete,onError);
			}
		}
		private function perfServerTypeQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERCHANGE);
			evt.param = result;
			app.runMonitorPerf.dispatchEvent(evt);
		}
		
		public function perfServerTargetQuery(param:Object):void{
			loadManager.showLoading();
			dataManager.getServertarget(param,perfServerTargetQueryHandler,onComplete,onError);
		}
		
		private function perfServerTargetQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERTARGETCHANGE);
			evt.param = result;
			app.runMonitorPerf.dispatchEvent(evt);
		}
		
		public function hisPerfQuery(param:Object):void{
			loadManager.showLoading();
			param.cusId = currentCustId;
			param.cityId = currentCityId;
			log.info("[性能查询]cusId:"+param.cusId+",cityId:"+param.cityId+",bussType:"+param.bussType+",perfTypeId:"+param.perfTypeId+",startTime:"+param.startTime+",endTime:"+param.endTime);
			dataManager.getNewPmList(param,hisPerfQueryHandler,onComplete,onError);
		}
		
		private function hisPerfQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.PERFDATACHANGE);
			evt.param = result;
			app.runHistoryMonitorPerf.dispatchEvent(evt);
		}
		
		public function hisPerfServerTypeQuery():void{
			var param:Object = new Object();
			if(currentCustId){
				param.custId = currentCustId;
				log.info("[根据集客ID加载集客业务]custId:"+param.custId);
				loadManager.showLoading();
//				dataManager.getServByCust(param,hisPerfServerTypeQueryHandler,onComplete,onError);
				dataManager.getServByCustForGs(param,hisPerfServerTypeQueryHandler,onComplete,onError);
			}
		}
		private function hisPerfServerTypeQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERCHANGE);
			evt.param = result;
			app.runHistoryMonitorPerf.dispatchEvent(evt);
		}
		
		public function hisPerfServerTargetQuery(param:Object):void{
			loadManager.showLoading();
			dataManager.getServertarget(param,hisPerfServerTargetQueryHandler,onComplete,onError);
		}
		
		private function hisPerfServerTargetQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:RealMonitorPerfCompEvent = new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERTARGETCHANGE);
			evt.param = result;
			app.runHistoryMonitorPerf.dispatchEvent(evt);
		}
		private function onComplete():void{
			loadManager.hideLoading();
		}
		private function onError(event:FaultEvent):void{
			loadManager.hideLoading();
		}
		
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
		
	}
}