package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;
	
	/**
	 * 省级地图事件类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-24 下午04:49:45
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class DummyMapWorkEvent extends Event
	{
		public static const INIT:String = "init";
		public static const VIEWINIT:String = "viewInit";
		public static const CITYLAYERCHANGE:String = "cityLayerChange";
		public static const CITYNOSELECTED:String = "cityLayerNoSelected";
		public static const CITYALLSELECTED:String = "cityAllSelected";
		public static const CITYPROVINCESELECTED:String = "cityProvinceSelected";
		public static const CITYTRANSPROVINCESELECTED:String = "cityTransProvinceSelected";
		public static const CITYSELECTED:String = "citySelected";
		public static const ALARMINFOLOAD:String = "alarmInfoLoad";
		public static const ALARMNUMLOAD:String = "alarmNumLoad";
		public static const ALARMINFODATACHANGE:String  = "alarmInfoDataChange";
		public static const ALARMNUMDATACHANGE:String = "alarmNumDataChange";
		public static const MAPCITYSELECTED:String = "mapCitySelected";
		public static const REFRESH:String = "refresh";
		public static const CUSTOMERSCALE:String = "customerScale";
		public static const BUSINESSSCALE:String = "businessScale";
		public static const ALARMSCALE:String = "alarmScale";
		public var param:Object;
		public function DummyMapWorkEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}