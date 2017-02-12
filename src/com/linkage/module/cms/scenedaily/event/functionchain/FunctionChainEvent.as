package com.linkage.module.cms.scenedaily.event.functionchain
{
	import flash.events.Event;

	public class FunctionChainEvent extends Event
	{
		public var param:Object={};
		public static const SHOW_IMG_URL:String = "SHOW_IMG_URL";
		
		public function FunctionChainEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}