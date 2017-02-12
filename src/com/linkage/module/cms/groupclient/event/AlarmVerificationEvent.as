package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;

	public class AlarmVerificationEvent extends Event
	{
		public static const CHECKBOX_ALL_SELECTED:String = "CHECKBOX_ALL_SELECTED";
		
		public static const ALARMVERIFICATIONVIEWMAXIMIZESCREEN:String = "alarmVerificationViewMaximizeScreen";
		
		public static const ALARMVERIFICATIONVIEWMINIMIZESCREEN:String = "alarmVerificationViewMinimizeScreen";
		
		public static const ALARMVERIFICATIONVIEWRESTORSCREEN:String = "alarmVerificationViewRestorScreen";
		
		public static const TOALARMVERIFICATIONVIEWRESTORSCREEN:String = "toAlarmVerificationViewRestorScreen";
		
		public var param:Object;
		public function AlarmVerificationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
		
}