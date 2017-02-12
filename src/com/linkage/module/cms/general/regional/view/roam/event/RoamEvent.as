package com.linkage.module.cms.general.regional.view.roam.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-7-2 下午09:24:35
	 * @category com.linkage.module.cms.general.regional.view.roam.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class RoamEvent extends Event
	{
		public static const INIT:String = "init";
		public static const DATA_LOAD:String="data_load";
		public static const DATA_QUERY:String = "data_query";
		public static const ROAM_TAB_CHANGE:String = "roam_tab_change";
		public static const ROAM_TYPE_CHANGE:String = "roam_type_change";
		public static const ROAM_PAGE_CHANGE:String = "roam_page_change";
		
		public static const ROAM_LEGEND_QUERY_COMPLETE:String = "roam_legend_query_complete";
		public static const ROAM_QUERY_NOPAGE_COMPLETE:String = "roam_query_nopage_complete";
		public static const ROAM_DATALOAD_COMPLETE:String = "roam_dataload_complete";
		public static const ROAM_STAT_QUERY_COMPLETE:String = "roam_stat_query_complete";
		public var attributes:Object;
		public function RoamEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}