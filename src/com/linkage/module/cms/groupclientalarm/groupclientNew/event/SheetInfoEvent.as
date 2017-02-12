package com.linkage.module.cms.groupclientNew.event
{
	import flash.events.Event;

	public class SheetInfoEvent extends Event
	{
		public static const SHOWSHEETINFO:String = "ShowSheetInfo";
		public static const DATAQUERY:String = "dataQuery";
		public static const SHEETDETAILSHOW:String = "sheetDetailShow";
		public var param:Object;
		public function SheetInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}