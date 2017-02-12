package com.linkage.module.cms.groupclient.control
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclient.GroupPushModule;
	import com.linkage.module.cms.groupclient.data.GroupMonitorDataManager;
	import com.linkage.module.cms.groupclient.data.GroupMonitorDataManagerBS;
	import com.linkage.module.cms.groupclient.event.MonitorAlarmListWindowEvent;
	import com.linkage.module.cms.groupclient.event.SLACompEvent;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.logging.targets.DeMonsterTarget;
	import com.linkage.system.utils.StringUtils;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.setTimeout;
	
	import mx.events.ListEvent;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-8 下午02:24:56
	 * @category com.linkage.module.cms.groupclient.control
	 * @copyright 南京联创科技 网管开发部
	 */
	public class GroupPushModuleControl extends EventDispatcher
	{
		// log
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.control.GroupPushModuleControl");
		private var user:Object;

		private var app:GroupPushModule;
		private var loadManager:LoadManager;
		private var dataManager:GroupMonitorDataManager;
		private var defaultCustId:String;
		private var treeHttpService:HTTPService;
		
		public var currentCityName:String;
		private var currentCityId:String;
		private var currentBussType:String;
		private var currentServLevel:String;
		private var currentCustId:String;
		private var currentCustCity:String;
		public function GroupPushModuleControl(app:GroupPushModule,target:IEventDispatcher=null)
		{
			super(target);
			this.app = app;
			var userParams:String = String(app.parameters["user"]).replace(/\'/g, "\"");
			log.info("user--->"+userParams);
			user = JSON.decode(userParams);
			loadManager=app.loadManager;
			dataManager = new GroupMonitorDataManagerBS(String(app.parameters["urlContext"]));
			defaultCustId = String(app.parameters["custId"]);
			currentCustId=defaultCustId;
		}
		
		private var nowTime:Number;
		public function initTreeData():void{
			loadManager.showLoading();
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
			nowTime = new Date().getTime();
			treeHttpService.send(param);
		}
		
		public function getNavTreeXMLHandler(resultEvent:ResultEvent):void{
			log.info("[获取默认树节点耗时]:"+(new Date().getTime()-nowTime));
			loadManager.hideLoading();
			try{
				app.treeData=treeHttpService.lastResult as XML;
			}catch(e:Error){
				log.error(e.message.toString());
				return;
			}
			app.navTree.validateNow();
			if(defaultCustId){
				nowTime = new Date().getTime();
				custSelected(defaultCustId);
				log.info("[集客选择耗时]:"+(new Date().getTime()-nowTime));
			}
		}
		
		private var treeHttpService2:HTTPService;
		private function custSelected(custId:String):void{
			log.info("[集客选择]:"+custId);
			if(custId){
				currentCustId = custId;
				app.SLAComp.dispatchEvent(new SLACompEvent(SLACompEvent.REFRESH));
				topoLoad();
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
				nowTime = new Date().getTime();
				setTimeout(function():void{
					treeHttpService2.send(param);
				},5000);
			}
		}
		
		private var treeSelectNode:XML;
		private function custSelectedHandler(resultEvent:ResultEvent):void{
			log.info("[获取某个集客所在的节点的树耗时]:"+(new Date().getTime()-nowTime));
			var result:XML = treeHttpService2.lastResult as XML;
			nowTime = new Date().getTime();
			setTreeItemByServ(defaultCustId,result,app.treeData);
//			expandTreeItemByCustId(defaultCustId,app.treeData);
			log.info("[解析某个集客所在的节点的树耗时]:"+(new Date().getTime()-nowTime));
		}
	
		
		private function setTreeItemByServ(custId:String,result:XML,childNodes:XML):void{
//			forEachTree(childNodes,function(node:XML):void{
////				log.info("设置集客===========>"+result.@B+","+result.@C+","+node.@C);
//				if(result.@B == node.@B){
//					forEachTree(node,function(child:XML):void{
//						if(result.@C == child.@C){
//							child.@cp=result.@cp;
//							child.@tp=result.@tp;
//							child.setChildren(result.children());
//						}
//					});
//				}
//			});
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
									break;
								}
							}
							break;
						}
					}
					break;
				}
				//else if(node.hasComplexContent()){
				//	setTreeItemByServ(custId,result,node.children());
				//}
			}
		}
		
		private var forEachBreak:Boolean=false;
		private function forEachTree(node:XML,callback:Function=null):void{
//			if(forEachBreak){
//				return;
//			}
			for each(var child:XML in node.children()){
				if(callback is Function){
					callback.call(null,child);
//					forEachBreak = callback.call(null,child);
//					if(forEachBreak){
//						break;
//					}
				}
				if(child.hasComplexContent()){
					forEachTree(child,callback);
				}
			}
		}
		
		private function expandTreeItemByCustId(custId:String,childNodes:XML):void{
			forEachTree(childNodes,function(node:XML):Boolean{
//				log.info("定位集客===========>"+custId+","+node.@D);
				if(custId == node.@D){
					expandParent(node);
					app.navTree.selectedItem=node;
					var index:Number = app.navTree.getItemIndex(node);
					app.navTree.verticalScrollPosition=index;
//					app.navTree.dispatchEvent(new ListEvent(ListEvent.CHANGE));
					return true;
				}
				return false;
			});
//			for each(var node:XML in childNodes){
//				if(custId == node.@D){
//					app.navTree.expandItem(node.parent(),true);
//					expandParent(node.parent().parent());
//					app.navTree.selectedItem=node;
//					var index:Number = app.navTree.getItemIndex(node);
//					app.navTree.verticalScrollPosition=index;
//					app.navTree.dispatchEvent(new ListEvent(ListEvent.CHANGE));
//					break;
//				}else if(node.hasComplexContent()){
//					expandTreeItemByCustId(custId,node.children());
//				}
//			}
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
		
		private var treeOpenItem:Object;
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
			log.info("[获取某个服务等级的节点树]area_id:"+param.area_id+",city_id:"+param.city_id+",serv_level:"+param.serv_level+",requestpagenum:"+param.requestpagenum);
			treeHttpService1.send(param);
		}
		
		public function treeItemOpenHandler(resultEvent:ResultEvent):void{
			log.info("[treeItemOpenHandler]"+treeHttpService.lastResult);
			var result:XML = treeHttpService1.lastResult as XML;
			treeOpenItem.@cp=result.@cp;
			treeOpenItem.@tp=result.@tp;
			(treeOpenItem as XML).setChildren(result.children());
			app.navTree.expandItem(treeOpenItem,false);
			expandParent(treeOpenItem as XML);
			app.navTree.selectedItem = treeOpenItem;
			var index:Number = app.navTree.getItemIndex(treeOpenItem);
			app.navTree.verticalScrollPosition=index;
		}
		
		/**
		 *树选择处理 
		 * @param event
		 * 
		 */		
		public function treeChang(event:ListEvent):void
		{
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
			if (!StringUtils.isEmpty(item.@D))
			{
				currentCityId = String(event.target.getParentItem(event.target.getParentItem(item)).@B);
				currentCityName = String(event.target.getParentItem(event.target.getParentItem(item)).@A);
				currentServLevel = String(event.target.getParentItem(item).@C);
				currentCustId = String(item.@D);
				currentCustCity = String(item.@F);
				currentBussType=null;
				/////////////////////////////////////////////
				app.SLAComp.dispatchEvent(new SLACompEvent(SLACompEvent.REFRESH));
				topoLoad();
				
				///////////////////////////////////////////////
			}
			log.info("treeChang:[cityId:"+currentCityId+"][lerverId:"+currentServLevel+"][custId:"+currentCustId+"][bussType:"+currentBussType+"]");
		}
		
		
		public function SLAQuery(param:Object):void{
			loadManager.showLoading();
			param.cusId = currentCustId;
			log.info("[SLAQuery]");
			log.info(param);
			dataManager.getSLA(param,getSLAHandler,onComplete,onError);
		}
		
		private function getSLAHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:SLACompEvent = new SLACompEvent(SLACompEvent.DATACHANGE);
			evt.param = result;
			log.info("[SLAQuery]  evt.param");
			log.info(evt.param);
			app.SLAComp.dispatchEvent(evt);
		}
		
		
		public function queryAlarmByProduct(productId:String, startTime:String, endTime:String,searchFlag:String=null):void
		{
			var param:Object = new Object();
			param.product_id = productId;
			param.cust_no = defaultCustId;
			param.start_time = startTime;
			param.end_time = endTime;
			if(searchFlag){
				param.searchFlag = searchFlag;
			}
			loadManager.showLoading();
			log.info("查询集客告警信息参数： product_id＝" +productId+",cust_no=" + currentCustId + ",start_time=" + startTime + ",end_time=" + endTime+",searchFlag="+searchFlag);
			dataManager.getAlarmList(param,loadAlarmByProductSucc,onComplete,onError);
		}
		
		private function loadAlarmByProductSucc(obj:Object):void
		{
			loadManager.hideLoading();
			var evt:MonitorAlarmListWindowEvent = new MonitorAlarmListWindowEvent(MonitorAlarmListWindowEvent.DATACHANGE);
			evt.param = obj;
			app.alarmListWindow.dispatchEvent(evt);
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
			app.topo.navigationEnabled = false;
			app.topo.workStatRefreshEnable = true;
			app.topo.resStatEnabled = false;
			app.topo.resStatDefaultShow = false;
			app.topo.isGroupTopo=true;
			app.topo.flowAlarmEnable = false;
			log.info("topo.iconContext:"+app.parameters["iconContext"]+",topo.iconFillContext:"+app.parameters["iconFillContext"]+",topo.urlContext:"+app.parameters["urlContext"]+",topo.sessionId:"+app.parameters["sessionId"]);
			app.topo.startTopo();
		}
		
		private function topoLoad():void{
			var topoId:String = "1/jtkh/custId/"+currentCustId;
			var topoName:String=app.parameters["topoName"];
//			if(currentCustCity == '0100' || currentCustCity=='0300' || currentCustCity=='0400'){
//				topoName += "_njwxcz";
//			}else if(currentCustCity == '0200' || currentCustCity=='0900'){
//				topoName += "_szxz";
//			}
			log.info("[集客拓扑]topoId:"+topoId+",topoName:"+topoName);
//			app.topo.loadTopo(topoId,topoName);
			app.topo.loadTopo(topoId);
		}
		
		private function onComplete():void{
			
		}
		private function onError(event:FaultEvent):void{
			loadManager.hideLoading();
		}
		
		
	}
}