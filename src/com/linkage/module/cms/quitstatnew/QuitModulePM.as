package com.linkage.module.cms.quitstatnew
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

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
	public class QuitModulePM
	{

		private var log:ILogger=Log.getLoggerByClass(QuitModulePM);
		[MessageDispatcher]
		public var dispatchMsg:Function;
		[Inject("quitStatDM")]
		[Bindable]
		public var dm:QuitStatDM;
		
		private var timer:Timer=new Timer(2 * 60 * 1000);

		private var isFirst:Boolean=true;

		public function QuitModulePM()
		{
			timer.addEventListener(TimerEvent.TIMER,function(event:TimerEvent):void{
				log.debug("2分钟，定时刷新退服表格数据");
				dispatchMsg(new QuitStatEvent(QuitStatEvent.QUITSTAT_LOADDATA));
			});
		}
		
		public function timerStop():void{
			if(timer.running){
				timer.stop();
			}
		}
		
		public function timerStart():void{
			if(!timer.running){
				timer.start();
			}
		}

		[MessageHandler(selector="MODULE_CREATETION_COMPLETE")]
		public function moduleCreationComplete(e:QuitStatEvent):void
		{
			dispatchMsg(new QuitStatEvent(QuitStatEvent.QUITSTAT_LOADDATA));
		}

		[MessageHandler(selector="QUITSTAT_LOADDATA")]
		public function quitStatLoadData(e:QuitStatEvent):void
		{
			timerStop();
		}

		[MessageHandler(selector="QUITSTAT_LOADDATA_COMPLETE")]
		public function quitStatLoadDataComplete(e:QuitStatEvent):void
		{
			timerStart();
			dispatchMsg(new QuitStatEvent(QuitStatEvent.QUITSTAT_LOADDATA_MAP));
		}

		[MessageHandler(selector="QUITSTAT_LOADDATA_MAP_COMPLETE")]
		public function quitStatLoadMapDataComplete(e:QuitStatEvent):void
		{
			if (!isFirst)
			{
				return;
			}
			dispatchMsg(new QuitStatEvent(QuitStatEvent.LOAD_QUOTASH_CONFIGDATA));
		}
		
		[MessageHandler(selector="LOAD_QUOTASH_CONFIGDATA_COMPLETE")]
		public function quitStatLoadQutashConfigDataComplete(e:QuitStatEvent):void
		{
			if (!isFirst)
			{
				return;
			}
			dispatchMsg(new QuitStatEvent(QuitStatEvent.LOAD_MULTKPI_CONFIGDATA));
		}
		
		[MessageHandler(selector="LOAD_MULTKPI_CONFIGDATA_COMPLETE")]
		public function quitStatLoadMultKpiConfigDataComplete(e:QuitStatEvent):void
		{
			if (!isFirst)
			{
				return;
			}
			dispatchMsg(new QuitStatEvent(QuitStatEvent.LOADCITYS));
		}
		
		
		[MessageHandler(selector="LOADCITYSCOMPLETE")]
		public function quitStatLoadCitysDataComplete(e:QuitStatEvent):void
		{
			if (!isFirst)
			{
				return;
			}
			isFirst=false;
			dispatchMsg(new QuitStatEvent(QuitStatEvent.LOAD_THRESHOLD_DATA));
		}
	}
}