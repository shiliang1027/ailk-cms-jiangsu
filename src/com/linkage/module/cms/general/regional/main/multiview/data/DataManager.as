package com.linkage.module.cms.general.regional.main.multiview.data
{
	import com.linkage.module.cms.general.regional.main.multiview.param.MultiContainer;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 获取数据的实现类
	 * @author mengqiang
	 *
	 */
	public class DataManager implements IDataManager
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.main.multiview.data.DataManager");
		/**
		 * 发送数据的web目的地
		 */
		private var remoteDestination:String="flexdestination_cms_regional_multipleService";
		/**
		 * 发送数据的source
		 */
		private var remoteSource:String="com.linkage.module.cms.general.regional.view.multiple.serv.MultipleServiceImpl";
		/**
		 *用户的会话信息(sessionId,areaId,roleId,account,context)
		 */
		protected var _mapInfo:Object=null;
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

		public function DataManager(mapInfo:Object)
		{
			_mapInfo=mapInfo;
			context=mapInfo[MultiContainer.PARAMKEY_CONTEXT];
			context=context.replace(/\//g, "");
			endpoint="/" + context + endpoint_SUFFIX;
		}

		public function loadAlarmTotal(viewId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【多维视图】加载告警汇总数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【多维视图】加载告警汇总数据失败" + event);
				});
			log.info("【多维视图】加载告警汇总数据开始");
			remoteService.loadAlarmTotal(viewId);
		}

		public function getSegmentList(viewId:String, segmentType:int, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【多维视图】加载指定场景统计指标列表数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【多维视图】加载指定场景统计指标列表数据失败" + event);
				});
			log.info("【多维视图】加载指定场景统计指标列表数据开始");
			remoteService.getSegmentList(viewId, segmentType);
		}

		public function getBusinessSegmentData(viewId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【多维视图】加载指定场景业务指标柱状图统计数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【多维视图】加载指定场景业务指标柱状图统计数据失败" + event);
				});
			log.info("【多维视图】加载指定场景业务指标柱状图统计数据开始");
			remoteService.getBusinessSegmentData(viewId);
		}

		public function getPerfSegmentData(viewId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【多维视图】加载指定场景性能指标趋势图统计数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【多维视图】加载指定场景性能指标趋势图统计数据失败" + event);
				});
			log.info("【多维视图】加载指定指定场景性能指标趋势图统计数据开始");
			remoteService.getPerfSegmentData(viewId);
		}

		public function getAlarmFilter(viewId:String, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【多维视图】加载多维视图告警过滤器数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【多维视图】加载多维视图告警过滤器数据失败" + event);
				});
			log.info("【多维视图】加载多维视图告警过滤器数据开始");
			remoteService.getAlarmFilter(viewId);
		}
	}
}