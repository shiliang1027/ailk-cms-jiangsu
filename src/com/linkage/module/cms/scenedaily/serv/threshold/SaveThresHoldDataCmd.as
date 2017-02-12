package com.linkage.module.cms.scenedaily.serv.threshold
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.threshold.ThresHoldDao;
	import com.linkage.module.cms.scenedaily.domain.threshold.ThresHoldDM;
	import com.linkage.module.cms.scenedaily.event.threshold.ThresHoldEvent;

	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SaveThresHoldDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SaveThresHoldDataCmd);

		[Inject("thresHoldDM")]
		public var dm:ThresHoldDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("thresHoldDao")]
		public var dao:ThresHoldDao;

		public function execute(e:ThresHoldEvent):AsyncToken
		{
			log.info("保存阈值参数");
			log.info(e.param);
			return dao.saveThreshold(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("保存阈值返回值");
			log.info(data);
			if ("0" == String(data))
			{
				Alert.show("保存成功");
			}
			else
			{
				Alert.show("保存失败");
			}

		}

		public function result(data:Object):void
		{
			log.info("保存阈值返回值");
			log.info(data);
			if ("0" == String(data))
			{
				Alert.show("保存成功");
			}
			else
			{
				Alert.show("保存失败");
			}
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			Alert.show("保存失败");

			var isTest:Boolean = false;
			if (isTest)
			{
				var result:Object;
				result = {"success": "yes"};
				test(result);
			}
		}
	}
}