package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-3 下午02:18:11
	 * @category com.linkage.module.cms.groupclientalarm.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class PerfDataShowCompEvent extends Event
	{
		public static const DATAQUERY:String = "dataQuery";
		public static const DATACHANGE:String = "dataChange";
		public static const SELECTCHANGE:String = "selectChange";
		public static const COMPLETE:String = "buildComplete";
		public var param:Object;
		public function PerfDataShowCompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}