package com.linkage.module.cms.general.monitor.datamanager
{
	/**
	 * 获取数据的接口
	 * @author czm
	 *
	 */
	public interface LevelThreeService
	{
		function setEndPoint(context:String):void;
		
		/**
		 * 查询指定属地的信息
		 * @param 包含健值为city_id
		 * @return
		 */
		function getCitySite(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取区县内网元信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景 ID","type":"类型，1：实时；2：历史 ，历史数据需要传时间","time"
		 *            :"时间","mo_type_id":"网元类型，可以为空","perf_type_id":"指标ID,可以为空"}
		 * @return { "bts": [{"mo_id":" 网元id","mo_name":"网元名称"," longitdue":"经度","
		 *         latitude":"纬度","
		 *         mo_type":"网元类型","vip_type":"vip类型","alarm_level":"最高告警级别","
		 *         quitreason":"退服专业","mo_status":"网元状态","work_stat":"工程状态","
		 *         subject":"退服原因"},……], "nodeb": [{"mo_id":"
		 *         网元id","mo_name":"网元名称"," longitude":"经度"," latitude":"纬度","":"
		 *         mo_type":"网元类型","vip_type":"vip类型","alarm_level":"最高告警级别","
		 *         quitreason":"退服专业","mo_status":"网元状态","work_stat":"工程状态","
		 *         subject":"退服原因"},……], "cell":[ {"mo_id":"
		 *         网元id","mo_name":"网元名称"," longitude":"经度"," latitude":"纬度","":"
		 *         mo_type
		 *         ":"网元类型","alarm_level":"最高告警级别","mo_status":"网元状态","work_stat
		 *         ":"工程状态
		 *         ","is_worst":"1:最差小区；0：不是","is_bad":"1:劣化小区；0：不是"},……], "ucell
		 *         ": [ {"mo_id":" 网元id","mo_name":"网元名称"," longitude":"经度","
		 *         latitude":"纬度","":" mo_type":"网元类型","alarm_level"
		 *         :"最高告警级别","mo_status":"网元状态","work_stat":"工程状态"
		 *         ,"is_worst":"1:最差小区；0：不是","is_bad":"1:劣化小区；0：不是"},……],
		 *         "wlan_hot":[{"mo_id":"网元ID","mo_name":"网元名称", " longitdue":"经度","
		 *         latitude":"纬度", " mo_type":"网元类型","alarm_level":"
		 *         最高告警级别","mo_status":"网元状态"},……], "machine_room":[
		 *         {"mo_id":"机楼 ID","mo_name":"机楼名称", " longitdue":"经度","
		 *         latitude":"纬度", " mo_type":"机楼类型，一个机楼的机楼类型可能会有多种，多种以逗号分隔
		 *         ","alarm_level
		 *         ":"最高告警级别","mo_status":"网元状态"},……]， "venue"：[{"mo_id":"场馆
		 *         ID","mo_name":"场馆名称", " longitdue":"经度","
		 *         latitude":"纬度","alarm_level
		 *         ":"最高告警级别","mo_status":"网元状态"},……], "oil":[{ "mo_id":"油机
		 *         ID","mo_name":"油机名称", " longitdue":"经度"," latitude":"纬度" }],
		 *         "communicationcar":[ { "mo_id":"通信车 ID","mo_name":"通信车名称", "
		 *         longitdue":"经度"," latitude":"纬度" }], "emergency_use":[{
		 *         "communicationcar
		 *         ":{"total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述
		 *         "},"person":{
		 *         "total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述"}
		 *         ,"oilmachine":{
		 *         "total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述"}," fiber":{
		 *         "total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述"},"
		 *         oilplants":{
		 *         "total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述"}}]}
		 */
		function getResInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定属地的退服网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		function getQuitBtsStat(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定属地的劣化小区信息
		 * @param 包含健值为city_id
		 * @return
		 */
		function getBadCellStat(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定属地的劣化小区信息
		 * @param 包含健值为mo_id\mo_type\mo_name
		 * @return
		 */
		function getSingleBtsInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定网元的管线信息
		 * @param 包含健值为mo_id
		 * @return
		 */
		function getTransferInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取场景内告警信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景 ID"}
		 * @return 
		 *         {"bts":[{"mo_id":"网元id","alarm_level":"最高告警级别","quitreason":"退服专业"
		 *         ,"mo_status":"网元状态"," subject":"退服原因"},……], "nodeb": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","
		 *         quitreason":"退服专业","mo_status":"网元状态"," subject":"退服原因"},……],
		 *         "bad_cell": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "bad_ucell": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "worst_cell": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "worst_ucell": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "wlan_hot":[
		 *         {"mo_id":"网元ID","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "machine_room":[
		 *         {"mo_id":"机楼 ID","alarm_level":"最高告警级别","mo_status":"网元状态"},……]，
		 *         "venue"
		 *         ：[{"mo_id":"场馆 ID","alarm_level":"最高告警级别","mo_status":"网元状态"
		 *         },……]}
		 */
		function getResAlarmInfo(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取覆盖范围数据
		 * 
		 * @param paramMap
		 *            {"city_id":"属地ID","mo_type_id":"网元类型"}
		 * @return 如果为MSC/BSC/RNC：{"网元名称":["4323(GIS对象ID)","4325(GIS对象ID)",......
		 *         ],......};如果为BTS：{"bts":["4323(GIS对象ID)","4325(GIS对象ID)",......
		 *         ]};如果为NODEB：{"nodeb":["4323(GIS对象ID)","4325(GIS对象ID)",...... ]}
		 */
		function getCoverData(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取性能指标渲染数据
		 * 
		 * @param paramMap
		 *            {"city_id":"属地ID","perf_type_id":"性能指标，1：用户数；2：话务量；3：接通率"，4：无线利用率
		 *            ，5：拥塞率}
		 * @return [{"mo_id":"网元id","perf_value":"性能值","color":"颜色"},......]
		 */
		function getDrawData(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询天气信息
		 * 
		 * @param cityId
		 * @return
		 */
		function getWeatherInfo(cityId:String,success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询所有故障网元
		 * 
		 * @param cityId
		 * @return
		 */
		function getAllQuitBts(success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定属地的网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		function getResInfoBts(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定属地的网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		function getResInfoCell(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定属地的网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		function getResInfoWlan(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定属地的网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		function getResInfoRoom(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定属地的管线信息
		 * @param 包含健值为city_id
		 * @return
		 */
		function getCityLinesInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询基站的用户数性能信息
		 * @param paramMap 包括参数mo_id
		 * @return
		 */
		function getBtsUserPerf(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询覆盖范围信息
		 * @param paramMap
		 * @return
		 */
		function queryCoverAreaByMo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 根据光路信息查询基站信息
		 * @param paramMap
		 * @return
		 */
		function getDevByRoute(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询基站的用户数性能数据
		 * @param moIds
		 * @return
		 */
		function getUserPerfByBts(moIds:Array, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 按类型统计基站
		 * @param paramMap
		 * @return
		 */
		function getBtsTypeStat(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询光路的告警信息
		 * @param circuitName
		 * @return
		 */
		function getOpticAlarmInfo(circuitName:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询概况信息
		 */
		function queryGeneralInfos(param:Object, success:Function, complete:Function = null, error:Function = null):void;
	}
}