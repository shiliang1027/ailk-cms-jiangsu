package com.linkage.module.cms.gsscene.view.components.importantKPI
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.importantKPI.ImportantKPIDM;
	import com.linkage.module.cms.gsscene.view.components.importantKPI.event.ImportantKPIEvent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.spicefactory.lib.reflect.types.Void;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ImportantKPIPM
	{
		private var log:ILogger = Log.getLoggerByClass(ImportantKPIPM);

		[MessageDispatcher]
		public var msgDispatcher:Function;

		//重点指标定时器
		private var timer:Timer = new Timer(5000);

		[Inject("importantKPIDM")]
		[Bindable]
		public var impDM:ImportantKPIDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

		public function ImportantKPIPM():void
		{
			log.debug("[重点指标]:构造函数执行timer监听...");
			timer.addEventListener(TimerEvent.TIMER, loopChartData);
		}

		public function loadKpiDatas(startTime:String, endTime:String):void
		{
			log.debug("[重点指标]:事件分发LOAD_KPI_DATA...");
			log.debug(startTime);
			log.debug(endTime);
			var importantKPIEvent:ImportantKPIEvent = new ImportantKPIEvent(ImportantKPIEvent.LOAD_KPI_DATA);
			importantKPIEvent.startTime = startTime;
			importantKPIEvent.endTime = endTime;
//			msgDispatcher(importantKPIEvent);
			requestServerUtil.addRequest(importantKPIEvent);
		}

		public function startTimer():void
		{
			timer.start();
		}

		/**
		 *轮循展示图表事件分发
		 */
		private function loopChartData(event:TimerEvent):void
		{
			log.debug("[重点指标:]事件派发：" + ImportantKPIEvent.LOOP_KPI_DATA);
			msgDispatcher(new ImportantKPIEvent(ImportantKPIEvent.LOOP_KPI_DATA));
		}
	}
}