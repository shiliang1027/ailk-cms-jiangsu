package com.linkage.module.cms.scene.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.domain.AreaQuickConfigDM;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-12-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class AreaQuickConfigViewPM
	{
		private var log:ILogger=Log.getLoggerByClass(AreaQuickConfigViewPM);

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Bindable]
		[Inject("areaQuickConfigDM")]
		public var dm:AreaQuickConfigDM;
	}
}