package com.linkage.module.cms.transferdevicepanel.event
{
	import flash.events.Event;
	
	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2014-5-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class TransferDevicePanelEvent extends Event
	{
		public var param:Object;
		public static const LOAD_SLOTDATA:String = "LOAD_SLOTDATA";
		public static const LOAD_PTPDATA:String = "LOAD_PTPDATA";
		public static const LOAD_PROPDATA:String = "LOAD_PROPDATA";
		public static const LOAD_PTPPROPDATA:String = "LOAD_PTPPROPDATA";
		public static const REFRESHTIMECHANGE:String = "REFRESHTIMECHANGE";
		public static const PROPCOMPCHANGE:String = "PROPCOMPCHANGE";
		public static const REFRESH:String = "REFRESH";
		public static const PROPCOLUMNSCHANGE:String = "PROPCOLUMNSCHANGE";
		public static const ALARMFLOWSTART:String = "ALARMFLOWSTART";
		public static const ALARMFLOWSTOP:String = "ALARMFLOWSTOP";
		public function TransferDevicePanelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}