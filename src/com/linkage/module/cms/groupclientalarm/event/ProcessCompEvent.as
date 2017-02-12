package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 工程割接信息组件事件类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-10 下午02:51:15
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ProcessCompEvent extends Event
	{
		public static const DATAQUERY:String = "dataQuery";
		public static const DATACHANGE:String = "dataChange";
		public static const INFOQUERY:String = "infoQuery";
		public static const INFOCHANGE:String = "infoChange";
		public var param:Object;
		public function ProcessCompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}