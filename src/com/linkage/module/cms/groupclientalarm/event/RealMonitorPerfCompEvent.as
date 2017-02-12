package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-2 下午05:26:30
	 * @category com.linkage.module.cms.groupclientalarm.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class RealMonitorPerfCompEvent extends Event
	{
		public static const SERVERQUERY:String = "serverQuery";
		public static const SERVERCHANGE:String = "serverChange";
		public static const SERVERTARGETQUERY:String = "serverTargetQuery";
		public static const SERVERTARGETCHANGE:String = "ServerTargetChange";
		public static const PERFQUERY:String = "perfQuery";
		public static const PERFDATACHANGE:String = "perfDataChange";
		public var param:Object;
		public function RealMonitorPerfCompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}