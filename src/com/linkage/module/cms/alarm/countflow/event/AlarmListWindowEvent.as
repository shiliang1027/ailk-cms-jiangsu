package com.linkage.module.cms.alarm.countflow.event
{
	import flash.events.Event;
	
	public class AlarmListWindowEvent extends Event
	{
		public static const ALARMCHANGE:String = "alarmChange";
		public var param:Object;
		public function AlarmListWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}