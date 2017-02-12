package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 客户概况事件类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-24 上午09:09:39
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class CustWindowEvent extends Event
	{
		public static const INIT:String = "init";
		public static const CLEAR:String = "clear";
		public static const DATACHANGE:String = "dataChange";
		public static const PAGECHANGE:String = "pageChange";
		public static const CUSTDATACHANGE:String = "custDataChange";
		public static const CUSTALARMSHOW:String = "custAlarmShow";
		public static const CUSTSHOW:String = "custShow";
		public static const PAGEGO:String = "pageGo";
		public static const SHEETSHOW:String = "sheetShow";
		public static const SHEETDETAILSHOW:String = "sheetDataChangedetailShow";
		public static const SHEETDETAILWSENDSHOW:String = "sheetDetailSendShow";
		public static const SHEETDATACHANGE:String = "sheetDataChange";
		public var param:Object;
		public function CustWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}