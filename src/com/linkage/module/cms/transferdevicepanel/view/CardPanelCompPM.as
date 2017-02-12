package com.linkage.module.cms.transferdevicepanel.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.transferdevicepanel.domain.TransferDevicePanelDM;
	import com.linkage.module.cms.transferdevicepanel.event.TransferDevicePanelEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

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
	public class CardPanelCompPM
	{
		private var log:ILogger=Log.getLoggerByClass(CardPanelCompPM);
		[MessageDispatcher]
		public var dispatchMsg:Function;
		[Inject("transferDevicePanelDM")]
		[Bindable]
		public var dm:TransferDevicePanelDM;
		[Bindable]
		public var refreshTime:Number=0;
		[Bindable]
		public var refreshCount:Number=refreshTime;
		private var refreshCountTimer:Timer=new Timer(1000);

		public function CardPanelCompPM()
		{
			refreshCountTimer.addEventListener(TimerEvent.TIMER, function(event:TimerEvent):void
				{
					refreshCount--;
					if (refreshCount == 0)
					{
						refreshCount=refreshTime;
						dispatchMsg(new TransferDevicePanelEvent(TransferDevicePanelEvent.REFRESH));
					}
				});
		}

		[MessageHandler(selector="REFRESHTIMECHANGE")]
		public function refreshTimeChange(e:TransferDevicePanelEvent):void
		{
			var value:Number=Number(e.param);
			if (value < 0)
			{
				refreshCountTimer.stop();
				refreshCount=refreshTime=0;
			}
			else
			{
				refreshTime=value * 60;
				refreshCount=refreshTime
				if (!refreshCountTimer.running)
				{
					refreshCountTimer.start();
				}
			}
		}
		
		[MessageHandler(selector="REFRESH")]
		public function refresh(e:TransferDevicePanelEvent):void
		{
			dispatchMsg(new TransferDevicePanelEvent(TransferDevicePanelEvent.LOAD_SLOTDATA));
		}
	}
}