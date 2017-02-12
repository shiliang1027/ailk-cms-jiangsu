package com.linkage.module.cms.general.regional.important.scene.module.dao
{

	/**
	 *场馆监控DAO
	 * @author mengqiang
	 *
	 */
	public interface MonitorDAO
	{
		/**
		 * 获取场馆列表信息
		 * @param venueId 场馆Id
		 * @return List<Map> 其中每个Map的格式：{venue_id："场馆Id",venue_name:"场馆名称",venue_image:"场馆图片",race_name:"赛事名称",race_start:"赛事时间"}
		 */
		function getVenueListInfo(monitorId:Object, success:Function):void;
		/**
		 * 获取指定场馆的统计指标
		 * @param venueId 场馆Id
		 * @param segmentType 指标类型（1代表性能指标，2代表业务指标）
		 * @return 返回的List中每个Map的格式：{monitor_id："....",mo_type_id:"....",show_name:"....",perf_type_id:"....",column_name:"....."}
		 */
		function getVenueSegmentList(venueId:String, segmentType:int, success:Function):void;
		/**
		 * 获取指定场馆指标统计数据
		 * @param venueId 场馆Id
		 * @param segmentType 指标类型（1代表性能指标，2代表业务指标）
		 * @param queryTime 查询时间
		 * @return 返回 Map<String,Map> 数据结构，其中返回Map中的key是mo_type_id+"_"+perf_type_id，value是数据List。
		 * 数据List中map的key是表示时间的字符串，value是指标在这个时间点的值{perf_time:"08:15",perf_value:"93"}
		 */
		function getSegmentData(venueId:String, segmentType:int, queryTime:String, success:Function):void;
		/**
		 * 获取场馆现场图片信息
		 * @param venueId 场馆Id
		 * @return List<Map> 其中每个Map的格式：{img_id："id",img_name:"图片名称",img_url:"图片url",img_type:"picture 或者 movie"}
		 */
		function getVenuePicture(venueId:String, success:Function):void;
		/**
		 * 获取场馆概述信息（资源统计，业务指标统计，性能指标统计）
		 * @param venueId 场馆Id
		 * @return 返回Map
		 * 具体格式： {资源信息：[{MSC/MSS："1",BSC/RNC:"23",2G小区数:"56",TD小区数:"33",应急通信车数:"24",应急通信车小区数:"80",WLAN AP数:"92"}]
		 * 			业务量：[{统计时间："2011-07-03 22:00",业务名称:"话务量",统计值:"93"},{统计时间："2011-07-03 22:00",业务名称:"掉话率",统计值:"0.01"}]}
		 * 			性能信息：[{统计时间："2011-07-03 22:00",业务名称:"TCH信道拥塞率",统计值:"12"}，{统计时间："2011-07-03 22:00",业务名称:"寻呼成功率",统计值:"93"}]
		 */
		function getVenueOutlineInfo(venueId:String, queryTime:String, success:Function):void;
		/**
		 * 获取场馆的告警过滤器
		 * @param venueId 场馆Id
		 * @return 过滤器string
		 */
		function getVenueAlarmFilter(venueId:String, success:Function):void;
		/**
		 * 场馆监控对外接口
		 * 获取场馆信息
		 * @param venueId 场馆Id
		 * @return 返回Map格式： {venue_name:"场馆名称"，city_name:"属地名称",location:"场馆位置"，seating："场馆席位"，curr_race:"当前赛事"}
		 */
		function getVenueInfo(venueId:String, success:Function):void;
		/**
		 * 获取场馆的保障方案信息
		 * @param venueId 场馆Id
		 * @return List<Map>中的map格式：{ensure_doc_name："保障方案名称"，ensure_doc_url："保障方案URL",ensure_desc:"保障方案描述"}
		 */
		function getVenueEnsureDoc(venueId:String, success:Function):void;
		/**
		 * 场馆监控对外接口
		 * 获取场馆赛事信息
		 * @param venueId 场馆Id
		 * @return List<Map>,其中每个Map的格式： {{race_name:"赛事名称"，race_start:"2011-07-04 08:30:00",race_end:"2011-07-04 10:30:00"}}
		 */
		function getVenueRaceInfo(venueId:String, success:Function):void;
		/**
		 * 获取场馆的所有网元信息
		 * @param venueId 场馆Id
		 * @return List<Map> 其中每个Map的格式：{mo_id:"网元Id"，mo_name:"网元名称"，mo_type_id："网元类型Id",x:"23.6",y:"67.2"}
		 */
		function getAllVenueNe(venueId:String, success:Function):void;
		/**
		 * 查询单个网元各个指标的统计数据
		 * @param neId 网元Id
		 * @param venueId 场馆Id
		 * @return List<Map> 每个map的格式： {show_name:"2G话务量"，gather_time:"2011-07-01 08:00:00",perf_value:"187.2"}
		 */
		function getNeSegmentData(neId:String, venueId:String, queryTime:String, success:Function):void;
		/**
		 * 获取场馆内指定网元的统计指标
		 * @param neId 网元Id
		 * @param venueId 场馆Id
		 * @return 返回List的具体格式： [{show_name:"GMS话务量"}，{show_name:"TD语音话务量"},{show_name:"寻呼成功率"}，{show_name:"小区拥塞率"}]
		 */
		function getNeSegment(neId:String, venueId:String, success:Function):void;
	}
}