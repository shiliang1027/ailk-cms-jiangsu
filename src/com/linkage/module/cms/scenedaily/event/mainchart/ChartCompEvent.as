package com.linkage.module.cms.scenedaily.event.mainchart
{
	import flash.events.Event;

	public class ChartCompEvent extends Event
	{
		public var param:Object={};
		public static const LOAD_START_DATA:String = "LOAD_START_DATA"; 
		public static const LOAD_LH_DATA:String = "LOAD_LH_DATA"; 

		public static const SHOW_DRGRADATIONRANKING_DATA:String = "SHOW_DRGRADATIONRANKING_DATA";
		public static const SHOW_DRGRADATIONRANKING_DATA_POPUP:String = "SHOW_DRGRADATIONRANKING_DATA_POPUP";

		public static const SHOW_INDEXTREND_DATA:String = "SHOW_INDEXTREND_DATA";
		public static const SHOW_INDEXTREND_DATA_POPUP:String = "SHOW_INDEXTREND_DATA_POPUP";

		public static const SHOW_LOWERLEVELDRILLINGCITY_DATA:String = "SHOW_LOWERLEVELDRILLINGCITY_DATA";
		public static const SHOW_TOPOLOWERLEVELDRILLING_DATA:String = "SHOW_TOPOLOWERLEVELDRILLING_DATA";
		public static const SHOW_KPIHISTORY_COLUMN_CHART:String = "SHOW_KPIHISTORY_COLUMN_CHART";
		public static const SHOW_KPIHISTORY_LINE_CHART:String = "SHOW_KPIHISTORY_LINE_CHART";
		public static const SHOW_CITYTOPODR_LINE_CHART:String = "SHOW_CITYTOPODR_LINE_CHART";
		public static const SHOW_CITYTOPODR_COLUMN_CHART:String = "SHOW_CITYTOPODR_COLUMN_CHART";
		public static const SHOW_CITYTOPODRTOPOLOWERLEVEL_COLUMN_CHART:String = "SHOW_CITYTOPODRTOPOLOWERLEVEL_COLUMN_CHART";
		public static const COMPARE_DATE:String = "COMPARE_DATE";
		public static const DELETE_COMPARE_DATE:String = "DELETE_COMPARE_DATE";

		public function ChartCompEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}

