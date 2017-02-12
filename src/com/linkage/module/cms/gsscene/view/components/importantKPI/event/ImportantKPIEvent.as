package com.linkage.module.cms.gsscene.view.components.importantKPI.event
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ImportantKPIEvent extends Event
	{
		//加载重点KPI
		public static const LOAD_KPI_DATA:String = "LOAD_KPI_DATA";
		//展示重点KPI
		public static const SHOW_KPI_DATA:String = "SHOW_KPI_DATA";
		//轮循展示重点KPI
		public static const LOOP_KPI_DATA:String = "LOOP_KPI_DATA";
		//开始时间
		public var startTime:String;
		//结束时间
		public var endTime:String;

		public function ImportantKPIEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}