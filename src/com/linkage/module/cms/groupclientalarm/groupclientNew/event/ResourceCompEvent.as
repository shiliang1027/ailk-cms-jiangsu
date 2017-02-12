package com.linkage.module.cms.groupclientNew.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-8 下午12:01:43
	 * @category com.linkage.module.cms.groupclientNew.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ResourceCompEvent extends Event
	{
		public static const RESINFODATACHANGE:String = "resInfodataChange";
		public static const RESINFODATAQUERY:String = "resInfodataQuery";
		public static const RESSERVDATACHANGE:String = "resServdataChange";
		public static const RESSERVDATAQUERY:String = "resServdataQuery";
		public static const REFRESH:String = "refresh";
		public var param:Object;
		public function ResourceCompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}