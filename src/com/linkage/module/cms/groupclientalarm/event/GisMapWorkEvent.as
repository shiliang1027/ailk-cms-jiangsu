package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-24 下午11:09:56
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class GisMapWorkEvent extends Event
	{
		public static const INIT:String = "init";
		public static const VIEWINIT:String = "viewInit";
		public static const VIEWBACK:String = "viewBack";
		public static const CITYLOCATIONCHANGE:String = "cityLocationChange";
		public static const CITYLOCATIONSELECTED:String = "cityLocationSelected";
		public static const CITYCHANGE:String = "cityChange";
		public static const ALARMINFOLOAD:String = "alarmInfoLoad";
		public static const ALARMNUMLOAD:String = "alarmNumLoad";
		public static const ALARMINFODATACHANGE:String  = "alarmInfoDataChange";
		public static const ALARMNUMDATACHANGE:String = "alarmNumDataChange";
		public var param:Object;
		public function GisMapWorkEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}