package com.linkage.module.cms.scene.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.domain.RoamDM;
	import com.linkage.module.cms.scene.event.RoamEvent;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RoamPM
	{
		private var log:ILogger = Log.getLoggerByClass(RoamPM);

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("roamDM")]
		public var roamDM:RoamDM;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		/**
		 * 漫游图表事件派发
		 */
		public function showRoamData():void
		{
			log.debug("[漫游图表:]事件派发：" + RoamEvent.LOAD_ROAM_DATA);
			var roamEvent:RoamEvent = new RoamEvent(RoamEvent.LOAD_ROAM_DATA);
//			msgDispatcher(roamEvent);
			requestServerUtil.addRequest(roamEvent);
		}

	}
}