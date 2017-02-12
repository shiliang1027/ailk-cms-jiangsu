package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.domain.SceneThumbnailDM;

	import org.spicefactory.parsley.core.messaging.impl.Selector;
	import org.spicefactory.parsley.messaging.MessageHandler;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneThumbnailServ
	{
		private var log:ILogger = Log.getLoggerByClass(SportHistorySceneServ);

		[Inject("sceneThumbnailDM")]
		public var dm:SceneThumbnailDM;

		// 消息派发器
		[MessageDispatcher]
		public var dispatcherMsg:Function = null;

	}
}

