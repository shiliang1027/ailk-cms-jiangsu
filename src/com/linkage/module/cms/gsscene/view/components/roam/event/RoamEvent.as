package com.linkage.module.cms.gsscene.view.components.roam.event
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
	public class RoamEvent extends Event
	{
		//加载漫游数据
		public static const LOAD_ROAM_DATA:String = "LOAD_ROAM_DATA";
		//展示漫游数据
		public static const SHOW_ROAM_DATA:String = "SHOW_ROAM_DATA";
		//定时器轮循展示漫游数据
		public static const LOOP_ROAM_DATA:String = "LOOP_ROAM_DATA";



		public function RoamEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}