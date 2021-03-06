package com.linkage.module.cms.groupclientNew.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-25 下午09:58:43
	 * @category com.linkage.module.cms.groupclientNew.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class MonitorAlarmListWindowEvent extends Event
	{
		public static const CUSTSHOW:String = "custShow";
		public static const DATACHANGE:String = "dataChange";
		public static const ALARMINFOSHOW:String = "alarmInfoShow";
		public var param:Object;
		public function MonitorAlarmListWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}