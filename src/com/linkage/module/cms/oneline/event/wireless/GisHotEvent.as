package com.linkage.module.cms.oneline.event.wireless
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-12-10
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GisHotEvent extends Event
	{
		public var param:Object;
		
		public static const GISHOTVIEWSHOW:String = "GISHOTVIEWSHOW";
		/**
		 * 事件类型：加载地市列表 
		 */
		public static const LOADCITYSDATA:String = "LOADCITYSDATA";
		public static const LOADCITYSDATACOMPLETE:String = "LOADCITYSDATACOMPLETE";
		public static const LOADCITYSDATAERROR:String = "LOADCITYSDATAERROR";
		/**
		 * 事件类型：加载GIS热图右侧列表 
		 */		
		public static const DOLOADHOTSPOTCELLDATA:String = "DOLOADHOTSPOTCELLDATA";
		public static const LOADHOTSPOTCELLDATA:String = "LOADHOTSPOTCELLDATA";
		public static const LOADHOTSPOTCELLDATACOMPLETE:String = "LOADHOTSPOTCELLDATACOMPLETE";
		public static const LOADHOTSPOTCELLDATAERROR:String = "LOADHOTSPOTCELLDATAERROR";
		public static const REFRESHHOTSPOTCELLDATA:String = "REFRESHHOTSPOTCELLDATA";
		//刷新GIS热点历史数据
		public static const LOADHOTHISTORYDATA:String = "LOADHOTHISTORYDATA";
		/**
		 * 事件类型：刷新小区拨打号码top10数据详情 
		 */	
		public static const LOADSPECIALPHONEDATA:String = "LOADSPECIALPHONEDATA";
		public static const REFRESHSPECIALPHONEDATA:String = "REFRESHSPECIALPHONEDATA";
		
		/**
		 * 事件类型：加载GIS热图右侧列表详情 
		 */		
		public static const LOADKPILISTDATA:String = "LOADKPILISTDATA";
		public static const LOADKPILISTDATACOMPLETE:String = "LOADKPILISTDATACOMPLETE";
		public static const LOADKPILISTDATAERROR:String = "LOADKPILISTDATAERROR";
		/**
		 * 事件类型：加载GIS点信息 
		 */		
		public static const LOADGISINFODATA:String = "LOADGISINFODATA";
		public static const LOADGISINFODATACOMPLETE:String = "LOADGISINFODATACOMPLETE";
		public static const LOADGISINFODATAERROR:String = "LOADGISINFODATAERROR";
		public static const LOADHISTORYHOTGISINFODATA:String = "LOADHISTORYHOTGISINFODATA";
		/**
		 * 普通小区gis定位
		 **/ 
		public static const LOADNORMALCELLGISINFODATA:String = "LOADNORMALCELLGISINFODATA";
		public static const LOADNORMALCELLGISINFODATACOMPLETE:String = "LOADNORMALCELLGISINFODATACOMPLETE";
		
		
		public static const LOADMOINFODATA:String = "LOADMOINFODATA";
		public static const LOADMOINFODATACOMPLETE:String = "LOADMOINFODATACOMPLETE";
		public static const LOADMOINFODATAERROR:String = "LOADMOINFODATAERROR";
		
		
		public static const SHOWMOINFOVIEW:String = "SHOWMOINFOVIEW";
		public static const HIDEMOINFOVIEW:String = "HIDEMOINFOVIEW";
		
		/**
		 * 事件类型：加载小区辐射范围 
		 */		
		public static const LOADCELLRADIUSDATA:String = "LOADCELLRADIUSDATA";
		public static const LOADCELLRADIUSDATACOMPLETE:String = "LOADCELLRADIUSDATACOMPLETE";
		public static const LOADCELLRADIUSDATAERROR:String = "LOADCELLRADIUSDATAERROR";
		/**
		 * 事件类型：保存小区辐射范围 
		 */	
		public static const SAVECELLRADIUSDATA:String = "SAVECELLRADIUSDATA";
		public static const SAVECELLRADIUSDATACOMPLETE:String = "SAVECELLRADIUSDATACOMPLETE";
		public static const SAVECELLRADIUSDATAERROR:String = "SAVECELLRADIUSDATAERROR";
		/**
		 * 事件类型：保存标注 
		 */		
		public static const SHOWREMARKVIEW:String = "SHOWREMARKVIEW";
		public static const SAVEREMARKDATA:String = "SAVEREMARKDATA";
		public static const SAVEREMARKDATACOMPLETE:String = "SAVEREMARKDATACOMPLETE";
		public static const SAVEREMARKDATAERROR:String = "SAVEREMARKDATAERROR";
		/**
		 * 事件类型：加载指标列表 
		 */		
		public static const LOADKPISDATA:String = "LOADKPISDATA";
		public static const LOADKPISDATACOMPLETE:String = "LOADKPISDATACOMPLETE";
		public static const LOADKPISDATAERROR:String = "LOADKPISDATAERROR";
		/**
		 * 事件类型： 指标趋势
		 */		
		public static const SHOWKPICHARTVIEW:String = "SHOWKPICHARTVIEW";
		public static const LOADKPICHARTDATA:String = "LOADKPICHARTDATA";
		public static const LOADKPICHARTDATACOMPLETE:String = "LOADKPICHARTDATACOMPLETE";
		public static const LOADKPICHARTDATAERROR:String = "LOADKPICHARTDATAERROR";
		
		/**
		 * 事件类型：GIS定位 
		 */		
		public static const GISLOCATION:String = "GISLOCATION";
		
		public static const SHOWFASTCUSTOMVIEW:String = "SHOWFASTCUSTOMVIEW";
		public static const DOSAVEFASTCUSTOMDATA:String = "DOSAVEFASTCUSTOMDATA";
		public static const SAVEFASTCUSTOMDATA:String = "SAVEFASTCUSTOMDATA";
		public static const SAVEFASTCUSTOMDATACOMPLETE:String = "SAVEFASTCUSTOMDATACOMPLETE";
		
		public static const SHOWPICLAYERVIEW:String = "SHOWPICLAYERVIEW";
		
		public static const PICLAYERCHANGE:String = "PICLAYERCHANGE";
		
		public function GisHotEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}