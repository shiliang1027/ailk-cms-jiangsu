package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;

	public class AlarmSheetNoticeEvent extends Event
	{
		public static const QUERYPAGECUST:String = "queryPageCust";
		
		public static const DELETESHEETINFO:String = "deleteSheetInfo";
		
		
		public static const ALARMDIALSHEETNOTICEVIEWNEWMAXIMIZESCREEN:String = "alarmDialSheetNoticeViewNewMaximizeScreen";
		
		public static const ALARMDIALSHEETNOTICEVIEWNEWMINIMIZESCREEN:String = "alarmDialSheetNoticeViewNewMinimizeScreen";
		
		public static const ALARMDIALSHEETNOTICEVIEWNEWRESTORSCREEN:String = "alarmDialSheetNoticeViewNewRestorScreen";
		
		public static const TOALARMDIALSHEETNOTICEVIEWNEWRESTORSCREEN:String = "toalarmDialSheetNoticeViewNewRestorScreen";
		
		public var param:Object;
		public function AlarmSheetNoticeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}