package com.linkage.module.cms.general.regional.view.roam.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-7-2 下午09:21:08
	 * @category com.linkage.module.cms.general.regional.view.roam.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public class RoamDataManagerDS implements RoamDataManager
	{
		
		private static const DESTINATION:String="flexdestination_cms_general_regional_view_roam_roamservice";
		private static const SOURCE:String="com.linkage.module.cms.general.regional.view.roam.serv.RoamServImp";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		
		public function RoamDataManagerDS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}
		
		public function roamQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				Alert.show(event.message.toString(),"Error");
			});
			remoteService.roamQuery(param);
		}
		
		public function roamQueryNoPage(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				Alert.show(event.message.toString(),"Error");
			});
			remoteService.roamQueryNoPage(param);
		}
		
		public function roamStatQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				Alert.show(event.message.toString(),"Error");
			});
			remoteService.roamStatQuery(param);
		}
		
		public function roamLegendQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				Alert.show(event.message.toString(),"Error");
			});
			remoteService.roamLegendQuery(param);
		}
		
		public function saveLegend(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				Alert.show(event.message.toString(),"Error");
			});
			remoteService.saveLegend(param);
		}
		
	}
}