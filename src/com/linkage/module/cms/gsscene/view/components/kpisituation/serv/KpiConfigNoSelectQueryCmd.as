package com.linkage.module.cms.gsscene.view.components.kpisituation.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.kpisituation.KPISituationDM;
	import com.linkage.module.cms.gsscene.view.components.kpisituation.event.KPISituationEvent;
	
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
	public class KpiConfigNoSelectQueryCmd
	{
		private var log:ILogger = Log.getLoggerByClass(KpiConfigNoSelectQueryCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("kPISituationDM")]
		public var kpiSituationDM:KPISituationDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("[重点指标配置阈值查询指标：]cmd命令捕获execute开始执行...");
			return scenePanelDao.queryAllPerf(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[重点指标配置阈值查询指标：]result info ...");
			kpiSituationDM.kpiConfigNoSelectList.removeAll();
			kpiSituationDM.kpiConfigNoSelectList.addAll(data as IList);
			kpiSituationDM.kpiConfigNoSelectList.refresh();
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("[重点指标配置阈值查询指标：]cmd命令返回失败error..." + f.faultString + "\n" + f.faultDetail);
		}
	}
}
