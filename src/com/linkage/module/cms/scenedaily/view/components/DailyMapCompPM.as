package com.linkage.module.cms.scenedaily.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.DailyMapDM;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DailyMapCompPM
	{
		private var log:ILogger = Log.getLoggerByClass(DailyMapCompPM);

		[Inject("dailyMapDM")]
		[Bindable]
		public var dm:DailyMapDM

		[MessageDispatcher]
		public var msgDispatcher:Function;
	}
}