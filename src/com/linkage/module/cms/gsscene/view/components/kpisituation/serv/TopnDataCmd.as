package com.linkage.module.cms.gsscene.view.components.kpisituation.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.kpisituation.KPISituationDM;
	import com.linkage.module.cms.gsscene.view.components.kpisituation.event.KPISituationEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class TopnDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(TopnDataCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("kPISituationDM")]
		public var kpiSituationDM:KPISituationDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		private var systime:Number = 0;

		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("[劣化topn]:topn数据列表cmd捕获");
			systime = (new Date()).getTime();
			return scenePanelDao.getSceneTopN(e.selectTopnId, e.strMoTypeId);
		}

		public function result(data:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info("[劣化topn：]result 返回结果集 " + data.length);
			this.kpiSituationDM.topNData.removeAll();
			this.kpiSituationDM.topNData.addAll(data as IList);

			if (data && data.length > 0)
			{
				log.debug("topn 有数据了！！！");
				msgDispatcher(new SceneEvent(SceneEvent.CMS_SCENE_TOPNDATA_TOPNDATALENGTH));
			}
			msgDispatcher(new KPISituationEvent(KPISituationEvent.SHOW_TOPN_DATA));
			msgDispatcher(new Event("REQUEST_COMPLETE"));

		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("[劣化topn]:cmd命令返回失败error:" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

