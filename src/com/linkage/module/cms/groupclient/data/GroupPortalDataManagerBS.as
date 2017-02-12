package com.linkage.module.cms.groupclient.data
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class GroupPortalDataManagerBS implements GroupPortalDataManager
	{
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.GroupPortalDataManagerBS");
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		public function GroupPortalDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}
		
		public function getSLAAlarmData(param:Object,success:Function,complete:Function=null,error:Function=null):ArrayCollection
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService("flexdestination_groupsupport_home_homeservice", "com.linkage.module.cms.groupsupport.home.serv.HomeServImp", endpoint, 
				function(result:Object):void
				{
					success.call(null, result);  
				}, function(event:FaultEvent):void
				{
					log.error(event.message.toString());
					error.call(null, event);
				}, true, "getSLAInfo");
			return remoteService.getSLAInfo(param);
		}
		public function getServiceQAAlarmData(param:Object,success:Function,complete:Function=null,error:Function=null):ArrayCollection
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService("flexdestination_groupsupport_home_homeservice", "com.linkage.module.cms.groupsupport.home.serv.HomeServImp", endpoint, 
				function(result:Object):void
				{
					success.call(null, result);  
				}, function(event:FaultEvent):void
				{
					log.error(event.message.toString());
					error.call(null, event);
				}, true, "getServiceQuaInfo");
			return remoteService.getServiceQuaInfo(param);
		}
		public function getAlarmInfo(param:Object,success:Function,complete:Function=null,error:Function=null):ArrayCollection
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService("flexdestination_groupsupport_home_homeservice", "com.linkage.module.cms.groupsupport.home.serv.HomeServImp", endpoint, 
				function(result:Object):void
			{
				success.call(null, result);  
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getAlarmInfo");
			return remoteService.getAlarmInfo(param);
		}
		
		public function getTotalSheetInfo(param:Object,success:Function,complete:Function=null,error:Function=null):ArrayCollection
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService("flexdestination_groupsupport_home_homeservice", "com.linkage.module.cms.groupsupport.home.serv.HomeServImp", endpoint, 
				function(result:Object):void
				{
					success.call(null, result);  
				}, function(event:FaultEvent):void
				{
					log.error(event.message.toString());
					error.call(null, event);
				}, true, "getTotalSheetInfo");
			return remoteService.getTotalSheetInfo();
		}
		
		public function getMsgInfo(param:Object,success:Function,complete:Function=null,error:Function=null):String
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService("flexdestination_groupsupport_home_homeservice", "com.linkage.module.cms.groupsupport.home.serv.HomeServImp", endpoint, 
				function(result:Object):void
				{
					success.call(null, result);  
				}, function(event:FaultEvent):void
				{
					log.error(event.message.toString());
					error.call(null, event);
				}, true, "getMsgInfo");
			return remoteService.getMsgInfo(param);
		}
		
		
	}
}
