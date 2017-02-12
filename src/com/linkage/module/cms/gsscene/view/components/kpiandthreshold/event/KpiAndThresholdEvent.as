package com.linkage.module.cms.gsscene.view.components.kpiandthreshold.event
{
	import flash.events.Event;

	public class KpiAndThresholdEvent extends Event
	{
		public static const LOAD_KPIANDTHRESHOLD_DATA:String="LOAD_KPIANDTHRESHOLD_DATA";
		public var param:Object;

		public function KpiAndThresholdEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}