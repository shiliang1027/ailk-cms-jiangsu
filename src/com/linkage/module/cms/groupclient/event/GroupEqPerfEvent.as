package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;
	
	/**
	 * 集客设备性能事件
	 * @author 汪炜
	 * @version 1.0
	 * @date 2013-9-25
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class GroupEqPerfEvent extends Event
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