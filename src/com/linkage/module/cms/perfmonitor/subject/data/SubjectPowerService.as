package com.linkage.module.cms.perfmonitor.subject.data
{
	public interface SubjectPowerService
	{
		/**
		 * 停电基站统计
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return {title:"停电基站统计",
		 * name:["地市","停电基站数","停电基站比例","低电压基站数","低电压基站比例","一次下电基站数","一次下电基站比例"],
		 * column:["city","no_power","no_power_rate","low_power","low_power_rate","drop","drop_rate"],
		 * datalist:[{city:"全省", no_power:"10", no_power_rate:"2%", low_power:"10", low_power_rate:"2%", drop:"10", drop_rate:"2%"},
		 * {city:"南京", no_power:"10", no_power_rate:"2%", low_power:"10", low_power_rate:"2%", drop:"10", drop_rate:"2%"}]}
		 */
		function btsNoPowerStat(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 停电基站GIS撒点接口
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"} 
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","type":"1"}]
		 */
		function btsNoPowerGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 停电基站资源列表
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","type":"1"}] 具体结构待定
		 */
		function btsNoPowerList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 停电基站性能列表
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","perf_type_name":"掉话率","perf_value":"2%"]
		 */
		function btsNoPowerPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 蓄电池监控统计
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return {title:"蓄电池统计",
		 * name:["地市","低性能蓄电池","比例"],
		 * column:["city","low_power","rate"],
		 * datalist:[{city:"全省", low_power:"10", rate:"2%"},
		 * {city:"南京", low_power:"10", rate:"2%", }]}
		 */
		function powerCellStat(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 低性能蓄电池GIS撒点接口
		 * @param paramMap  （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172"}]
		 */
		function lowPowerGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 单个蓄电池网元的详细信息（蓄电池网元和普通网元有区别，所以单独列出）
		 * @param paramMap {mo_id:"1111"}
		 * @return 格式待定
		 */
		function powerCellDetail(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 蓄电池统计趋势图
		 * @param paramMap {startTime:"2011-12-09 08:00:00",stopTime:"2011-12-09 20:00",type:"6",city:"0100"}
		 * @return [{time:"2011-12-09 08:00",value:"34"},{time:"2011-12-09 09:00",value:"23"}]
		 */
		function getBatteryGraphic(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
	}
}