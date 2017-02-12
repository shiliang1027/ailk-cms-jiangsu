package com.linkage.module.cms.groupclientNew.event
{
	import flash.events.Event;
	
	public class NavTreeEvent extends Event
	{
		public static const DATACHANGE:String = "dataChange";
		public var param:Object;
		public function NavTreeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}