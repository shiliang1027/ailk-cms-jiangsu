package com.linkage.module.cms.groupclientNew.data
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class GroupCustDataManagerBS implements GroupCustDataManager
	{
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclientNew.data.GroupCustDataManagerBS");
		private static const DESTINATION:String="flexdestination_cms_groupcustom_analybusiness_service";
		private static const SOURCE:String="com.linkage.module.cms.groupcustom.analybusiness.serv.BusinessAnalyServImp";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		
		public function GroupCustDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}

		
		public function load(param:String,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "load");
			remoteService.load(param);
		}
		
		public function save(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "save");
			remoteService.save(param);
		}
		public function loadCompetitors(param:String,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "loadCompetitors");
			remoteService.loadCompetitors(param);
		}
		
		public function saveCompetitors(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "saveCompetitors");
			remoteService.saveCompetitors(param);
		}
	}
}