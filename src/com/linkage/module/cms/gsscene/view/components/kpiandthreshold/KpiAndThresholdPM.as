package com.linkage.module.cms.gsscene.view.components.kpiandthreshold
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.kpiandthreshold.KpiAndThresholdDM;
	import com.linkage.module.cms.gsscene.view.components.kpiandthreshold.event.KpiAndThresholdEvent;

	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2013-2-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiAndThresholdPM
	{
		private var log:ILogger=Log.getLoggerByClass(KpiAndThresholdPM);

		[Inject("kpiAndThresholdDM")]
		[Bindable]
		public var kpiAndThresholdDM:KpiAndThresholdDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function loadData(p:Object):void
		{
			if (log.infoEnabled)
				log.info("加载 Kpi And Threshold 数据！");
			var e:KpiAndThresholdEvent=new KpiAndThresholdEvent(KpiAndThresholdEvent.LOAD_KPIANDTHRESHOLD_DATA);
			e.param=p;
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);
			log.info("加载 Kpi And Threshold e .dis");
		}

	}
}

