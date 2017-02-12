package com.linkage.module.cms.perfmonitor.subject.data
{
	
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class SubjectHotSpotServiceImp implements SubjectHotSpotService
	{
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitor.subject.SubjectHotSpotServiceImp");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_perfmonitor_subject_SubjectHotSpotService";
		//
		protected var remoteSource:String = "com.linkage.module.cms.perfmonitor.subject.serv.hotspot.SubjectHotSpotService";
		
		public function SubjectHotSpotServiceImp(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}
		
		/**
		 * 按类型返回热点资列表
		 * @param paramMap {hotspot_type:"高校、党政军、铁路、车站、机场等"}
		 * @return [{"hotspot_id":"1","hotspot_name":"test","hotspot_type":"1","city_id":"0001","county_id":"000101"}]
		 */
		public function hotspotList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "hotspotList");
			
			remote.hotspotList(paramMap);
			remote = null;
		}
		
		/**
		 * 热点区域网元GIS洒点接口
		 * @param paramMap {hotspot_id:"test_id"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","mo_type_id":"101"}]
		 */
		public function hotspotCellGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "hotspotCellGisInfo");
			
			remote.hotspotCellGisInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 热点区域概况统计信息
		 * @param paramMap {hotspot_id:"test_id"}
		 * @return 格式待定
		 */
		public function hotspotGeneralStat(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "hotspotGeneralStat");
			
			remote.hotspotGeneralStat(paramMap);
			remote = null;
		}
		
		/**
		 * 热点区域网元资源信息列表
		 * @param paramMap {hotspot_id:"test_id"}
		 * @return [{"mo_id":"1","mo_name":"test","mo_type_id":"101"}]具体格式待定
		 */
		public function hotspotCellInfoList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "hotspotCellInfoList");
			
			remote.hotspotCellInfoList(paramMap);
			remote = null;
		}
		
		/**
		 * 热点区域网元性能数据列表
		 * @param paramMap {hotspot_id:"test_id"}
		 * @return [{"mo_id":"1","mo_name":"test","perf_type_name":"掉话率","perf_value":"2%"]
		 */
		public function hotspotPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "hotspotPerfList");
			
			remote.hotspotPerfList(paramMap);
			remote = null;
		}
		
        /** 查询热点内网元类型的性能KPI指标
         * @param paramMap {moTypeId:101}
         * @return [{label:"小区用户数",value:"1001"},{label:"掉话率",value:"1002"}......]
         */
        public function hotspotKpiList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
            {
                log.info('查询性能指标列表成功：' + result.length);
                success.call(null, result);
                result = null;
                doNoParamCallBack(complete);
            }, function(event:FaultEvent):void
            {
                log.info('查询性能指标列表失败：' + event.fault.faultString);
                error.call(null, event);
                doNoParamCallBack(complete);
            }, true, "hotspotKpiList");
            
            log.info('查询性能指标列表,moTypeId：' + paramMap['moTypeId']);
            
            remote.hotspotKpiList(paramMap);
            remote = null;
        }
		
        /**
         * 查询热点区域内网元类型的趋势图统计数据
         * @param paramMap {moTypeId:"101",kpiId:"1001"}
         * @return [{time: "02:00",value:"23.2"},{time:"03:00",value:"78.3"}.....]
         */
        public function getHotspotPerfGraphic(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
            {
                log.info('查询性能指标趋势图数据成功：' + result.length);
                success.call(null, result);
                result = null;
                doNoParamCallBack(complete);
            }, function(event:FaultEvent):void
            {
                log.info('查询性能指标趋势图数据失败：' + event.fault.faultString);
                error.call(null, event);
                doNoParamCallBack(complete);
            }, true, "getHotspotPerfGraphic");
            
            log.info('查询性能指标趋势图数据,moTypeId：' + paramMap['moTypeId'] + ' kpiId:' + paramMap['kpiId'] + ' startTime:' + paramMap['startTime'] + ' endTime:' + paramMap['endTime'] + ' hotspot_id:' + paramMap['hotspot_id']);
            
            remote.getHotspotPerfGraphic(paramMap);
            remote = null;
        }
		
		/**
		 * 查询具体热点区域内的网元
		 * @param paramMap {area_id:1}
		 * @return
		 */
		public function getHotSportNeGis(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info('查询具体热点区域内的网元成功：' + result.length);
				success.call(null, result, paramMap['area_id']);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				log.info('查询具体热点区域内的网元失败：' + event.fault.faultString);
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "getHotSportNeGis");
			
			log.info('查询具体热点区域内的网元,area_id：' + paramMap['area_id']);
			
			remote.getHotSportNeGis(paramMap);
			remote = null;
		}
        
		private function doNoParamCallBack(complete:Function):void
		{
			if (complete != null)
			{
				complete.call(null);
			}
		}
	}
}