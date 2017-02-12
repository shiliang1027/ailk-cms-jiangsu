package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-24 上午10:42:03
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ServWindowEvent extends Event
	{
		public static const INIT:String = "init";
		public static const CLEAR:String = "clear";
		public static const DATACHANGE:String = "dataChange";
		public static const PAGECHANGE:String = "pageChange";
		public static const CUSTDATACHANGE:String = "custDataChange";
		public static const CUSTALARMSHOW:String = "custAlarmShow";
		public static const CUSTPROVSHOW:String = "custProv";
		public static const CUSTTRANSPROVSHOW:String = "custTransProv";
		public static const PAGEGO:String = "pageGo";
		public static const CUSTSHOW:String = "custShow";
		public static const CUSTALARMONLYSHOW:String = "custAlarmOnlyShow";
		public static const CUSTALARMALLSHOW:String = "custAlarmAllShow";
		public var param:Object;
		public function ServWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}