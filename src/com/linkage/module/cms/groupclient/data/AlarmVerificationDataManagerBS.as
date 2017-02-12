package com.linkage.module.cms.groupclient.data
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class AlarmVerificationDataManagerBS implements AlarmVerificationDataManager
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.AlarmVerificationDataManagerBS");
		private static const remoteDestination:String="flexdestination_cms_warn_alarmvalidValidateRoamService";
		private static const remoteSource:String="com.linkage.module.cms.warn.alarmvalidate.serv.ValidateServImp";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		
		public function AlarmVerificationDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}

		
		public function alarmValidationList(param:Object, success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					success.call(null, result);
				}, function(event:FaultEvent):void
				{
					log.error("-----alarmValidationList :失败：" + event.fault.faultString);
					error.call(null, event);
				},true,"alarmValidationList");
				
				remoteService.alarmValidationList(param);
				remoteService=null;
		}
		
		public function validateAlarm(param:Object, success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					success.call(null, result);
				}, function(event:FaultEvent):void
				{
					log.error("-----validateAlarm :失败：" + event.fault.faultString);
					error.call(null, event);
				},true,"validateAlarm");
				
				remoteService.validateAlarm(param);
				remoteService=null;
		}
	}
}