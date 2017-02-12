package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-24 上午10:43:08
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class RunQuaWindowEvent extends Event
	{
		public static const INIT:String = "init";
		public static const CLEAR:String = "clear";
		public static const DATACHANGE:String = "dataChange";
		public static const PAGECHANGE:String = "pageChange";
		public static const CUSTDATACHANGE:String = "custDataChange";
		public static const CUSTALARMSHOW:String = "custAlarmShow";
		public static const CUSTPROVSHOW:String = "custProv";
		public static const CUSTTRANSPROVSHOW:String = "custTransProv";
		public static const SHEETSHOW:String = "sheetShow";
		public static const PAGEGO:String = "pageGo";
		public static const CUSTSHOW:String = "custShow";
		public var param:Object;
		public function RunQuaWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}