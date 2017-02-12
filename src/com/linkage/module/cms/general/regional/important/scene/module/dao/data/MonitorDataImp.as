package com.linkage.module.cms.general.regional.important.scene.module.dao.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;

	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *场馆监控Data实现类
	 * @author mengqiang
	 *
	 */
	public class MonitorDataImp implements MonitorData
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.important.scene.module.dao.data.MonitorDataImp");
		/**
		 * 发送数据的source
		 */
		private var remoteSource:String="com.linkage.module.cms.general.regional.view.venue.serv.VenueMonitorServImpl";
		/**
		 * 发送数据的web目的地
		 */
		private var remoteDestination:String="flexdestination_cms_regional_venueService";
		/**
		 *suffix
		 */
		public static const endpoint_SUFFIX:String="/messagebroker/amf";
		/**
		 *endpoint
		 */
		protected var endpoint:String=null;

		public function MonitorDataImp(context:String)
		{
			context=context.replace(/\//g, "");
			endpoint="/" + context + endpoint_SUFFIX;
		}

		public function getVenueListInfo(monitorId:Object, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载场馆列表数据成功, result:" + (result == null ? "0" : +result.length));
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载场馆列表数据失败" + event);
				});
			log.info("【场馆监控】加载场馆列表数据开始 monitorId:" + monitorId);
			remoteService.getVenueListInfo(String(monitorId));
		}

		public function getVenueSegmentList(venueId:String, segmentType:int, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载指定场馆的统计数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载指定场馆的统计数据失败" + event);
				});
			log.info("【场馆监控】加载指定场馆的统计数据开始");
			remoteService.getVenueSegmentList(venueId, segmentType);
		}

		public function getSegmentData(venueId:String, segmentType:int, queryTime:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载指定场馆指标统计数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载指定场馆指标统计数据失败" + event);
				});
			log.info("【场馆监控】加载指定场馆指标统计数据开始");
			remoteService.getSegmentData(venueId, segmentType, queryTime);
		}

		public function getVenuePicture(venueId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载场馆现场图片数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载场馆现场图片数据失败" + event);
				});
			log.info("【场馆监控】加载场馆现场图片数据开始");
			remoteService.getVenuePicture(venueId);
		}

		public function getVenueOutlineInfo(venueId:String, queryTime:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载场馆概述数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载场馆概述数据失败" + event);
				});
			log.info("【场馆监控】加载场馆概述数据开始");
			remoteService.getVenueOutlineInfo(venueId, queryTime);
		}

		public function getVenueAlarmFilter(venueId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:String):void
				{
					log.info("【场馆监控】加载场馆的告警过滤器数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载场馆的告警过滤器数据失败" + event);
				});
			log.info("【场馆监控】加载场馆的告警过滤器数据开始");
			remoteService.getVenueAlarmFilter(venueId);
		}

		public function getVenueInfo(venueId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载场馆监控基本信息数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载场馆监控基本信息数据失败" + event);
				});
			log.info("【场馆监控】加载场馆监控基本信息数据开始");
			remoteService.getVenueInfo(venueId);
		}

		public function getVenueEnsureDoc(venueId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载场馆的保障方案数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载场馆的保障方案数据失败" + event);
				});
			log.info("【场馆监控】加载场馆的保障方案数据开始");
			remoteService.getVenueEnsureDoc(venueId);
		}

		public function getVenueRaceInfo(venueId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载场馆的赛事信息数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载场馆的赛事信息数据失败" + event);
				});
			log.info("【场馆监控】加载场馆的赛事信息数据开始");
			remoteService.getVenueRaceInfo(venueId);
		}

		public function getAllVenueNe(venueId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载场馆的所有网元信息数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载场馆的所有网元信息数据失败" + event);
				});
			log.info("【场馆监控】加载场馆的所有网元信息数据开始");
			remoteService.getAllVenueNe(venueId);
		}

		public function getNeSegmentData(neId:String, venueId:String, queryTime:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载单个网元各个指标的统计数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载单个网元各个指标的统计数据失败" + event);
				});
			log.info("【场馆监控】加载单个网元各个指标的统计数据开始");
			remoteService.getNeSegmentData(neId, venueId, queryTime);
		}

		public function getNeSegment(neId:String, venueId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控】加载场馆内指定网元的统计指标数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控】加载场馆内指定网元的统计指标数据失败" + event);
				});
			log.info("【场馆监控】加载场馆内指定网元的统计指标数据开始");
			remoteService.getNeSegment(neId, venueId);
		}
	}
}