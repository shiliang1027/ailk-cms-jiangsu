package com.linkage.module.cms.scenedaily.serv.setface
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.setface.SetFaceDao;
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
	public class SaveHealthSetDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SaveBaseSetDataCmd);

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("setFaceDao")]
		public var dao:SetFaceDao;

		public function execute(e:SetFaceEvent):AsyncToken
		{
			log.info("调用保存健康算法设置方法传入参数");
			log.info(e.param);
			return dao.saveHealthSetData(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("调用保存健康算法设置方法返回值");
			log.info(data);
			if ("yes" == data)
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
			log.info("调用保存健康算法设置方法返回值");
			if ("yes" == String(data))
			{
				log.info("success");
				Alert.show("保存成功");
			}
			else
			{
				log.info("fail");
				Alert.show("保存失败");
			}
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			Alert.show("保存失败");

			var isTest:Boolean = true;
			if (isTest)
			{
				var result:Object;
				result = {"success": "yes"};
				test(result);
			}

		}
	}
}