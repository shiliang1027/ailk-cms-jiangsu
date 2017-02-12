package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(66614) Tel:13770527121
	 * @version 1.0
	 * @since 2012-5-6 下午03:45:43
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ProdTopoNavEvent extends Event
	{
		public static const REFRESH:String = "refresh";
		public static const QUERY:String = "query";
		public static const DATACHANGE:String = "dataChange";
		public static const PRODCHANGE:String = "prodChange";
		public var param:Object;
		
		public function ProdTopoNavEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}