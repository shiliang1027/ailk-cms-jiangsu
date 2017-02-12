package com.linkage.module.cms.proactivemonitor.event
{
	import flash.events.Event;

	/**
	 * 无线利用率事件类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-10-20 下午04:51:47
	 * @category com.linkage.module.cms.proactivemonitor.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class WlanRateEvent extends Event
	{
		public static const CITYSQUERY:String = "citysQuery";
		public static const CITYSCHANGE:String = "citysChange";
		public static const CHARTDATAQUERY:String = "chartDataQuery";
		public static const CHARTDATACHANGE:String = "chartDataChange";
		public static const DATAEXPORT:String = "dataExport";
		public static const DATAQUERY:String = "dataQuery";
		public static const DATACHANGE:String = "dataChange";
		public static const GISQUERY:String = "gisQuery";
		public static const GISCHANGE:String = "gisChange";
		public static const MOSHOW:String = "moShow";
		public static const MOSITE:String = "moSite";
		public var param:Object;

		public function WlanRateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}