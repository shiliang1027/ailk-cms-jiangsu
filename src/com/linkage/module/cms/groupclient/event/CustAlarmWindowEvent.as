package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-25 下午08:55:43
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class CustAlarmWindowEvent extends Event
	{
		public static const DATACHANGE:String = "dataChange";
		public static const CUSTSHOW:String = "custShow";
		public var param:Object;
		public function CustAlarmWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}