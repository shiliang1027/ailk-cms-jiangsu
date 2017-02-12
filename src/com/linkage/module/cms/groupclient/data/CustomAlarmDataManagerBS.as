package com.linkage.module.cms.groupclient.data
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 该as的描述信息
	 * @author shiliang(66614) Tel:13770527121
	 * @version 1.0
	 * @since 2012-1-5 上午11:53:31
	 * @category com.linkage.module.cms.groupclient.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public class CustomAlarmDataManagerBS implements CustomAlarmDataManager
	{
		
		private static const DESTINATION:String="flexdestination_cms_groupcustom_customalarm_customalarmservice";
		private static const SOURCE:String="com.linkage.module.cms.groupcustom.single.serv.CustomAlarmServImp";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.CustomAlarmDataManagerBS");
		
		public function CustomAlarmDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}
		
		public function queryCust(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			},true,"queryCust");
			remoteService.customQuery(param);
		}
	}
}