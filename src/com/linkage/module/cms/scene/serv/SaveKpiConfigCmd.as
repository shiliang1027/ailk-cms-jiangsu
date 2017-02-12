package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.domain.KPISituationDM;
	import com.linkage.module.cms.scene.event.KPISituationEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

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
	public class SaveKpiConfigCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SaveKpiConfigCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("kPISituationDM")]
		public var kpiSituationDM:KPISituationDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("[指标配置保存]:cmd命令捕获execute开始执行...");
			return scenePanelDao.kpiConfig(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[指标配置保存]:result info ...");
			log.debug(data);
			kpiSituationDM.kpiConfigSaveResult = data as String;
			log.debug(kpiSituationDM.kpiConfigSaveResult);
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_SAVE_RESULT);
			e.param.resultInfo = kpiSituationDM.kpiConfigSaveResult;
			msgDispatcher(e);
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[指标配置保存]:cmd命令返回失败error..." + f.faultString + "\n" + f.faultDetail);
			kpiSituationDM.kpiConfigSaveResult = "failure";
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_SAVE_RESULT);
			e.param.resultInfo = kpiSituationDM.kpiConfigSaveResult;
			msgDispatcher(e);
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

