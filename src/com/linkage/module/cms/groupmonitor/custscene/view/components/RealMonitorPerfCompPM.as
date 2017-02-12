package com.linkage.module.cms.groupmonitor.custscene.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;

	import spark.events.IndexChangeEvent;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-17
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RealMonitorPerfCompPM
	{
		private var log:ILogger=Log.getLoggerByClass(RealMonitorPerfCompPM);

		[Inject]
		[Bindable]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

	}
}