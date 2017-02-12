package com.linkage.module.cms.general.regional.important.venue.module.dao.data
{

	/**
	 *场景监控Data
	 * @author mengqiang
	 *
	 */
	public interface VenueData
	{
		/**
		 * 获取场馆信息
		 * @param paramMap
		 *            {"monitor_id":"场景ID"}
		 * @return [{“venue_id”:”场馆ID”,” venue_name”:”场馆名称”,”alarm_level”:”告警级别”,”img_url”:”场馆图片url”}]
		 */
		function getVenueInfo(param:Object, success:Function):void;
		/**
		 * 获取场馆性能信息
		 *
		 * @param paramMap
		 *            {“monitor_id”:”场景ID” }
		 * @return
		 *         [{“title”:”表格标题”,“column”:[“index”,”venue_name”,……],”name”:[“序号”,”场馆名称”,……],” datalist”:[{“index”:”1”,”venue_name”:”1号场馆”,}]}]
		 */
		function getVenuePerfInfo(param:Object, success:Function, error:Function):void;
		/**
		 * 获取告警信息
		 *
		 * @param paramMap
		 *            {“monitor_id”:”场景ID” }
		 * @return ["1.1号场馆发生性能告警",……]
		 */
		function getVenueAlarmInfo(param:Object, success:Function):void;
		/**
		 * 获取赛事告警信息
		 *
		 * @param paramMap
		 *            {“monitor_id”:”场景ID” ,”start_time”:”开始时间”,”end_time”:”结束时间”}
		 * @return { “column”:[”venue_name”],”name”:[”场馆名称”,……],” datalist”:[{”venue_name”:”1号场馆”}]}
		 */
		function getVenMaAla(param:Object, success:Function):void;
		/**
		 * 获取场馆性能信息（列表模式）
		 *
		 * @param paramMap
		 *            {“monitor_id”:”场景ID” ,”start_time”:”开始时间”,”end_time”:”结束时间”}
		 * @return [{“title”:”2G”,“column”:[”tel_num”,……],”name”:[”话务量”,……],”datalist”:[{”tel_num”:”1000”,},……]},……]
		 */
		function getVenPerfList(param:Object, success:Function):void;
	}
}