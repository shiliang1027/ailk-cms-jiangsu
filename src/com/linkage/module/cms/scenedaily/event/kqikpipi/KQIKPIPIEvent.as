package com.linkage.module.cms.scenedaily.event.kqikpipi
{
	import flash.events.Event;

	public class KQIKPIPIEvent extends Event
	{
		//加载KQIKPIPI关联关系数据
		public static const LOAD_KQIKPIPI_DATA:String = "LOAD_KQIKPIPI_DATA";

		//处理KQIKPIPI关联关系数据
		public static const DEAL_KQIKPIPI_DATA:String = "DEAL_KQIKPIPI_DATA";

		//加载KQIKPIPI bad mo List 数据
		public static const LOAD_MO_LIST:String = "LOAD_MO_LIST";

		public static const SHOW_MO_LIST:String = "SHOW_MO_LIST";

		public var kpiId:String;
		public var moTypeId:String;

		public var showWin:Boolean;

		public function KQIKPIPIEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}

