package com.linkage.module.cms.groupclientNew.event
{
	import flash.events.*;
	
	public class GroupImageMapEvent extends Event
	{
		public var param:Object;
		
		public var paramArray:Object;
		
		
		public static const MAPPOINTSHOW:String = "mapPointShow";
		public static const MOINFOSHOW:String = "moInfoShow";
		
		public function GroupImageMapEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
		{
			super(param1, param2, param3);
			return;
		}// end function
		
	}
}
