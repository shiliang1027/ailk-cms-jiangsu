package com.linkage.module.cms.scene.event
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-11-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class NeRoomEvent extends Event
	{
		//加载漫游数据
		public static const LOAD_NEROOM_DATA:String="LOAD_NEROOM_DATA";
		//展示漫游数据
		public static const LOAD_NEROOM_DATA_COMP:String="LOAD_NEROOM_DATA_COMP";

		public var data:Object=new Object();

		public function NeRoomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}