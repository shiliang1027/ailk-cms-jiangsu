package com.linkage.module.cms.viewroam.event
{
	import flash.events.Event;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-11-03
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ViewRoamEvent extends Event
	{
		public var param:Object;
		public static const LOAD_DATA:String = "LOAD_DATA";
		public static const LOAD_DATA_WORKSTAT:String = "LOAD_DATA_WORKSTAT";
		public function ViewRoamEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}