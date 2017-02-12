package com.linkage.module.cms.perfmonitor.monitor.alarm.data
{
	import com.linkage.module.cms.perfmonitor.monitor.alarm.params.MonitorContainer;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class MonitorDataImp implements MonitorData
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.perfmonitor.monitor.alarm.data.MonitorDataImp");
		/**
		 * 发送数据的web目的地
		 */
		private var remoteDestination:String="flexdestination_ims_performance_main_service";
		/**
		 * 发送数据的source
		 */
		private var remoteSource:String="com.linkage.module.cms.performance.monitor.main.serv.PerformanceViewServImp";
		/**
		 * 发送数据的web目的地
		 */
		private var remoteDestinationDev:String="flexdestination_cms_performance_monitor_device_DevicePerformanceMonitorServImp";
		/**
		 * 发送数据的source
		 */
		private var remoteSourceDev:String="com.linkage.module.cms.performance.monitor.device.serv.DevicePerformanceMonitorServImp";
		/**
		 *用户的会话信息(sessionId,areaId,roleId,account,context)
		 */
		protected var mapInfo:Object=null;
		/**
		 *endpoint
		 */
		protected var endpoint:String=null;
		/**
		 *上下文
		 */
		protected var context:String=null;
		/**
		 *suffix
		 */
		public static const endpoint_SUFFIX:String="/messagebroker/amf";

		public function MonitorDataImp(maf:Object)
		{
			mapInfo=maf;
			context=maf[MonitorContainer.PARAMKEY_CONTEXT];
			context=context.replace(/\//g, "");
			endpoint="/" + context + endpoint_SUFFIX;
		}

		public function loadStatData(success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载集中性能监控数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载集中性能监控数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载集中性能监控数据】开始");
			remoteService.loadStatData(mapInfo.areaId);
		}

		public function getPerfsByMoType(params:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestinationDev, remoteSourceDev, endpoint, function(result:Object):void
				{
					log.info("【获取性能指标数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【获取性能指标数据】失败" + event);
					error.call(null, event);
				});
			log.info("【获取性能指标数据】开始");
			remoteService.getPerfsByMoType(params);
		}

		public function createSTP(params:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestinationDev, remoteSourceDev, endpoint, function(result:Object):void
				{
					log.info("【获取创建趋势图数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【获取创建趋势图数据】失败" + event);
					error.call(null, event);
				});
			log.info("【获取创建趋势图数据】开始");
			remoteService.createSTP(params);
		}
	}
}