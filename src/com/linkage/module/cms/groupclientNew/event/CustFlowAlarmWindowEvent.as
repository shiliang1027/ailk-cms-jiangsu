package com.linkage.module.cms.groupclientNew.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-2 下午01:08:44
	 * @category com.linkage.module.cms.groupclientNew.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class CustFlowAlarmWindowEvent extends Event
	{
		public static const LOADALARM:String = "loadAlarm";
		public static const CUSTINFOSHOW:String = "custInfoShow";
		public var param:Object;
		public function CustFlowAlarmWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}