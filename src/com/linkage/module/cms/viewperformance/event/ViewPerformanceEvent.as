package com.linkage.module.cms.viewperformance.event
{
	import flash.events.Event;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-11-03
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ViewPerformanceEvent extends Event
	{
		public var param:Object;
		
		public static const VIEWPERF_QUERYPERFDATA:String = "VIEWPERF_QUERYPERFDATA";
		public function ViewPerformanceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}