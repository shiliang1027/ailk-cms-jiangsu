package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustSceneDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;

	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2013-4-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ModifyCustNameCmd
	{
		private var log:ILogger=Log.getLoggerByClass(ModifyCustNameCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("修改名字参数");
			log.info(e.param);
			return dao.updateUserName(e.param);
		}


		public function result(data:Object):void
		{
			log.info("保存配置客户返回值");
			log.info(data);
			if ("1" == data.toString())
			{
				Alert.show("修改客户名字成功,请重新刷新本页面使修改生效");
			}
			else
			{
				Alert.show("修改失败");
			}
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
		}
	}
}