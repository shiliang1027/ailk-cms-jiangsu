package com.linkage.module.cms.general.regional.important.venue.module.dao.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *场景监控Data实现类
	 * @author mengqiang
	 *
	 */
	public class VenueDataImp implements VenueData
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.important.venue.module.dao.data.MonitorDataImp");
		/**
		 * 发送数据的source
		 */
		private var remoteSource:String="com.linkage.module.cms.general.regional.view.venue.serv.VenueMainServImp";
		/**
		 * 发送数据的web目的地
		 */
		private var remoteDestination:String="flexdestination_cms_regional_view_VenueMainService";
		/**
		 *suffix
		 */
		public static const endpoint_SUFFIX:String="/messagebroker/amf";
		/**
		 *endpoint
		 */
		protected var endpoint:String=null;

		public function VenueDataImp(context:String)
		{
			context=context.replace(/\//g, "");
			endpoint="/" + context + endpoint_SUFFIX;
		}

		public function getVenueInfo(param:Object, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控首页】加载场馆信息数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控首页】加载场馆信息数据失败" + event);
				});
			log.info("【场馆监控首页】加载场馆信息数据开始");
			remoteService.getVenueInfo(param);
		}

		public function getVenuePerfInfo(param:Object, success:Function, error:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控首页】加载场馆性能信息数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控首页】加载场馆性能信息数据失败" + event);
					error.call(this, event);
				});
			log.info("【场馆监控首页】加载场馆性能信息数据开始");
			remoteService.getVenuePerfInfo(param);
		}


		public function getVenueAlarmInfo(param:Object, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控首页】加载场馆告警信息数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控首页】加载场馆告警信息数据失败" + event);
				});
			log.info("【场馆监控首页】加载场馆告警信息数据开始");
			remoteService.getVenueAlarmInfo(param);
		}

		public function getVenMaAla(param:Object, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控首页】加载场馆赛事告警信息数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控首页】加载场馆赛事告警信息数据失败" + event);
				});
			log.info("【场馆监控首页】加载场馆赛事告警信息数据开始");
			remoteService.getVenMaAla(param);
		}

		public function getVenPerfList(param:Object, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【场馆监控首页】加载场馆性能信息(列表模式)数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【场馆监控首页】加载场馆性能信息(列表模式)数据失败" + event);
				});
			log.info("【场馆监控首页】加载场馆性能信息(列表模式)数据开始");
			remoteService.getVenPerfList(param);
		}
	}
}