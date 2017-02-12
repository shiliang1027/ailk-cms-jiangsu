package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.domain.KPISituationDM;
	import com.linkage.module.cms.scene.event.KPISituationEvent;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-1-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DegradationTopnNupdateCmd
	{
		private var log:ILogger = Log.getLoggerByClass(DegradationTopnNupdateCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("kPISituationDM")]
		public var kpiSituationDM:KPISituationDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("[topNum更新]:topNum更新cmd捕获");
			return scenePanelDao.updateSceneTopnNum(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[topNum更新]result 返回结果集 " + String(data));
			if (String(data) == "success")
			{
				Alert.show("设置TOP " + kpiSituationDM.topTempNum + "成功！", "成功");
				msgDispatcher(new SceneEvent(SceneEvent.CMS_SCENE_DEGRADATIONTOPN_REFRESHTOPN));
				if(kpiSituationDM.loadTopNDataEvent){
					msgDispatcher(kpiSituationDM.loadTopNDataEvent);
				}
			}
			else if (String(data) == "failure")
			{
				Alert.show("设置TOP " + kpiSituationDM.topTempNum + "失败！", "失败");
			}
			else
			{
				log.error("错误的返回结果！！");
				log.info(data);
			}
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[topNum更新]:cmd命令返回失败error:" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}