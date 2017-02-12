package com.linkage.module.cms.proactivemonitor.event
{
	import flash.events.Event;
	
	/**
	 * GIS地图组件事件类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-10-19 下午12:08:24
	 * @category com.linkage.module.cms.proactivemonitor.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class GisMapWorkEvent extends Event
	{
		public static const FEATURECHANGE:String = "feature_change";
		public static const FEATURESITE:String = "feature_site";
		public var param:Object;
		public function GisMapWorkEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}