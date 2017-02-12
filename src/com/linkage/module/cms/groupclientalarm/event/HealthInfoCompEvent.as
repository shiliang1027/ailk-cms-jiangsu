package com.linkage.module.cms.groupclientalarm.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author xudx 
	 */
	public class HealthInfoCompEvent extends Event
	{
		public static const RESBASEINFODATACHANGE:String = "resBaseInfodataChange";
		public static const CLIENTINFOQUERY:String = "clientInfoQuery";
		public static const THICKNESSTABLEDATACHANGE:String = "thicknessTableDataChange";
		public static const THICKNESSTABLEDATAQUERY:String = "thicknessTableDataQuery";
		public static const EQUIPMENTINFOCHANGE:String = "equipmentInfoChange";
		public static const EQUIPMENTINFOQUERY:String = "equipmentInfoQuery";
		public static const SPECINFOCHANGE:String = "specInfoChang";
		public static const SPECINFODATAQUERY:String = "specInfodataQuery";
		public static const ALARMSIGNQUERY:String = "alarmSignQuery";
		public static const ALARMSIGNCHANGE:String = "alarmSignChang";
		public static const YUYINDATAQUERY:String = "yuyinDataQuery";
		public static const YUYINDATACHANGE:String = "yuyinDataChang";
		public static const SHUJUDATAQUERY:String = "shujuDataQuery";
		public static const SHUJUDATACHANGE:String = "shujuDataChang";
		public static const HULIANWANGDATAQUERY:String = "hulianwangDataQuery";
		public static const HULIANWANDATACHANGE:String = "hulianwangDataChang";
		public static const DUANXINDATAQUERY:String = "duanxinDataQuery";
		public static const DUANXINDATACHANGE:String = "duanxinDataChang";
		public static const WANGLUOFUWUDATAQUERY:String = "wangluofuwuDataQuery";
		public static const WANGLUOFUWUDATACHANGE:String = "wangluofuwuDataChang";
		
		public static const CHANGCUSTDATARENDERER:String = "changCustDataRenderer";
		//public static const ALARMSIGNDATAQUERY:String = "alarmSigndataQuery";
		
		public static const REFRESH:String = "refresh";
		public var param:Object;
		
		public function HealthInfoCompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}