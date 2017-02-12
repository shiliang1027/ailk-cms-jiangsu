package com.linkage.module.cms.scenedaily.view.components.hangandpick
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.hangandpick.HangPlateDM;
	import com.linkage.module.cms.scenedaily.event.hangandpick.HangPlateEvent;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangPlateCompPM
	{

		private var log:ILogger = Log.getLoggerByClass(HangPlateCompPM);

		[Inject("hangPlateDM")]
		[Bindable]
		public var dm:HangPlateDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function getHangPlateInfos():void
		{
			log.info("[挂牌]加载挂牌数据，抛出事件LOAD_HANGPLATE_DATA。");
			var evt:HangPlateEvent = new HangPlateEvent(HangPlateEvent.LOAD_HANGPLATE_DATA);
			evt.param = new Object();
			msgDispatcher(evt);
		}


	}
}
