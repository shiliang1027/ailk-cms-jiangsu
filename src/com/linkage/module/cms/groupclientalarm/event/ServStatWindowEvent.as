package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-24 上午10:44:53
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ServStatWindowEvent extends Event
	{
		public static const INIT:String = "init";
		public static const CLEAR:String = "clear";
		public static const DATACHANGE:String = "dataChange";
		public static const SERVTYPEDATACHANGE:String = "servTypeDataChange";
		public static const SERVSAFEDATACHANGE:String = "servSafeDataChange";
		public static const PAGECHANGE:String = "pageChange";
		public static const CUSTDATACHANGE:String = "custDataChange";
		public static const PAGEGO:String = "pageGo";
		public var param:Object;
		public function ServStatWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}