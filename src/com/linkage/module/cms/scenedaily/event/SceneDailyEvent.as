package com.linkage.module.cms.scenedaily.event
{
	import flash.events.Event;

	public class SceneDailyEvent extends Event
	{
		public static const CHANGE_VIEW_TYPE:String = 'CHANGE_VIEW_TYPE';

		public static const COMPONENTS_LOAD_DATA:String = 'COMPONENTS_LOAD_DATA';

		public static const LOADVIEW_KPIDATA:String = "LOADVIEW_KPIDATA"; //加载指标数据

		public static const CHANGE_MAP:String = "CHANGE_MAP"; //下一级钻取 切换地图

		public static const GETVIEW_KPIDATA:String = "GETVIEW_KPIDATA"; //获取指标数据

		//重点性能指标对外派发事件
		public static const LOAD_IMP_PRO_KPI_EVENT:String = "LOAD_IMP_PRO_KPI_EVENT";

		public static const CMS_SCENEDAILY_COMMON_KPICHANGE:String = "CMS_SCENEDAILY_COMMON_KPICHANGE"; //kpi指标变换事件

		public static const SHOW_MO_COVER_AREA:String = "SHOW_MO_COVER_AREA"; //网元影响范围

		public static const MINI_CLEAR_KPIINFOHANDLER:String = "MINI_CLEAR_KPIINFOHANDLER"; //渲染所有的时候，同步标题栏的kpi信息

		public static const LOAD_SHEET_FLOW:String = "LOAD_SHEET_FLOW"; //加载工单信息
		public static const DEAL_SHEET_FLOW:String = "DEAL_SHEET_FLOW"; //处理工单信息

		//传递参数使用的变量。
		public var param:Object = {};
		public var kpiId:String;
		public var moTypeId:int;

		public function SceneDailyEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}

