package com.linkage.module.cms.oneline.view.components.wireless
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.oneline.domain.wireless.GisHotDM;
	import com.linkage.module.cms.oneline.event.wireless.GisHotEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-12-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GisHotViewPM
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotViewPM);
		
		[Bindable]
		[Inject("gisHotDM")]
		public var dm:GisHotDM;
		[MessageDispatcher]
		public var dispatcher:Function;
		
//		public var timer:Timer = new Timer(10000);
		public function GisHotViewPM()
		{
//			timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
		}
		
//		private function onTimerHandler(event:TimerEvent):void{
//			log.info("onTimerHandler: {0}",event);
//			dispatcher(new GisHotEvent(GisHotEvent.DOLOADHOTSPOTCELLDATA));
//		}
	}
}