package com.linkage.module.cms.groupclientNew.event
{
	import flash.events.Event;
	
	/**
	 * SLA组件事件类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-8 上午10:20:28
	 * @category com.linkage.module.cms.groupclientNew.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class SLACompEvent extends Event
	{
		public static const DATACHANGE:String = "dataChange";
		public static const DATAQUERY:String = "dataQuery";
		public static const ALARMQUERY:String = "alarmQuery";
		public static const REFRESH:String = "refresh";
		public var param:Object;
		public function SLACompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}