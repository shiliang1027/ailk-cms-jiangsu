package com.linkage.module.cms.quitstatnew.event
{
	import flash.events.Event;
	
	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-10-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class QuitStatEvent extends Event
	{
		public static const MODULE_CREATETION_COMPLETE:String = "MODULE_CREATETION_COMPLETE";
		
		public static const QUITSTAT_LOADDATA:String = "QUITSTAT_LOADDATA";
		
		public static const QUITSTAT_LOADDATA_MAP:String = "QUITSTAT_LOADDATA_MAP";
		
		public static const QUITSTAT_LOADDATA_MAP_COMPLETE:String = "QUITSTAT_LOADDATA_MAP_COMPLETE";
		
		public static const QUITSTAT_LOADDATA_COMPLETE:String = "QUITSTAT_LOADDATA_COMPLETE";
		
		public static const MAPCOLOR_DYEING:String = "MAPCOLOR_DYEING";
		
		public static const LOADQUIT_DETAILDATA:String = "LOADQUIT_DETAILDATA";
		
		public static const LOADQUIT_DETAILDATA_COMPLETE:String = "LOADQUIT_DETAILDATA_COMPLETE";
		
		public static const QUITSTAT_LOADDATA_HISTORY_WINDOW_SHOW:String = "QUITSTAT_LOADDATA_HISTORY_WINDOW_SHOW";
		
		public static const QUITSTAT_LOADDATA_HISTORY:String = "QUITSTAT_LOADDATA_HISTORY";
		
		public static const QUITSTAT_LOADDATA_HISTORY_COMPLETE:String = "QUITSTAT_LOADDATA_HISTORY_COMPLETE";
		
		public static const QUITSTAT_KPI_CONFIG_WINDOW_SHOW:String = "QUITSTAT_KPI_CONFIG_WINDOW_SHOW";
		
		public static const QUITSTAT_KPI_DISPLAY_CONFIG_WINDOW_SHOW:String = "QUITSTAT_KPI_DISPLAY_CONFIG_WINDOW_SHOW";
		
		public static const LOADCITYS:String = "LOADCITYS";
		
		public static const LOADCITYSCOMPLETE:String = "LOADCITYSCOMPLETE";
		
		public static const LOAD_THRESHOLD_DATA:String = "LOAD_THRESHOLD_DATA";
		public static const LOAD_THRESHOLD_DATA_COMPLETE:String = "LOAD_THRESHOLD_DATA_COMPLETE";
		
		public static const SAVE_THRESHOLD_DATA:String = "SAVE_THRESHOLD_DATA";
		public static const SAVE_THRESHOLD_DATA_COMPLETE:String = "SAVE_THRESHOLD_DATA_COMPLETE";
		
		
		public static const LOAD_QUOTASH_CONFIGDATA:String = "LOAD_QUOTASH_CONFIGDATA";
		
		public static const LOAD_QUOTASH_CONFIGDATA_COMPLETE:String = "LOAD_QUOTASH_CONFIGDATA_COMPLETE";
		
		public static const SAVE_QUOTASH_CONFIGDATA:String = "SAVE_QUOTASH_CONFIGDATA";
		
		public static const SAVE_QUOTASH_CONFIGDATA_COMPLETE:String = "SAVE_QUOTASH_CONFIGDATA_COMPLETE";
		
		public static const SAVE_MULTKPI_CONFIGDATA:String = "SAVE_MULTKPI_CONFIGDATA";
		
		public static const SAVE_MULTKPI_CONFIGDATA_COMPLETE:String = "SAVE_MULTKPI_CONFIGDATA_COMPLETE";
		
		public static const QUITSTAT_MULTKPI_CONFIG_WINDOW_SHOW:String = "QUITSTAT_MULTKPI_CONFIG_WINDOW_SHOW";
		
		public static const QUITSTAT_CONFIG_WINDOW_SHOW:String = "QUITSTAT_CONFIG_WINDOW_SHOW";
		
		public static const LOAD_MULTKPI_CONFIGDATA:String = "LOAD_MULTKPI_CONFIGDATA";
		
		public static const LOAD_MULTKPI_CONFIGDATA_COMPLETE:String = "LOAD_MULTKPI_CONFIGDATA_COMPLETE";
		public var param:Object;
		
		public function QuitStatEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}