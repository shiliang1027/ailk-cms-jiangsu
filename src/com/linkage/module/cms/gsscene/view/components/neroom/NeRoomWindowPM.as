package com.linkage.module.cms.gsscene.view.components.neroom
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.neroom.NeRoomDM;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-11-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class NeRoomWindowPM
	{
		private var log:ILogger=Log.getLoggerByClass(NeRoomWindowPM);

		[Inject("neRoomDM")]
		[Bindable]
		public var dm:NeRoomDM;
	}
}