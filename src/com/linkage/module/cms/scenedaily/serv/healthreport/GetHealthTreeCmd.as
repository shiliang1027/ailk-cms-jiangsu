package com.linkage.module.cms.scenedaily.serv.healthreport
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.healthreport.HealthReportSetDao;
	import com.linkage.module.cms.scenedaily.dao.impkpi.ImpProKpiDao;
	import com.linkage.module.cms.scenedaily.domain.healthreport.HealthReportSetDM;
	import com.linkage.module.cms.scenedaily.event.healthreport.HealthReportSetEvent;

	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GetHealthTreeCmd
	{
		private var log:ILogger = Log.getLoggerByClass(GetHealthTreeCmd);
		[Inject("healthReportSetDM")]
		public var healthReportSetDM:HealthReportSetDM;
		[Inject("healthReportSetDao")]
		public var healthReportSetDao:HealthReportSetDao;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:HealthReportSetEvent):AsyncToken
		{
			log.debug("[健康报告分类设置]:健康报告Tree cmd捕获事件...");
			return healthReportSetDao.getHealthTreeInfo();
		}

		public function result(data:Object):void
		{
			log.debug("[健康报告分类设置] result info ...");
			log.debug(data);
			healthReportSetDM.healthTreeData = new XML(data);
			log.debug(healthReportSetDM.healthTreeData);
			var e:HealthReportSetEvent = new HealthReportSetEvent(HealthReportSetEvent.SHOW_HEALTH_REPORT_TREE);
			msgDispatcher(e);

		}

		public function error(f:Fault):void
		{
			log.error("[健康报告分类设置]:健康报告Tree cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}