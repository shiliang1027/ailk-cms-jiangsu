package com.linkage.module.cms.scene.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.domain.RaceInfoDM;
	import com.linkage.module.cms.scene.event.compenent.SceneIntroEvent;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-24
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RaceInfoCompPM
	{
		private var log:ILogger = Log.getLoggerByClass(RaceInfoCompPM);

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("raceInfoDM")]
		[Bindable]
		public var dm:RaceInfoDM;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		/**
		 * 请求获取赛事详细信息列表数据
		 *
		 * */
		public function getRaceInfo():void
		{
			log.info("抛出事件，查询赛事详情列表");
//			msgDispatcher(new SceneIntroEvent(SceneIntroEvent.SHOW_SCENE_GAME_TODAY_DETAIL));
			requestServerUtil.addRequest(new SceneIntroEvent(SceneIntroEvent.SHOW_SCENE_GAME_TODAY_DETAIL));
			log.info("抛出事件，查询赛事详情列表 end");
		}

	}
}