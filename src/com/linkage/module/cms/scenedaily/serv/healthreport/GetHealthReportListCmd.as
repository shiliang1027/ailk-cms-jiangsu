package com.linkage.module.cms.scenedaily.serv.healthreport
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.gis.core.ILayer;
	import com.linkage.module.cms.scenedaily.dao.healthreport.HealthReportSetDao;
	import com.linkage.module.cms.scenedaily.dao.impkpi.ImpProKpiDao;
	import com.linkage.module.cms.scenedaily.domain.healthreport.HealthReportSetDM;
	import com.linkage.module.cms.scenedaily.event.healthreport.HealthReportSetEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
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
	public class GetHealthReportListCmd
	{

		private var log:ILogger = Log.getLoggerByClass(GetHealthReportListCmd);
		[Inject("healthReportSetDM")]
		public var healthReportSetDM:HealthReportSetDM;
		[Inject("healthReportSetDao")]
		public var healthReportSetDao:HealthReportSetDao;

		public function execute(e:HealthReportSetEvent):AsyncToken
		{
			log.debug("[健康报告分类设置]:健康报告结果集 cmd捕获事件...");
			log.debug("[健康报告分类设置]:e.treeNodeId=" + e.treeNodeId + ",e.kpiTypeId=" + e.kpiTypeId);
			return healthReportSetDao.getHealthKpiByCond(e.treeNodeId, e.kpiTypeId);
		}

		public function result(data:Object):void
		{
//			var kpiResultData1:ArrayCollection = new ArrayCollection([{kpiId: "101", "isSelected": "1", "kpiName": "test101"}, {kpiId: "102", "isSelected": "0", "kpiName": "test102"}]);
//			var kpiResultData2:ArrayCollection = new ArrayCollection([{kpiId: "201", "isSelected": "0", "kpiName": "test201"}, {kpiId: "202", "isSelected": "1", "kpiName": "test202"}]);
//			var kpiResultData3:ArrayCollection = new ArrayCollection([{kpiId: "301", "isSelected": "1", "kpiName": "test301"}, {kpiId: "302", "isSelected": "0", "kpiName": "test302"}]);
//			var kpiResultData4:ArrayCollection = new ArrayCollection([{kpiId: "401", "isSelected": "0", "kpiName": "test401"}, {kpiId: "402", "isSelected": "1", "kpiName": "test402"}]);
//			if (e.kpiTypeId == "1")
//			{
//				healthReportSetDM.healthReportInfo = kpiResultData1;
//			}
//			if (e.kpiTypeId == "2")
//			{
//				healthReportSetDM.healthReportInfo = kpiResultData2;
//			}
//			if (e.kpiTypeId == "3")
//			{
//				healthReportSetDM.healthReportInfo = kpiResultData3;
//			}
//			if (e.kpiTypeId == "4")
//			{
//				healthReportSetDM.healthReportInfo = kpiResultData4;
//			}
			log.debug("[健康报告分类设置]: result info ...");
			log.debug(data);
			healthReportSetDM.healthReportInfo.removeAll();
			healthReportSetDM.healthReportInfo.addAll(data as IList);
			healthReportSetDM.healthReportInfo.refresh();
			log.debug(healthReportSetDM.healthReportInfo);
		}

		public function error(f:Fault):void
		{
			log.error("[健康报告分类设置]:健康报告结果集 cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}