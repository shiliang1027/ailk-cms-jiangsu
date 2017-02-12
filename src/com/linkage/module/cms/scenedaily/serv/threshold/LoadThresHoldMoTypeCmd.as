package com.linkage.module.cms.scenedaily.serv.threshold
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.threshold.ThresHoldDao;
	import com.linkage.module.cms.scenedaily.domain.threshold.ThresHoldDM;
	import com.linkage.module.cms.scenedaily.event.threshold.ThresHoldEvent;

	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-9
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadThresHoldMoTypeCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadThresHoldMoTypeCmd);

		[Inject("thresHoldDM")]
		public var dm:ThresHoldDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("thresHoldDao")]
		public var dao:ThresHoldDao;

		public function execute(e:ThresHoldEvent):AsyncToken
		{
			log.info("加载网元类型参数");
			log.info(e.param);
			return dao.getMoTypeNames(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("加载网元类型返回值");
			log.info(data);
			var evt:ThresHoldEvent = new ThresHoldEvent(ThresHoldEvent.LOAD_THRESHOLD_MOTYPE_COMP);
			evt.param = data;
			dispatchMsg(evt);
		}

		public function result(data:Object):void
		{
			log.info("加载网元类型返回值");
			log.info(data);
			var evt:ThresHoldEvent = new ThresHoldEvent(ThresHoldEvent.LOAD_THRESHOLD_MOTYPE_COMP);
			evt.param = data;
			dispatchMsg(evt);

		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			var isTest:Boolean = false;
			if (isTest)
			{
				var result:Object;
				result = new ArrayCollection([{"moTypeId": "16", "moTypeName": "BSC"}, {"moTypeId": "15", "moTypeName": "Abc"}, {"moTypeId": "14", "moTypeName": "cdd"}, {"moTypeId": "13", "moTypeName": "mm"}, {"moTypeId": "12", "moTypeName": "ff"}]);
				test(result);
			}
		}
	}
}