package com.linkage.module.cms.scenedaily.serv.threshold
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.threshold.ThresHoldDao;
	import com.linkage.module.cms.scenedaily.domain.threshold.ThresHoldDM;
	import com.linkage.module.cms.scenedaily.event.threshold.ThresHoldEvent;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-6
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadThresHoldValuesCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadThresHoldKpiNameCmd);

		[Inject("thresHoldDM")]
		public var dm:ThresHoldDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("thresHoldDao")]
		public var dao:ThresHoldDao;

		public function execute(e:ThresHoldEvent):AsyncToken
		{
			log.info("获取阈值参数");
			log.info(e.param);
			return dao.getThreshold(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("获取阈值返回值");
			log.info(data);
			var evt:ThresHoldEvent = new ThresHoldEvent(ThresHoldEvent.LOAD_THRESHOLD_VALUES_COMP);
			evt.param = data;
			dispatchMsg(evt);

		}

		public function result(data:Object):void
		{
			log.info("获取阈值返回值");
			log.info(data);
			var evt:ThresHoldEvent = new ThresHoldEvent(ThresHoldEvent.LOAD_THRESHOLD_VALUES_COMP);
			evt.param = data;
			dispatchMsg(evt);
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			Alert.show("加载阈值数据失败");

			var isTest:Boolean = false;
			if (isTest)
			{
				var result:Object;
				result = new ArrayCollection([{"res_id": "1", "res_type": "1", "timetype": "1", "perf_type_id": "1", "mo_type_id": "1", "index_id": "1", "up_oper": "1", "up_threshold": "50", "down_oper": "4", "down_threshold": "60", "isalarm": "0", "warning_level": "2", "rendingcolor": "0xff444"}, {"res_id": "1", "res_type": "1", "timetype": "1", "perf_type_id": "1", "mo_type_id": "1", "index_id": "2", "up_oper": "1", "up_threshold": "50", "down_oper": "5", "down_threshold": "60", "isalarm": "0", "warning_level": "3", "rendingcolor": "0xff444"}, {"res_id": "1", "res_type": "1", "timetype": "1", "perf_type_id": "1", "mo_type_id": "1", "index_id": "3", "up_oper": "1", "up_threshold": "50", "down_oper": "4", "down_threshold": "60", "isalarm": "0", "warning_level": "2", "rendingcolor": "0xff444"}]);
				test(result);
			}
		}
	}
}