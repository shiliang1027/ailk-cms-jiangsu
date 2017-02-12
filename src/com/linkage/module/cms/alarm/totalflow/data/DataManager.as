package com.linkage.module.cms.alarm.totalflow.data
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.alarm.totalflow.AlarmContainer;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
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
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.totalflowalarm.data.DataManager");
		/**
		 * 发送数据的web目的地
		 */
		private var _remoteDestination:String="flexdestination_ims_alarm_totalflowAlarmView_service";
		/**
		 * 发送数据的source
		 */
		private var _remoteSource:String="com.linkage.module.cms.alarm.totalflowalarm.serv.TotalFlowAlarmViewServImp";
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
			context=mapInfo[AlarmContainer.PARAMKEY_CONTEXT];
			context=context.replace(/\//g, "");
			endpoint="/" + context + endpoint_SUFFIX;
		}

		public function loadStatData(success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载统计数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载统计数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载统计数据】开始");
			remoteService.loadStatData(_mapInfo.areaId);
		}

		public function loadSheetStatData(success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载工单统计数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载工单统计数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载工单统计数据】开始");
			remoteService.loadSheetStatData(_mapInfo.areaId);
		}

		public function loadSheetDetailData(spec:String, sheetType:String, success:Function, error:Function=null):void
		{
			//1.初始化参数
			var params:Object=new Object();
			params["spec"]=spec;
			params["sheetType"]=sheetType;
			params["areaId"]=_mapInfo.areaId;

			//2.查询数据
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载工单详情数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载工单详情数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载工单详情数据】开始");
			remoteService.loadSheetDetailData(params);
		}

		public function loadSheetDetailInfo(curPage:int, pageSize:int, specName:String, cityName:String, queryType:String, success:Function, error:Function=null):void
		{
			//1.初始化参数
			var params:Object=new Object();
			params["pageSize"]=pageSize;
			params["curPage"]=curPage;
			params["specName"]=specName;
			params["cityName"]=cityName;
			params["queryType"]=queryType;

			//2.查询数据
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载工单详细数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载工单详细数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载工单详细数据】开始");
			remoteService.loadSheetDetailInfo(params);
		}

		public function get remoteDestination():String
		{
			return _remoteDestination;
		}

		public function get remoteSource():String
		{
			return _remoteSource;
		}
	}
}