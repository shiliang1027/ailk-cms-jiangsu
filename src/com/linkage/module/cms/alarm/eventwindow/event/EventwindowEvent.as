package com.linkage.module.cms.alarm.eventwindow.event
{
	import flash.events.Event;

	/**
	 *
	 * 指标定制事件类
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class EventwindowEvent extends Event
	{
		/**
		 * 事件：显示视图 
		 */
		public static const VIEWSHOW:String="EVENTS_VIEW_SHOW";
		
		/**
		 * 事件：显示备注视图
		 */
		public static const REMARKVIEWSHOW:String="REMARK_VIEW_SHOW";

		public function EventwindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}