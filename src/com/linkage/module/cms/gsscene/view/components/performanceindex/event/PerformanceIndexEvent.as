package com.linkage.module.cms.gsscene.view.components.performanceindex.event
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import flash.events.Event;

	public class PerformanceIndexEvent extends Event
	{
		public static const LOAD_PERFORMANCAINDEX_DATA:String = "LOAD_PERFORMANCAINDEX_DATA";
		public static const CMS_SCENE_PERFORMANCEINDEX_SHOWORHIDDENDATAGRID:String = "CMS_SCENE_PERFORMANCEINDEX_SHOWORHIDDENDATAGRID";


		public function PerformanceIndexEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

	}
}