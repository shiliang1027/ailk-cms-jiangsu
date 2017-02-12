package com.linkage.module.cms.perfmonitor.subject.data
{
	public interface SubjectCellService
	{
		/**
		 * 最差小区列表，供页面统计列表使用
		 * 
		 * @return [title:"最差小区", name:["地市","最差小区数","最差小区比例","高掉话","高拥塞"],
		 *         column:["city","worst_cell","worst_rate","high_drop","high_block"],
		 *         datalist:[{city:"全省", worst_cell:"10", worst_rate:"2%",
		 *         high_drop:"2", high_block:"2"}, {city:"南京", worst_cell:"10",
		 *         worst_rate:"2%", high_drop:"2", high_block:"2"}]}]
		 */
		function worstCellStatList(success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 最差小区GIS撒点接口
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","wrst_type":"1","vip_type":"3"}]
		 */
		function worstCellGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 最差小区性能统计列表
		 * @param paramMap（可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return
		 */
		function worstPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 劣化小区列表，供统计页面使用
		 * @return {title:"劣化小区",
		 * name:["地市","劣化小区数","劣化小区比例","高掉话","高拥塞"],
		 * column:["city","bad_cell","bad_rate","high_drop","high_block"],
		 * datalist:[{city:"全省", bad_cell:"10", bad_rate:"2%", high_drop:"2", high_block:"2"},
		 * {city:"南京", bad_cell:"10", bad_rate:"2%", high_drop:"2", high_block:"2"}]}
		 */
		function badCellStatList(success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 劣化小区GIS撒点接口
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return
		 */
		function badCellGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 劣化小区性能数据接口
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","perf_type_name":"掉话率","perf_value":"2%"}]
		 */
		function badPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 零业务量小区列表，供统计页面使用
		 * @return {title:"零业务量小区",
		 * name:["地市","零业务小区数","零业务小区比例"],
		 * column:["city","zero_cell"," zero_rate"],
		 * datalist:[{city:"全省", zero_cell:"10", zero_rate:"2%"},
		 * {city:"南京", zero_cell:"10", zero_rate:"2%"}]}
		 * 
		 */
		function zeroCellStatList(success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 零业务量小区Gis撒点接口
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","wrst_type":"1","vip_type":"3"}]
		 */
		function zeroCellGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 零业务量小区性能数据列表接口
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","perf_type_name":"掉话率","perf_value":"2%"]
		 */
		function zeroPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 低价值小区列表，供统计页面使用
		 * @return {title:"低价值小区",
		 * name:["地市","低价值小区数","低价值小区比例"],
		 * column:["city","low_cell"," low_rate","high_drop","high_block"],
		 * datalist:[{city:"全省", low_cell:"10", low_rate:"2%"},
		 * {city:"南京", low_cell:"10", low_rate:"2%"}]}
		 */
		function lowCellStatList(success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 低价值小区GIS撒点数据接口
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","wrst_type":"1","vip_type":"3"}]
		 */
		function lowCellGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 低价值小区性能数据列表接口
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","perf_type_name":"掉话率","perf_value":"2%"]
		 */
		function lowPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 高无线利用率小区统计
		 * @return{title:"高无线利用率小区",
		 * name:["地市","高无线利用率小区数","高无线利用率小区比例"],
		 * column:["city","highusage_cell"," highusate_rate"],
		 * datalist:[{city:"全省", highusage_cell:"10", highusage_rate:"2%"},
		 * {city:"南京", highusage_cell:"10", highusage_rate:"2%"}]}
		 */
		function highUsageRateCellStat(success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 高无线利用率小区GIS信息
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return  [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","wrst_type":"1","vip_type":"3"}]
		 */
		function highUsageRateCellGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 高无线利用率小区性能数据
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","perf_type_name":"掉话率","perf_value":"2%"]
		 */
		function highUsageRateCellPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取小区统计趋势图
		 * @param paramMap {startTime:"2011-12-09 08:00:00",stopTime:"2011-12-09 20:00",type:"1||2||3||4||5",city:"0100"}
		 * @return 返回List，其中只有一个Map，此Map中存储两个List<Map>结构，对应2G和3G的趋势图
		 * [
		 * {2gList:[{time:"2011-12-09 08:00",value:"34"},{time:"2011-12-09 09:00",value:"23"}]}
		 * {3gList:[{time:"2011-12-09 08:00",value:"34"},{{time:"2011-12-09 09:00",value:"23"}}]}
		 * ]
		 */
		function getCellCountGraphics(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
	}
}