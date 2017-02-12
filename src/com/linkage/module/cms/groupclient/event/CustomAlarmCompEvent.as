package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;
	
	/**
	 * 影响客户数组件事件类
	 * @author shiliang(66614) Tel:13770527121
	 * @version 1.0
	 * @since 2012-1-5 下午01:17:57
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class CustomAlarmCompEvent extends Event
	{
		public var param:Object;
		public static const QUERYCUST:String = "queryCust";
		public static const DATACHANGE:String = "dataChange";
		public static const CUSTSHOW:String = "custShow";
		public function CustomAlarmCompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}