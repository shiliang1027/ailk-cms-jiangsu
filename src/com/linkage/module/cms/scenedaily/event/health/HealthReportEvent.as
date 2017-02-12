package com.linkage.module.cms.scenedaily.event.health
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HealthReportEvent extends Event
	{
		public var param:Object = new Object();
		//加载数据
		public static const LOAD_HEALTHREPORT_DATA:String = "loadHealthReportData";

		public static const CHANGE_HEALTHREPORT_RENDERED:String = "CHANGE_HEALTHREPORT_RENDERED";


		//加载数据成功
		public static const LOAD_HEALTHREPORT_DATA_COMP:String = "loadHealthReportDataComp";

		public function HealthReportEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}