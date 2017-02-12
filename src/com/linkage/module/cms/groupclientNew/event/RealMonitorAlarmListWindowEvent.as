package com.linkage.module.cms.groupclientNew.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-1 下午05:36:49
	 * @category com.linkage.module.cms.groupclientNew.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class RealMonitorAlarmListWindowEvent extends Event
	{
		public static const DATACHANGE:String = "dataChange";
		public static const DATAQUERY:String = "dataQuery";
		public static const ALARMFILTER:String = "alarmFilter";
		public static const CUSTINFOSHOW:String = "custInfoShow";
		public var param:Object;
		public function RealMonitorAlarmListWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}