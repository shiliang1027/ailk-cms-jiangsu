package com.linkage.module.cms.alarm.matrix.data
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class DataManager implements IDataManager
	{
		
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.alarm.matrix.data.DataManager");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_alarm_matrix_AlarmMatrixServ";
		//
		protected var remoteSource:String = "com.linkage.module.cms.alarm.matrix.serv.AlarmMatrixServImp";
		
		public function DataManager(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}
		
		public function getSpecAlarmMatrix(areaId:String, success:Function, error:Function = null):void 
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
			}, function(event:FaultEvent):void
			{
				error.call(null);
			}, true, "getSpecAlarmMatrix");
			
			remote.getSpecAlarmMatrix(areaId);
			remote = null;
		}
		
		public function getCityAlarmMatrix(areaId:String, success:Function, error:Function = null):void 
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
			}, function(event:FaultEvent):void
			{
				error.call(null);
			}, true, "getCityAlarmMatrix");
			remote.getCityAlarmMatrix(areaId);
			remote = null;
		}
		
		public function getMoAlarmMatrix(specId:String,areaId:String,success:Function, error:Function = null):void 
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
			}, function(event:FaultEvent):void
			{
				error.call(null);
			}, true, "getMoAlarmMatrix");
			
			remote.getMoAlarmMatrix(specId,areaId);
			remote = null;
		}
	}
}