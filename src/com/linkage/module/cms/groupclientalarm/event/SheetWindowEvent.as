package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;

	public class SheetWindowEvent extends Event
	{
		public static const INIT:String = "init";
		public static const CLEAR:String = "clear";
		public static const DATACHANGE:String = "dataChange";
		public static const PAGECHANGE:String = "pageChange";
		public static const PAGEGO:String = "pageGo";
		public static const SHEETSHOW:String = "sheetShow";
		public static const SHEETDETAILSHOW:String = "sheetdetailShow";
		public static const SHEETDETAILSHOWDATA:String = "sheetdetailShowData";
		public static const SHEETDETAILWSENDSHOW:String = "sheetDetailSendShow";
		public static const SHEETDETAILSHOWSENDDATA:String = "sheetDetailSendData";
		public static const SHEETDATACHANGE:String = "sheetDataChange";
		public static const MGNSEND:String = "mgnsend";
		
		public var param:Object;
		public function SheetWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}