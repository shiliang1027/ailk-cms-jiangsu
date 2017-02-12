package com.linkage.module.cms.groupclient.control
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclient.GroupCustBusinessModule;
	import com.linkage.module.cms.groupclient.data.GroupMonitorDataManager;
	import com.linkage.module.cms.groupclient.data.GroupMonitorDataManagerBS;
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
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.ListEvent;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	/**
	 * 
	 * @author shiliang
	 * 
	 */	
	public class GroupCustBusinessModuleControl extends EventDispatcher
	{
		private var loadManager:LoadManager;
		private var app:GroupCustBusinessModule;
		private var dataManager:GroupMonitorDataManager = null;
		// log
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.control.GroupBusinessMonitorModule");
		private var user:Object;
		private var defaultCustId:String;
		
		public var currentCustId:String;
		public var currentCustName:String;
		public var currentCityId:String;
		
		
		public function GroupCustBusinessModuleControl(app:GroupCustBusinessModule,target:IEventDispatcher=null)
		{
			super(target);
			var userParams:String = String(app.parameters["user"]).replace(/\'/g, "\"");
			log.info("user--->"+userParams);
			user = JSON.decode(userParams);
			this.app = app;
			defaultCustId = String(app.parameters["custId"]);
			currentCustId = defaultCustId;
			currentCustName = String(app.parameters["custName"]);
			log.info("defaultCustId--->"+defaultCustId);//这里集客必须有
			loadManager=app.loadManager;
			dataManager = new GroupMonitorDataManagerBS(String(app.parameters["urlContext"]));
		}
		/**
		 *集客性能查询
		 * @param event
		 * 
		 */
		public function queryCustBusiness():void{
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
				dataManager.getServByCust(param,perfServerTypeQueryHandler,onComplete,onError);
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
				dataManager.getServByCust(param,hisPerfServerTypeQueryHandler,onComplete,onError);
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
	}
}