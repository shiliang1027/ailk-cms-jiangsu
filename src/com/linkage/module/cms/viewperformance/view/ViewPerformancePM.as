package com.linkage.module.cms.viewperformance.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.viewperformance.domain.ViewPerformanceDM;
	import com.linkage.module.cms.viewperformance.event.ViewPerformanceEvent;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-11-03
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ViewPerformancePM
	{
		private var log:ILogger=Log.getLoggerByClass(ViewPerformancePM);
		
		[Inject("viewPerformanceDM")]
		[Bindable]
		public var dm:ViewPerformanceDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function loadData():void
		{
			if (log.infoEnabled)
				log.info("加载性能数据！");
			var e:ViewPerformanceEvent = new ViewPerformanceEvent(ViewPerformanceEvent.VIEWPERF_QUERYPERFDATA);
			dispatchMsg(e);
		}
	}
}