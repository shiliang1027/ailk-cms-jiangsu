package com.linkage.module.cms.scenedaily.serv.medicalcard
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.health.HealthReportDao;
	import com.linkage.module.cms.scenedaily.domain.medicalcard.MedicalCardDM;
	import com.linkage.module.cms.scenedaily.event.medicalcard.MedicalCardEvent;

	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadMedicalCardDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadMedicalCardDataCmd);

		[Inject("medicalCardDM")]
		public var dm:MedicalCardDM;

		[Inject("healthReportDao")]
		public var dao:HealthReportDao;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:MedicalCardEvent):AsyncToken
		{
			log.info("调用加载病历卡方法传入参数");
			log.info(e.param);
			return dao.getCaseCard(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("调用加载病历卡方法返回结果");
			if (data.baseData)
			{
				log.info(data.baseData);
			}
			else
			{
				log.info("baseData no data");
			}

			if (data.badData)
			{
				log.info(data.badData);
			}
			else
			{
				log.info("badData no data");
			}

			if (data.projectData)
			{
				log.info(data.projectData);
			}
			else
			{
				log.info("projectData no data");
			}

			if (data.alarmData)
			{
				log.info(data.alarmData);
			}
			else
			{
				log.info("alarmData no data");
			}
			if (data.title)
			{
				dm.title = data.title;
			}
			dm.baseDataMap = data.baseData;
			dm.badDataList.removeAll();
			dm.badDataList.addAll(data.badData as IList);
			dm.badDataList.refresh();
			dm.projectDataList.removeAll();
			dm.projectDataList.addAll(data.projectData as IList);
			dm.projectDataList.refresh();
			dm.alarmDataList.removeAll();
			dm.alarmDataList.addAll(data.alarmData as IList);
			dm.alarmDataList.refresh();
		}

		public function result(data:Object):void
		{
			log.info("调用加载病历卡方法返回结果");
			if (data.baseData)
			{
				log.info(data.baseData);
			}
			else
			{
				log.info("baseData no data");
			}

			if (data.badData)
			{
				log.info(data.badData);
			}
			else
			{
				log.info("badData no data");
			}

			if (data.projectData)
			{
				log.info(data.projectData);
			}
			else
			{
				log.info("projectData no data");
			}

			if (data.alarmData)
			{
				log.info(data.alarmData);
			}
			else
			{
				log.info("alarmData no data");
			}
			if (data.title)
			{
				dm.title = data.title;
			}
			dm.baseDataMap = data.baseData;

			dm.badDataList.removeAll();
			dm.badDataList.addAll(data.badData as IList);
			dm.badDataList.refresh();

			dm.projectDataList.removeAll();
			dm.projectDataList.addAll(data.projectData as IList);
			dm.projectDataList.refresh();

			dm.alarmDataList.removeAll();
			dm.alarmDataList.addAll(data.alarmData as IList);
			dm.alarmDataList.refresh();
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
		}
	}
}

