package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-1 下午12:15:13
	 * @category com.linkage.module.cms.groupclientalarm.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class FilterFormEvent extends Event
	{
		public static const INIT:String = "formInit";
		public static const SERVTYPECHANGE:String = "servTypeChange";
		public static const CITYCHANGE:String = "cityChange";
		public static const SERVLEVELCHANGE:String = "servLevelChange";
		public static const QUERY:String = "query";
		public var param:Object;
		public function FilterFormEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}	