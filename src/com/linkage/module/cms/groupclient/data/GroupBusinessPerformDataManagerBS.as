package com.linkage.module.cms.groupclient.data
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class GroupBusinessPerformDataManagerBS implements GroupBusinessPerformDataManager
	{
		private static const DESTINATION:String="flexdestination_cms_report_business_BusinessService";
		private static const SOURCE:String="com.linkage.module.cms.report.business.serv.BusinessServImp";
			
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.GroupBusinessPerformDataManagerBS");
			
		public function GroupBusinessPerformDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}
		
			
		public function qureyHistoryAlarmData(param:Object,success:Function,complete:Function=null,error:Function=null):void
		{	
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
			},true,"qureyHistoryAlarmData");
				
			remoteService.qureyHistoryAlarmData(param);
			remoteService=null;
		}
	}
}