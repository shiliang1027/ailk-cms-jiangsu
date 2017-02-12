package com.linkage.module.cms.threeWebPerfChart.event
{
	import flash.events.Event;
	
	public class KpiChartEvent extends Event
	{
		
		private var _param:Object;
		
		/**
		 * 获取指标数据
		 * */
		public static const CMS_KPICHART_QUERYCHARTS:String = "CMS_KPICHART_QUERYCHARTS";
		
		public static const CMS_KPICHART_INITCHARTS:String = "CMS_KPICHART_INITCHARTS";
		
		public static const CMS_KPICHART_MUTYPE_QUERYCHARTS:String = "CMS_KPICHART_MUTYPE_QUERYCHARTS";
		
		public static const CMS_KPICHART_MUTYPE_INITCHARTS:String = "CMS_KPICHART_MUTYPE_INITCHARTS";
		
		public static const CMS_KPICHART_LEFT_TREE:String = "CMS_KPICHART_LEFT_TREE";
		
		public static const CMS_KPICHART_LEFT_TREE_DEFAULT_SELECTED:String = "CMS_KPICHART_LEFT_TREE_DEFAULT_SELECTED";
		
		public static const CMS_KPICHART_LINE_REFALSH:String = "CMS_KPICHART_LINE_REFALSH";
		
		public function KpiChartEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public function get param():Object
		{
			return _param;
		}

		public function set param(value:Object):void
		{
			_param = value;
		}

	}
}