package com.linkage.module.cms.gsscene.view.components.kpisituation.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.kpisituation.KPISituationDM;
	import com.linkage.module.cms.gsscene.view.components.kpisituation.event.KPISituationEvent;
	
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-1-6
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DegradationTopNumGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(DegradationTopNumGetCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("kPISituationDM")]
		public var kpiSituationDM:KPISituationDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("[topNum获取]:topNum cmd捕获");
			return scenePanelDao.getSceneDetail(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[topNum获取]result 返回结果集:{0},{1};", data["DEFAULT_TOPNNUM"], data["TOPNNUM"]);
			kpiSituationDM.MAX_TOPNUM = data["DEFAULT_TOPNNUM"];
			kpiSituationDM.topNum = data["TOPNNUM"];
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("[topNum获取]:cmd命令返回失败error:" + f.faultString + "\n" + f.faultDetail);
		}
	}
}