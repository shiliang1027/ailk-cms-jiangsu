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
	public class SaveHealthReportCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SaveHealthReportCmd);
		[Inject("healthReportSetDM")]
		public var healthReportSetDM:HealthReportSetDM;
		[Inject("healthReportSetDao")]
		public var healthReportSetDao:HealthReportSetDao;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:HealthReportSetEvent):AsyncToken
		{
			log.debug("[健康报告分类设置]:保存健康设置 cmd捕获事件...");
			log.debug(e.saveHealthObj);
			return healthReportSetDao.saveHealthReportInfo(e.saveHealthObj);
		}

		public function result(data:Object):void
		{
			log.debug("[健康报告分类设置]:result info ...");
			log.debug(data);
			var e1:HealthReportSetEvent = new HealthReportSetEvent(HealthReportSetEvent.RETURN_HEALTH_REPORT_KPI_INFO);
			e1.returnInfo = data as String;
			msgDispatcher(e1);
		}

		public function error(f:Fault):void
		{
			log.error("[健康报告分类设置]:保存健康设置 cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}