package com.linkage.module.cms.scenedaily.event.delisting
{
	import flash.events.Event;

	/**
	 * 
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DelistingEvent extends Event
	{
		public var param:Object=new Object();
		//加载数据
		public static const LOAD_DELISTING_MO_DATA:String="loadDelistingMoData";
		
		public function DelistingEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}