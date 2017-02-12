package com.linkage.module.cms.perfmonitor.subject.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class SubjectInterfaceCommServiceImp implements SubjectInterfaceCommService
	{
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitor.subject.SubjectInterfaceCommServiceImp");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_perfmonitor_subject_subjectInterfaceCommService";
		//
		protected var remoteSource:String = "com.linkage.module.cms.perfmonitor.subject.serv.commInterface.SubjectInterfaceCommService";
		
		public function SubjectInterfaceCommServiceImp(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}
		
		/**
		 * 单个网元的详细信息
		 * @param paramMap {mo_id:"test_id"}
		 * @return 具体格式待定
		 */
		public function moDetailInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "moDetailInfo");
			
			remote.moDetailInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 单个网元的性能信息
		 * @param paramMap {mo_id:"test_id"}
		 * @return 具体格式待定 
		 */
		public function moPerfInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "moPerfInfo");
			
			remote.moPerfInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 单个网元的告警信息
		 * @param paramMap {mo_id:"test_id"}
		 * @return 具体格式待定 
		 */
		public function moAlarmInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "moAlarmInfo");
			
			remote.moAlarmInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 查询所有属地信息
		 * @return [{"city_id":"1","city_name":"江苏省","city_layer":"1","parent_id":"-1"}]
		 */
		public function getAllCityTree(success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "getAllCityTree");
			
			remote.getAllCityTree();
			remote = null;
		}
		
		private function doNoParamCallBack(complete:Function):void
		{
			if (complete != null)
			{
				complete.call(null);
			}
		}
	}
}