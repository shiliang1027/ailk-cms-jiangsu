package com.linkage.module.cms.alarm.countflow.data
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.alarm.countflow.param.StatContainer;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class CountAlarmDataImp implements CountAlarmData
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.alarm.countflow.data.CountAlarmDataImp");
		/**
		 * 发送数据的web目的地
		 */
		private var remoteDestination:String = "flexdestination_cms_warn_stat_WarnStaconf_service";
		/**
		 * 发送数据的source
		 */
		private var remoteSource:String = "com.linkage.module.cms.warn.stat.serv.WarnStaconfServImp";
		/**
		 *用户的会话信息(sessionId,areaId,roleId,account,context)
		 */
		protected var mapInfo:Object = null;
		/**
		 *endpoint
		 */
		protected var endpoint:String = null;
		/**
		 *上下文
		 */
		protected var context:String = null;
		/**
		 *suffix
		 */
		public static const endpoint_SUFFIX:String = "/messagebroker/amf";

		public function CountAlarmDataImp(maf:Object)
		{
			mapInfo = maf;
			context = maf[StatContainer.PARAMKEY_CONTEXT];
			context = context.replace(/\//g, "");
			endpoint = "/" + context + endpoint_SUFFIX;
		}

		public function loadStatLineData(type:String, success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载统计趋势图数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载统计趋势图数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载统计趋势图数据】开始");
			remoteService.getWarnStatListByType(type);
		}

		public function getWarnStatInfoList(success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载告警统计数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载告警统计数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载告警统计数据】开始");
			remoteService.getWarnStatInfoList();
		}

		public function getWarnStatInfoListNew(success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载告警统计数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载告警统计数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载告警统计数据】开始");
			remoteService.getWarnStatInfoListNew();
		}

		public function getSheetWarnStatInfoList(success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载工单统计数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载工单统计数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载工单统计数据】开始");
			remoteService.getSheetWarnStatInfoList(mapInfo.areaId);
		}

		public function getRelationWarnStatInfoList(success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载关联告警统计数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载关联告警统计数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载关联告警统计数据】开始");
			remoteService.getRelationWarnStatInfoList(mapInfo.account);
		}
		
		//add by 汪炜 at 2014-6-6
		public function getCityAlarmStatInfoList(success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("【加载地市一级告警统计数据】成功");
				success.call(this, result);
			}, function(event:FaultEvent):void
			{
				log.info("【加载地市一级告警统计数据】失败" + event);
				error.call(null, event);
			});
			log.info("【加载地市一级告警统计数据】开始");
			remoteService.getCityAlarmStatInfoList(mapInfo.account);
		}
		
		//add by hurw at 5.21.2013
		public function loadWarnStatDetailData(curPage:int, pageSize:int, specId:String, specName:String, sheetType:String, totalCount:String, success:Function, error:Function = null):void
		{
			//1.初始化参数
			var params:Object = new Object();
			params["pageSize"] = pageSize;
			params["curPage"] = curPage;
			params["specId"] = specId;
			params["specName"] = specName;
			params["sheetType"] = sheetType;
			params["mk"] = "queryalarm";
			params["ln"] = mapInfo.account;
			params["num"] = totalCount;
			params["login_name"] = mapInfo.account;

//			Alert.show(JSON.encode(params));

			log.info(remoteDestination);
			log.info(remoteSource);
			log.info(endpoint);
			//2.查询数据
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载告警详情数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载告警详情数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载告警详情数据】开始");
			remoteService.queryWarnStatInfoDetail(params);
		}
		
		public function loadCityWarnStatDetailData(curPage:int, pageSize:int, specId:String, specName:String, sheetType:String, totalCount:String,alarmregion:String,success:Function, error:Function = null):void
		{
			//1.初始化参数
			var params:Object = new Object();
			params["pageSize"] = pageSize;
			params["curPage"] = curPage;
			params["specId"] = specId;
			params["specName"] = specName;
			params["sheetType"] = sheetType;
			params["mk"] = "queryalarm";
			params["ln"] = mapInfo.account;
			params["num"] = totalCount;
			params["alarmregion"] = alarmregion;
			params["login_name"] = mapInfo.account;

//			Alert.show(JSON.encode(params));
			log.info(remoteDestination);
			log.info(remoteSource);
			log.info(endpoint);
			//2.查询数据
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【加载告警详情数据】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【加载告警详情数据】失败" + event);
					error.call(null, event);
				});
			log.info("【加载告警详情数据】开始");
			remoteService.queryWarnStatInfoFCDetail(params);
		}

		public function loadSheetDetailData(specId:String, specName:String, sheetType:String, success:Function, error:Function = null):void
		{
			//1.初始化参数
			var params:Object = new Object();
			params["specId"] = specId;
			params["specName"] = specName;
			params["sheetType"] = sheetType;
			params["areaId"] = mapInfo.areaId;

			//2.查询数据
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
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

		public function loadSheetDetailInfo(curPage:int, pageSize:int, specId:String, cityName:String, queryType:String, success:Function, error:Function = null):void
		{
			//1.初始化参数
			var params:Object = new Object();
			params["pageSize"] = pageSize;
			params["curPage"] = curPage;
			params["specId"] = specId;
			params["cityName"] = cityName;
			params["queryType"] = queryType;

			//2.查询数据
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
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
	}
}

