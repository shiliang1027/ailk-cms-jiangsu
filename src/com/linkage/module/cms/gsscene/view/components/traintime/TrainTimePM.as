package com.linkage.module.cms.gsscene.view.components.traintime
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.traintime.event.TrainTimeEvent;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	public class TrainTimePM
	{
		private var log:ILogger = Log.getLoggerByClass(TrainTimePM);

		[Inject("trainTimeDM")]
		[Bindable]
		public var trainTimeDM:TrainTimeDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function loadData():void
		{
			if(log.infoEnabled)
				log.info("加载 Train Time 数据！");

			var e:TrainTimeEvent = new TrainTimeEvent(TrainTimeEvent.LOAD_TRAINTIME_DATA);

//			dispatchMsg(e );
			requestServerUtil.addRequest(e);
		}

	}
}

