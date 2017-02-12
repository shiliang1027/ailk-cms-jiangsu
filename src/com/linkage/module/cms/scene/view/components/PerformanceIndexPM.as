package com.linkage.module.cms.scene.view.components
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 */

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.domain.PerformanceIndexDM;
	import com.linkage.module.cms.scene.event.compenent.PerformanceIndexEvent;

	public class PerformanceIndexPM
	{

		private var log:ILogger = Log.getLoggerByClass(PerformanceIndexPM);

		[Inject("performanceIndexDM")]
		[Bindable]
		public var performanceIndexDM:PerformanceIndexDM;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		[MessageDispatcher] //可以发事件
		public var dispatchMsg:Function;

		public function loadData():void
		{
			log.info("load float data  PM event！");
//			dispatchMsg(new PerformanceIndexEvent("LOAD_PERFORMANCAINDEX_DATA"));
			requestServerUtil.addRequest(new PerformanceIndexEvent("LOAD_PERFORMANCAINDEX_DATA"));
		}
	}
}