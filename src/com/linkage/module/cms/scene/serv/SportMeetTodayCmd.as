package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.ScenePanelDao;
	import com.linkage.module.cms.scene.domain.RaceInfoDM;
	import com.linkage.module.cms.scene.domain.SceneIntroDM;
	import com.linkage.module.cms.scene.event.RaceInfoEvent;
	import com.linkage.module.cms.scene.event.compenent.SceneIntroEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-8
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SportMeetTodayCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SportMeetTodayCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:ScenePanelDao;

		[Inject("sceneIntroDM")]
		public var sceneIntroDM:SceneIntroDM;

		[Inject("raceInfoDM")]
		public var dm:RaceInfoDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneIntroEvent):AsyncToken
		{
			log.info("[赛事信息]:  cmd 加载数据！");
			return scenePanelDao.getSceneTodayGameList();
		}

		public function result(data:Object):void
		{
			log.info("[赛事信息]:  返回数据 data=" + data.length);

			dm.raceInfoList.removeAll();
			dm.raceInfoList.addAll(data as IList);
			dm.raceInfoList.refresh();

			var evt:RaceInfoEvent = new RaceInfoEvent(RaceInfoEvent.CMS_SCENE_RACEINFO_RACEINFOINIT);
			msgDispatcher(evt);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[运动会详情]:cmd 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}