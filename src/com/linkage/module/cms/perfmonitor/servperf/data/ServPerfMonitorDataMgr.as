package com.linkage.module.cms.perfmonitor.servperf.data
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class ServPerfMonitorDataMgr
	{
		private static const destination:String = "flexdestination_cms_performance_monitor_service_ServPerfServImp";
		private static const src:String = "com.linkage.module.cms.performance.monitor.servperf.serv.ServPerfServImp";
		private static var endpoint:String = "messagebroker/amf";
		private static var accoId:String = null;
		private static var cityId:String = null;

		//日志
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitor.servperf.servstatistic.ServPerfMonitorDataMgr");

		public static function setContext(context:String, accoid:String, cityid:String):void
		{
			endpoint = context + endpoint;
			accoId = accoid;
			cityId = cityid;
			log.info("-----init ServPerfMonitorDataMgr----- destination : " + destination);
			log.info("-----init ServPerfMonitorDataMgr----- src : " + src);
			log.info("-----init ServPerfMonitorDataMgr----- endpoint : " + endpoint);
			log.info("-----init ServPerfMonitorDataMgr----- accoId : " + accoId);
			log.info("-----init ServPerfMonitorDataMgr----- cityId : " + cityId);
		}

		//加载    指标树
		public static function getServTypePerfInfo(success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----getServTypePerfInfo :成功：" + result['treeXml']);
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----getServTypePerfInfo :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "getServTypePerfInfo");

			log.info("-----getServTypePerfInfo  加载指标树和指标列表。");
			remote.getServTypePerfInfo();
			remote = null;
		}

		//加载    我的方案
		public static function getServMonitorView(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----getServMonitorView :成功：" + (result == null ? "0" : result.length));
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----getServMonitorView :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "getServMonitorView");

			log.info("-----getServMonitorView  加载我的方案。 param:" + param);
			remote.getServMonitorView(param);
			remote = null;
		}

		//保存方案
		public static function saveServMonitorView(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----saveServMonitorView :成功：" + (result == null ? "0" : result.length));
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----saveServMonitorView :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "saveServMonitorView");

			log.info("-----saveServMonitorView  保存我的方案。 accOId:{0}, viewName:{1}, isShare:{2}, perfIds:{3}", param['accOId'], param['viewName'], param['isShare'], param['perfIds']);
			remote.saveServMonitorView(param['accOId'], param['viewName'], param['isShare'], param['perfIds']);
			remote = null;
		}

		//删除方案
		public static function deleteServMonitorView(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----deleteServMonitorView :成功：" + result);
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----deleteServMonitorView :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "deleteServMonitorView");

			log.info("-----deleteServMonitorView  删除我的方案。 accOid:{0}  viewId:{1}", param['accOid'], param['viewId']);
			remote.deleteServMonitorView(param['accOid'], param['viewId']);
			remote = null;
		}

		//指标历史信息 和告警信息
		public static function getHistoryPerfInfoAndAlarmInfo(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----getHistoryPerfInfoAndAlarmInfo :成功：" + result['alarm']);
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----getHistoryPerfInfoAndAlarmInfo :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "getHistoryPerfInfoAndAlarmInfo");

			log.info("-----getHistoryPerfInfoAndAlarmInfo  加载指标历史信息 和告警信息。 perfId:{0}, interval:{1}, cityId:{2}, startTime:{3}, endTime:{4}", param['perfId'], param['interval'], param['cityId'], param['startTime'], param['endTime']);
			log.info("cityId:{0}", cityId);
			if (param['cityId'] == "-2")
				param['cityId'] = cityId;
			log.info("-----getHistoryPerfInfoAndAlarmInfo  加载指标历史信息 和告警信息。 perfId:{0}, interval:{1}, cityId:{2}, startTime:{3}, endTime:{4}", param['perfId'], param['interval'], param['cityId'], param['startTime'], param['endTime']);
			remote.getHistoryPerfInfoAndAlarmInfo(param['perfId'], param['interval'], param['cityId'], param['startTime'], param['endTime']);
			remote = null;
		}

		//地市详情 指标
		public static function getCityPerfInfoByPerfIdAndInterval(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----getCityPerfInfoByPerfIdAndInterval :成功：" + (result == null ? "0" : result.length));
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----getCityPerfInfoByPerfIdAndInterval :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "getCityPerfInfoByPerfIdAndInterval");

			log.info("-----getCityPerfInfoByPerfIdAndInterval  加载地市详情 指标。 perfId:{0}, interval:{1}", param['perfId'], param['interval']);
			remote.getCityPerfInfoByPerfIdAndInterval(param['perfId'], param['interval']);
			remote = null;
		}

		//加载属地列表
		public static function getCityInfo(success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----getCityInfo :成功：" + (result == null ? "0" : result.length));
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----getCityInfo :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "getCityInfo");

			log.info("-----getCityInfo  加载加载属地列表。");
			remote.getCityInfo();
			remote = null;
		}

		//--------------------------------自动拨测------------------------------------------
		//加载拨测任务列表
		public static function getBoceTypeInfo(success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----getBoceTypeInfo :成功：" + (result == null ? "0" : result.length));
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----getBoceTypeInfo :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "getBoceTypeInfo");

			log.info("-----getBoceTypeInfo  加载拨测任务列表。");
			remote.getBoceTypeInfo();
			remote = null;
		}

		//加载拨测表格
		public static function getCityBocePerfAlarmMatrix(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----getCityBocePerfAlarmMatrix :成功：" + (result == null ? "0" : result.length));
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----getCityBocePerfAlarmMatrix :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "getCityBocePerfAlarmMatrix");

			log.info("-----getCityBocePerfAlarmMatrix  加载拨测表格。param:" + param);
			remote.getCityBocePerfAlarmMatrix(param);
			remote = null;
		}

		//根据查询条件加载拨测详情
		public static function queryBocePerfInfo(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----queryBocePerfInfo :成功：" + (result == null ? "0" : result.length));
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----queryBocePerfInfo :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "queryBocePerfInfo");

			log.info("-----queryBocePerfInfo 根据查询条件加载拨测详情。 cityId:{0}, boceId:{1}, startTime:{2}, endTime:{3}", param['cityId'], param['boceId'], param['startTime'], param['endTime']);
			remote.queryBocePerfInfo(param['cityId'], param['boceId'], param['startTime'], param['endTime']);
			remote = null;
		}

		//点击拨测表格  加载拨测详情
		public static function getAlarmBocePerfInfoByCityPerfId(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, function(result:Object):void
				{
					log.info("-----getAlarmBocePerfInfoByCityPerfId :成功：" + (result == null ? "0" : result.length));
					success.call(null, result);
					result = null;
				}, function(event:FaultEvent):void
				{
					log.error("-----getAlarmBocePerfInfoByCityPerfId :失败：" + event.fault.faultString);
					error.call(null, event);
				}, true, "getAlarmBocePerfInfoByCityPerfId");

			log.info("-----getAlarmBocePerfInfoByCityPerfId  点击拨测表格  加载拨测详情。cityId:{0}, boceId:{1}", param['cityId'], param['boceId']);
			remote.getAlarmBocePerfInfoByCityPerfId(param['cityId'], param['boceId']);
			remote = null;
		}

		//--------------------------------自动拨测------------------------------------------
	}
}