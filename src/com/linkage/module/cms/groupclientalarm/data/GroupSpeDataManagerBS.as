package com.linkage.module.cms.groupclientalarm.data
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;

	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class GroupSpeDataManagerBS implements GroupSpeDataManager
	{
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.GroupSpeDataManagerBS");
		private static const DESTINATION:String = "flexdestination_cms_groupsupport_performance_kpi_kpiservice";
		private static const SOURCE:String = "com.linkage.module.cms.groupsupport.performance.kpi.serv.KpiServImpl";
		private static const endpoint_SUFFIX:String = "/messagebroker/amf";
		private var endpoint:String = null;


		public function GroupSpeDataManagerBS(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}

		public function queyrKpiTree(param:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			log.info("queryKpiTree");
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
				{
					success.call(null, result);
				}, function(event:FaultEvent):void
				{
					log.error(event.message.toString());
					error.call(null, event);
				}, true, "queryKpiTree");
			remoteService.queryKpiTree();
		}

		public function queryKpiListInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			log.info("queryKpiListInfo");
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
				{
					success.call(null, result);
				}, function(event:FaultEvent):void
				{
					log.error(event.message.toString());
					error.call(null, event);
				}, true, "queryKpiListInfo");
			remoteService.queryKpiListInfo(param);
		}


	}

}