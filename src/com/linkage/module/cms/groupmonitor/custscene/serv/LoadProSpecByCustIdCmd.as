package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustSceneDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;

	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2013-4-10
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadProSpecByCustIdCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadProSpecByCustIdCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("加载省级跨地市专线参数");
			log.info(e.param);
			return dao.getOverCitySpec(e.param);
		}

		public function result(data:Object):void
		{
			log.info("加载省级跨地市专线返回值");
			log.info(data);
			dm.proOverCitySpecList.removeAll();
			dm.proOverCitySpecList.addAll(data as IList);
			dm.proOverCitySpecList.refresh();
			dispatchMsg(new CustSceneEvent(CustSceneEvent.LOAD_PRO_SPEC_BYCUSTID_COMP));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
		}
	}
}