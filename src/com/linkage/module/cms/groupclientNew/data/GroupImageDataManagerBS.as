package com.linkage.module.cms.groupclientNew.data
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class GroupImageDataManagerBS implements GroupImageDataManager
	{
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclientNew.data.GroupCustDataManagerBS");
		private static const DESTINATION:String = "flexdestination_cms_groupsupport_report_custreport_CustReportService";
		private static const SOURCE:String = "com.linkage.module.cms.groupsupport.report.custreport.serv.CustReportServImp";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		
		public function GroupImageDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}

		public function getCustInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getCustInfo");
			remoteService.getCustInfo(param);
		}
	}
}