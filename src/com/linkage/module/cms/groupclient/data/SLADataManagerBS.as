package com.linkage.module.cms.groupclient.data
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-6-27 上午11:45:46
	 * @category com.linkage.module.cms.groupclient.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public class SLADataManagerBS implements SLADataManager
	{
		
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.SLADataManagerBS");
		
		private static const DESTINATION:String="flexdestination_cms_groupcustom_monitor_groupcustomservice";
		private static const SOURCE:String="com.linkage.module.cms.groupcustom.single.serv.MonitorServImp";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		public function SLADataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}
		public function getSLAXml(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getSLAXml");
			remoteService.getSLAXml();
		}
		
		public function getSafeLevel(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getSafeLevel");
			remoteService.getSafeLevel();
		}
		
		public function addSLA(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "addSLA");
			remoteService.addSLA(param);
		}
		
		public function getSLAConfig(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getSLAConfig");
			remoteService.getSLAConfig();
		}
	}
}