package com.linkage.module.cms.scenedaily.serv.setface
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.setface.SetFaceDao;
	import com.linkage.module.cms.scenedaily.domain.setface.SetFaceDM;
	import com.linkage.module.cms.scenedaily.event.setface.SetFaceEvent;

	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-3
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadHealthSetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadHealthSetCmd);

		[Inject("setFaceDM")]
		public var dm:SetFaceDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("setFaceDao")]
		public var dao:SetFaceDao;

		public function execute(e:SetFaceEvent):AsyncToken
		{
			return dao.loadHealthSetData();
		}

		//test
		public function test(data:Object):void
		{
			log.info("基本设置返回值");
			log.info(data);
			dm.healthSetMap = data;
			dispatchMsg(new SetFaceEvent(SetFaceEvent.LOAD_HEALTHSET_DATA_COMP));
		}

		public function result(data:Object):void
		{
			log.info("基本设置返回值");
			log.info(data);
			dm.healthSetMap = data;
			dispatchMsg(new SetFaceEvent(SetFaceEvent.LOAD_HEALTHSET_DATA_COMP));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			Alert.show("查询数据失败");

			var isTest:Boolean = true;
			if (isTest)
			{
				var result:Object;
				result = {"day": {"health1": "24", "health2": "1", "health3": "1", "health4": "1", "health5": "1", "subhealth1": "23", "subhealth2": "2", "subhealth3": "2", "subhealth4": "2", "subhealth5": "2", "nohealth1": "22", "nohealth2": "3", "nohealth3": "3", "nohealth4": "3", "nohealth5": "3", "prehealth1": "25", "prehealth2": "4", "prehealth3": "4", "prehealth4": "4", "prehealth5": "4", "presubhealth1": "26", "presubhealth2": "5", "presubhealth3": "5", "presubhealth4": "5", "presubhealth5": "5", "presubhealthand1": "27", "presubhealthand2": "1", "presubhealthand3": "6", "presubhealthand4": "1", "presubhealthand5": "6", "prenohealth1": "28", "prenohealth2": "2", "prenohealth3": "7", "prenohealth4": "2", "prenohealth5": "7"}, "week": {"health1": "24", "health2": "4", "health3": "3", "health4": "5", "health5": "1", "subhealth1": "24", "subhealth2": "4", "subhealth3": "3", "subhealth4": "5", "subhealth5": "1", "nohealth1": "24", "nohealth2": "4", "nohealth3": "3", "nohealth4": "5", "nohealth5": "1", "prehealth1": "24", "prehealth2": "4", "prehealth3": "3", "prehealth4": "5", "prehealth5": "1", "presubhealth1": "24", "presubhealth2": "4", "presubhealth3": "3", "presubhealth4": "5", "presubhealth5": "1", "presubhealthand1": "24", "presubhealthand2": "4", "presubhealthand3": "3", "presubhealthand4": "5", "presubhealthand5": "1", "prenohealth1": "24", "prenohealth2": "4", "prenohealth3": "3", "prenohealth4": "5", "prenohealth5": "1"}, "month": {"health1": "24", "health2": "4", "health3": "3", "health4": "5", "health5": "1", "subhealth1": "24", "subhealth2": "4", "subhealth3": "3", "subhealth4": "5", "subhealth5": "1", "nohealth1": "24", "nohealth2": "4", "nohealth3": "3", "nohealth4": "5", "nohealth5": "1", "prehealth1": "24", "prehealth2": "4", "prehealth3": "3", "prehealth4": "5", "prehealth5": "1", "presubhealth1": "24", "presubhealth2": "4", "presubhealth3": "3", "presubhealth4": "5", "presubhealth5": "1", "presubhealthand1": "24", "presubhealthand2": "4", "presubhealthand3": "3", "presubhealthand4": "5", "presubhealthand5": "1", "prenohealth1": "24", "prenohealth2": "", "prenohealth3": "3", "prenohealth4": "5", "prenohealth5": "1"}};
				test(result);
			}
		}
	}
}