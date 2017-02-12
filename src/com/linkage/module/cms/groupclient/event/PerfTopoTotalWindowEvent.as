package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-28 下午01:10:42
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class PerfTopoTotalWindowEvent extends Event
	{
		public static const DATACHANGE:String = "dataChange";
		public static const DATARELOAD:String = "dataReload";
		public static const INIT:String = "init";
		public var param:Object;
		public function PerfTopoTotalWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}