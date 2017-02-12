package com.linkage.module.cms.groupclientNew.event
{
	import flash.events.Event;

	public class ComplaintInfoEvent extends Event
	{
		public static const SHOWCOMPLAINTINFO:String = "showComplaintInfo";
		public static const DATAQUERY:String = "dataQuery";
		public static const COMPLAINTDETAILQUERY:String = "complaintDetailQuery";
		public static const SHOWCOMPLAINTDETAIL:String = "showComplaintDetail";
		public var param:Object;
		
		public function ComplaintInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
}	
}