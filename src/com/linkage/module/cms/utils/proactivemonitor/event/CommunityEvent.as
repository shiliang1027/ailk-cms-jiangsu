package com.linkage.module.cms.proactivemonitor.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-10-21 下午04:40:17
	 * @category com.linkage.module.cms.proactivemonitor.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class CommunityEvent extends Event
	{
		public static const PERFQUERY:String = "perfQuery";
		public static const PERFCHANGE:String = "perfChange";
		public static const DATAQUERY:String = "dataQuery";
		public static const DATACHANGE:String = "dataChange";
		public static const GISQUERY:String = "gisQuery";
		public static const GISCHANGE:String = "gisChange";
		public static const MOSHOW:String = "moShow";
		public static const MOSITE:String = "moSite";
		public var param:Object;
		public function CommunityEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}