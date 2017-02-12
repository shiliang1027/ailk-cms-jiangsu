package com.linkage.module.cms.scene.event.sportsvenuesview
{
	import flash.events.Event;

	public class SportsVenuesEvent extends Event
	{
		public var param:Object=null;

		//加载数据
		public static const LOAD_DATA:String="loaddata";

		//创建表格行
		public static const CREAT_COLUMN:String="creatSportColumn";

		public function SportsVenuesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}