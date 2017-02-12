package com.linkage.module.cms.scenedaily.serv.medicalcard
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.event.medicalcard.MedicalCardEvent;
	import com.linkage.module.cms.scenedaily.view.components.util.FileUpDownLoad;

	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MedicalCardServ
	{
		private var log:ILogger=Log.getLoggerByClass(MedicalCardServ);

		private var fileRefer:FileReference=new FileReference();
		private var fileUpDownLoad:FileUpDownLoad;

		[Inject("user")]
		public var user:IUser;


		[MessageHandler(selector="exportMedicalCardData")]
		public function export(event:MedicalCardEvent):void
		{
			log.info("export param");
			var fileType:FileFilter=new FileFilter("Excel", "*.xls");
			var fileTypes:Array=new Array(fileType);
			fileUpDownLoad=new FileUpDownLoad();
			var downLoadUrl:URLRequest=new URLRequest("/cms/scenedaily/gis/exportCaseAction!exportCase.action");
			var downLoadData:URLVariables=new URLVariables();
			downLoadData.type="1";
			downLoadData.caseTimeType=event.param.caseTimeType;
			downLoadData.startTime=event.param.startTime;
			downLoadData.endTime=event.param.endTime;
			downLoadData.cityId=user.cityId;
			downLoadData.perfTypeId=user.kpiId;
			downLoadData.moTypeId=user.moTypeId;
//			downLoadData.stateTime = user.gatherTime;
//			downLoadData.timeGranular = user.interval;

			if (event.param.flag && event.param.flag == "1")
			{
				downLoadData.resType="1";
				downLoadData.stateTime=event.param.stateTime;
				downLoadData.timeGranular=event.param.timeGranular;
			}
			else
			{
				downLoadData.resType="3";
				downLoadData.stateTime=user.gatherTime;
				downLoadData.timeGranular=user.interval;
				downLoadData.resId=event.param.resId;
			}

//			if (event.param)
//				downLoadData.resId=event.param.resId;
//			else
//				downLoadData.resId=user.resId;

			log.debug(event.param);
			log.debug(user);
			downLoadUrl.data=downLoadData;
			fileUpDownLoad.downLoadURLRequest=downLoadUrl;
			fileUpDownLoad.fileFilters=fileTypes;
			fileUpDownLoad.downLoad();
			log.info("export send");
		}

	}
}

