package com.linkage.module.cms.gsscene.view.components.raceinfo.serv
{

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.raceinfo.RaceInfoDM;
	import com.linkage.module.cms.gsscene.view.components.raceinfo.dao.IRaceInfoDAO;
	import com.linkage.module.cms.gsscene.view.components.raceinfo.event.RaceInfoEvent;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.event.SceneIntroEvent;
	
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
	public class RaceInfoDeleteCmd
	{
		private var log:ILogger = Log.getLoggerByClass(RaceInfoDeleteCmd);

		[Inject("raceInfoDM")]
		public var dm:RaceInfoDM;

		[Inject("raceInfoDAO")]
		public var dao:IRaceInfoDAO;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:RaceInfoEvent):AsyncToken
		{
			log.debug("[赛事信息]:删除使用execute开始执行...");
			return dao.deleteRaceInfos(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[赛事信息]:删除数据成功!");
			if (data && String(data) == "success")
			{
				Alert.show("赛事信息删除成功！！", "提示");
//				msgDispatcher(new SceneIntroEvent(SceneIntroEvent.SHOW_SCENE_GAME_TODAY_DETAIL));
				requestServerUtil.addRequest(new SceneIntroEvent(SceneIntroEvent.SHOW_SCENE_GAME_TODAY_DETAIL));
			}
			else
			{
				Alert.show("赛事信息删除失败！！", "错误");
			}
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("[赛事信息]:删除返回失败：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}