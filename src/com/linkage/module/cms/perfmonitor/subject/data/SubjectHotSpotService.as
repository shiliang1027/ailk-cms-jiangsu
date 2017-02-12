package com.linkage.module.cms.perfmonitor.subject.data
{
	public interface SubjectHotSpotService
	{
		/**
		 * 按类型返回热点资列表
		 * @param paramMap {hotspot_type:"高校、党政军、铁路、车站、机场等"}
		 * @return [{"hotspot_id":"1","hotspot_name":"test","hotspot_type":"1","city_id":"0001","county_id":"000101"}]
		 */
		function hotspotList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 热点区域网元GIS洒点接口
		 * @param paramMap {hotspot_id:"test_id"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","mo_type_id":"101"}]
		 */
		function hotspotCellGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 热点区域概况统计信息
		 * @param paramMap {hotspot_id:"test_id"}
		 * @return 格式待定
		 */
		function hotspotGeneralStat(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 热点区域网元资源信息列表
		 * @param paramMap {hotspot_id:"test_id"}
		 * @return [{"mo_id":"1","mo_name":"test","mo_type_id":"101"}]具体格式待定
		 */
		function hotspotCellInfoList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 热点区域网元性能数据列表
		 * @param paramMap {hotspot_id:"test_id"}
		 * @return [{"mo_id":"1","mo_name":"test","perf_type_name":"掉话率","perf_value":"2%"]
		 */
		function hotspotPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
        
        /** 查询热点内网元类型的性能KPI指标
         * @param paramMap {moTypeId:101}
         * @return [{label:"小区用户数",value:"1001"},{label:"掉话率",value:"1002"}......]
         */
        function hotspotKpiList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
      
        /**
         * 查询热点区域内网元类型的趋势图统计数据
         * @param paramMap {moTypeId:"101",kpiId:"1001"}
         * @return [{time: "02:00",value:"23.2"},{time:"03:00",value:"78.3"}.....]
         */
        function getHotspotPerfGraphic(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询具体热点区域内的网元
		 * @param paramMap {area_id:1}
		 * @return
		 */
		function getHotSportNeGis(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
	}
}