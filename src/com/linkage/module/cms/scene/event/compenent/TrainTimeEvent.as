package com.linkage.module.cms.scene.event.compenent
{
	/**
	 * 
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	import flash.events.Event;
	
	public class TrainTimeEvent extends Event
	{
		public static const LOAD_TRAINTIME_DATA:String="LOAD_TRAINTIME_DATA";
		
		public function TrainTimeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}