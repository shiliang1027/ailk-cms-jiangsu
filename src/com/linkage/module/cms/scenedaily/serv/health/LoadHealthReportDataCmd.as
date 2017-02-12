package com.linkage.module.cms.scenedaily.serv.health
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.health.HealthReportDao;
	import com.linkage.module.cms.scenedaily.domain.health.HealthReportDM;
	import com.linkage.module.cms.scenedaily.event.health.HealthReportEvent;
	import com.linkage.module.cms.scenedaily.serv.medicalcard.LoadMedicalCardDataCmd;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadHealthReportDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadHealthReportDataCmd);

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("healthReportDM")]
		public var dm:HealthReportDM;

		[Inject("healthReportDao")]
		public var dao:HealthReportDao;
        
		public function execute(e:HealthReportEvent):AsyncToken
		{
			log.info("调用加载健康报告方法传入参数");
			log.info(e.param);
			return dao.getHealthReport(e.param);
		}

		public function result(data:Object):void
		{
			if (data.gmsKpi)
			{
				log.info(data.gmsKpi);
			}
			else
			{
				log.info("gmsKpi no data");
			}
			if (data.gmsSum)
			{
				log.info(data.gmsSum);
			}
			else
			{
				log.info("gmsSum no data");
			}
			if (data.tdKpi)
			{
				log.info(data.tdKpi);
			}
			else
			{
				log.info("tdKpi no data");
			}
			if (data.tdSum)
			{
				log.info(data.tdSum);
			}
			else
			{
				log.info("tdSum no data");
			}
			dm.gsmKpiList.removeAll();
			dm.gsmKpiList.addAll(data.gmsKpi as IList);
			dm.gsmKpiList.refresh();
			dm.gsmSumList.removeAll();
			dm.gsmSumList.addAll(data.gmsSum as IList);
			dm.gsmSumList.refresh();
			dm.tdKpiList.removeAll();
			dm.tdKpiList.addAll(data.tdKpi as IList);
			dm.tdKpiList.refresh();
			dm.tdSumList.removeAll();
			dm.tdSumList.addAll(data.tdSum as IList);
			dm.tdSumList.refresh();
			dispatchMsg(new HealthReportEvent(HealthReportEvent.LOAD_HEALTHREPORT_DATA_COMP));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			Alert.show("加载表格数据错误");
		}

	}
}