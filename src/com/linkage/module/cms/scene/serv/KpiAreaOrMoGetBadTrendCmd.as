package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.domain.SceneIntroDM;
	import com.linkage.module.cms.scene.event.compenent.SceneIntroEvent;
	
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-1-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiAreaOrMoGetBadTrendCmd
	{
		private var log:ILogger = Log.getLoggerByClass(KpiAreaOrMoGetBadTrendCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("sceneIntroDM")]
		public var dm:SceneIntroDM;

		private var param:Object; //测试存储参数

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneIntroEvent):AsyncToken
		{
			log.debug("[指标区域、网元劣化趋势表]数据获取cmd捕获");
			param = e.params;
			return scenePanelDao.queryBadHis(param);
		}

		public function result(data:Object):void
		{
			log.debug("[指标区域、网元劣化趋势表]result 返回结果集");
			var evt:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.CMS_SCENE_SCENEINTRO_SHOWAREAORMOBADTRENDGRID);
			evt.params = new Object();
			evt.params.param = param;
			evt.params.result = data;
			msgDispatcher(evt);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[指标区域、网元劣化趋势表]:cmd命令返回失败error:" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}