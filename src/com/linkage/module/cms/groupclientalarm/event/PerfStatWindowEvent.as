package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 性能统计事件
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-24 上午09:14:38
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class PerfStatWindowEvent extends Event
	{
		public static const INIT:String = "init";
		public static const DATACHANGE:String = "dataChange";
		public static const SERVTYPEDATACHANGE:String = "servTypeDataChange";
		public static const SERVTYPESELECTCHANGE:String = "servTypeSelectChange";
		public static const GROUPPERFDATACHANGE:String = "groupPerfDataChange";
		public static const DATAQUERY:String = "dataQuery";
		public var param:Object;
		public function PerfStatWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}