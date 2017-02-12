package com.linkage.module.cms.roamtopic.event
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-12-16
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RoamTopicEvent extends Event
	{
		public var param:Object;
		public static const ROAMTOPIC_INIT:String = "ROAMTOPIC_INIT";
		public static const ROAMTOPIC_CONFIG_INIT:String = "ROAMTOPIC_CONFIG_INIT";
		public static const ROAMTOPIC_CONFIG_SAVE:String = "ROAMTOPIC_CONFIG_SAVE";
		public function RoamTopicEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}