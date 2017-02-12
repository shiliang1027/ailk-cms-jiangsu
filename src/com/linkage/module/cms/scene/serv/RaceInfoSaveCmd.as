package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.dao.IRaceInfoDAO;
	import com.linkage.module.cms.scene.domain.RaceInfoDM;
	import com.linkage.module.cms.scene.event.RaceInfoEvent;
	import com.linkage.module.cms.scene.event.compenent.SceneIntroEvent;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-25
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RaceInfoSaveCmd
	{
		private var log:ILogger = Log.getLoggerByClass(RaceInfoSaveCmd);

		[Inject("raceInfoDM")]
		public var dm:RaceInfoDM;

		[Inject("raceInfoDAO")]
		public var dao:IRaceInfoDAO;

		[MessageDispatcher]
		public var msgDispatcher:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		public function execute(e:RaceInfoEvent):AsyncToken
		{
			log.debug("[赛事信息]:保存使用execute开始执行...");
			return dao.saveRaceInfos(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[赛事信息]:保存使用数据加载成功!");
			if (data && String(data) == "success")
			{
				Alert.show("赛事信息保存成功！！", "提示");
				msgDispatcher(new RaceInfoEvent(RaceInfoEvent.CMS_SCENE_RACEINFO_CLOSEPOPWIN));
//				msgDispatcher(new SceneIntroEvent(SceneIntroEvent.SHOW_SCENE_GAME_TODAY_DETAIL));
				requestServerUtil.addRequest(new SceneIntroEvent(SceneIntroEvent.SHOW_SCENE_GAME_TODAY_DETAIL));
			}
			else
			{
				Alert.show("赛事信息保存失败！！", "错误");
			}
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[赛事信息]:保存使用返回失败，使用测试数据 error..." + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}