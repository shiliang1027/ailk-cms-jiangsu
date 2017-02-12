package com.linkage.module.cms.groupclientNew.event
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
		
		public static const CHANGEDATARENDERER:String = "changedatarenderer";
		public static const CUSTNETTOPODATA:String = "custNetTopoData";
		public static const EDITABLE:String = "editable";
		public static const SAVEEDITDATA:String = "saveEditData";
		public static const SAVEEDITCOMDATA:String = "saveEditComData";
		public static const ISSAVESUC:String = "isSaveSuc";
		public static const DATACHANGECMP:String = "dataChangeCmp";
		public static const INITCUST:String = "initCust";
		public static const INITCOMP:String = "initComp";
		public static const SAVECUSTINFO:String = "saveCustInfo";
		public static const ISSAVECUSTINFO:String = "isSaveCustInfo";
		public static const TOPOLOAD:String = "topoLoad";
		public static const EXPORTCOMP:String = "exportComp";
		public static const EXPORTBASE:String = "exportBase";
		public static const EXPORTTOPO:String = "exportTopo";
		public static const EXPORTBUSINESS:String = "exportBusiness";
		//public static const ALARMSIGNDATAQUERY:String = "alarmSigndataQuery";
		
		public static const REFRESH:String = "refresh";
		public var param:Object;
		public var str:String = null;
		
		public function HealthInfoCompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}