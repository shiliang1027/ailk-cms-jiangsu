package com.linkage.module.cms.proactivemonitor.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-10-18 下午12:09:05
	 * @category com.linkage.module.cms.proactivemonitor.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ProactiveMonitorDataManagerDS implements ProactiveMonitorDataManager
	{
		private static const DESTINATION:String="flexdestination_cms_proactivemonitor_proactiveMonitorService";
		private static const SOURCE:String="com.linkage.module.cms.proactivemonitor.serv.ProactiveMonitorServImp";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;

		public function ProactiveMonitorDataManagerDS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}
		
		public function citysQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.citysQuery(param);
		}
		
		public function zoreTraffic2GDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.zoreTraffic2GDataQuery(param);
		}
		
		public function zoreTraffic2GGisDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.zoreTraffic2GGisDataQuery(param);
		}
		
		public function zoreTrafficTDDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.zoreTrafficTDDataQuery(param);
		}
		
		public function zoreTrafficTDGisDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.zoreTrafficTDGisDataQuery(param);
		}
		
		public function wlanRateBusyChartDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.getWlan2GBusyRateChartData(param);
		}
		
		
		public function wlanRateBusyDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.getWlan2GBusyRateGridData(param);
		}
		
		public function wlanRateBusyGisDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.getWlan2GBusyRateGridData(param);
		}
		
		public function wlanRate2GDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.wlanRate2GDataQuery(param);
		}
		
		public function wlanRate2GGisDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.wlanRate2GDataQuery(param);
		}
		
		public function wlanRate2GChartDataQuery(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.wlanRate2GChartDataQuery(param);
		}
		
		public function estCellStpData(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.estCellStpData(param);
		}
		
		public function getKpis(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.getKpis(param);
		}
		
		public function estCellData(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				//				Alert.show(event.message.toString(),"Error");
			});
			remoteService.estCellData(param);
		}
	}
}