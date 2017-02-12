package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-8 下午01:12:18
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class AlarmStatCompEvent extends Event
	{
		public static const DATAQUERY:String = "dataQuery";
		public static const DATACHANGE:String = "dataChange";
		public static const REFRESH:String = "refresh";
		public static const ALARMQUERY:String = "alarmQuery";
		public var param:Object;
		public function AlarmStatCompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}