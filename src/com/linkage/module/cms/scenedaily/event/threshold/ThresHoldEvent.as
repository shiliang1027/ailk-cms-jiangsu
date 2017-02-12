package com.linkage.module.cms.scenedaily.event.threshold
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ThresHoldEvent extends Event
	{
		public var param:Object = new Object();

		//加载地市
		public static const LOAD_THRESHOLD_CITY:String = "loadThresHoldCity";

		//加载网元类型
		public static const LOAD_THRESHOLD_MOTYPE:String = "loadThresHoldMoType";

		//加载网元类型完成
		public static const LOAD_THRESHOLD_MOTYPE_COMP:String = "loadThresHoldMoTypeComp";

		//增加阈值页面
		public static const ADD_THRESHOLD_PAG:String = "addThresHoldPag";

		//删除阈值页面
		public static const DEL_THRESHOLD_PAG:String = "delThresHoldPag";

		//获取指标名称
		public static const LOAD_KPI_NAMES:String = "loadThresHoldKpiNameTT";

		//获取指标名称完成
		public static const LOAD_KPI_NAMES_COMP:String = "loadThresHoldKpiNamesComp";

		//获取阈值
		public static const LOAD_THRESHOLD_VALUES:String = "loadThresHoldValues";

		//获取阈值
		public static const LOAD_THRESHOLD_VALUES_COMP:String = "loadThresHoldValuesComp";

		//保存阈值
		public static const SAVE_THRESHOLD_VALUES:String = "saveThresHoldValues";

		//保存阈值完成
		public static const SAVE_THRESHOLD_VALUES_Comp:String = "saveThresHoldValuesComp";

		//导入
		public static const IMPORT_THRESHOLD_DATAS:String = "importThresHoldDatas";

		//导出
		public static const EXPORT_THRESHOLD_DATAS:String = "exportThresHoldDatas";

		public function ThresHoldEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}