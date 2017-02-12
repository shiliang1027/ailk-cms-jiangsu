package com.linkage.module.cms.groupclient.control
{
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclient.components.CustomAlarmComp;
	import com.linkage.module.cms.groupclient.data.CustomAlarmDataManager;
	import com.linkage.module.cms.groupclient.data.CustomAlarmDataManagerBS;
	import com.linkage.module.cms.groupclient.event.CustomAlarmCompEvent;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.ILoggingTarget;
	import com.linkage.system.logging.Log;
	import com.linkage.system.logging.LogEventLevel;
	import com.linkage.system.logging.targets.MonsterTarget2;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	
	import mx.core.IFlexDisplayObject;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	
	/**
	 * 告警影响客户数控制类
	 * @author shiliang(66614) Tel:13770527121
	 * @version 1.0
	 * @since 2012-1-5 上午11:49:00
	 * @category com.linkage.module.cms.groupclient.control
	 * @copyright 南京联创科技 网管开发部
	 */
	public class CustomAlarmModuleControl extends EventDispatcher
	{
		private var parameters:Object;
		private var loadManager:LoadManager;
		private var app:Object;
		private var dataManager:CustomAlarmDataManager;
		private var custInfoUrl:String = "/cms/groupcustom/monitor/monitorMonitor.action";
		
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.control.CustomAlarmModuleControl");
		
		private var customAlarmComp:CustomAlarmComp;
		
		public function CustomAlarmModuleControl(parameters:Object,loadManager:LoadManager,app:Object,target:IEventDispatcher=null)
		{
			super(target);
			this.parameters = parameters;
			this.loadManager = loadManager;
			this.app = app;
			dataManager = new CustomAlarmDataManagerBS(String(parameters["urlContext"]));
			customAlarmComp = new CustomAlarmComp();
			customAlarmComp.addEventListener(CustomAlarmCompEvent.QUERYCUST,customAlarmComp_queryCustHandler);
			customAlarmComp.addEventListener(CustomAlarmCompEvent.CUSTSHOW,customAlarmComp_custShowHandler);
			app.addElement(customAlarmComp);
//			PopUpManager.addPopUp(customAlarmComp,DisplayObject(app));
//			PopUpManager.centerPopUp(customAlarmComp);
			var evt:CustomAlarmCompEvent = new CustomAlarmCompEvent(CustomAlarmCompEvent.QUERYCUST);
			var param:Object = new Object;
			param.alarmId = parameters["alarmId"];
			param.locateneType = parameters["locateneType"];
			param.specialty = parameters["specialty"];
			evt.param = param;
			customAlarmComp.dispatchEvent(evt);
		}
		
		private function onComplete():void{
			
		}
		private function onError(event:FaultEvent):void{
			loadManager.hideLoading();
		}
		
		protected function customAlarmComp_queryCustHandler(event:CustomAlarmCompEvent):void
		{
			queryCust(event.param);
		}
		
		protected function customAlarmComp_custShowHandler(event:CustomAlarmCompEvent):void
		{
			custShow(event.param);
		}

		public function queryCust(param:Object):void{
			log.info("[查询影响客户数]param:"+param);
			loadManager.showLoading();
			dataManager.queryCust(param,queryCustHandler,onComplete,onError);
		}
		
		private function queryCustHandler(result:Object):void{
			log.info("[查询影响客户数]result:"+result);
			loadManager.hideLoading();
			var evt:CustomAlarmCompEvent = new CustomAlarmCompEvent(CustomAlarmCompEvent.DATACHANGE);
			evt.param = result;
			customAlarmComp.dispatchEvent(evt);
		}
		
		public function custShow(param:Object):void{
			var variables:URLVariables = new URLVariables();
			variables.custId=param.custId;
			var request:URLRequest = new URLRequest(parameters["urlContext"]+custInfoUrl);
			request.data=variables;
			navigateToURL(request,"_blank");
		}
		
	}
}