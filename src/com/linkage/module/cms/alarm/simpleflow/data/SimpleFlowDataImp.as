package com.linkage.module.cms.alarm.simpleflow.data
{
	import com.linkage.module.cms.alarm.framework.AlarmContainer;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class SimpleFlowDataImp implements SimpleFlowData
	{
		
			/*private static const DESTINATION:String="flexdestination_cms_groupsupport_performance_eqptperfor_EquipmentService";
			private static const SOURCE:String="com.linkage.module.cms.groupsupport.performance.eqptperfor.serv.EquipmentServImpl";*/
			
			private static const DESTINATION:String="flexdestination_cms_groupsupport_alarm_buscallservice";
			private static const SOURCE:String="com.linkage.module.cms.groupsupport.alarm.buscall.serv.BusCallServImp";

			private static const endpoint_SUFFIX:String="/messagebroker/amf";
			
			private var endpoint:String=null;
			
			private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.SimpleFlowDataImp");
			
			public function SimpleFlowDataImp(context:String)
			{
				endpoint=context + endpoint_SUFFIX;
			}
			
			public function queryHisInfo(param:Object, success:Function, complete:Function=null, error:Function=null):void
			{
				log.info("nima");
				var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
				{
					log.info("success");
					success.call(null, result);
				}, function(event:FaultEvent):void
				{
					log.info("error");
					log.error(event.message.toString());
					error.call(null, event);
				}, true, "queryHisInfo");
				remoteService.queryHisInfo(param);
				log.info("end");
			}
	}
}