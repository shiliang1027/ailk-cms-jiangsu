package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustSceneDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2013-1-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadUserCustByBigCustCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadUserCustByBigCustCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("根据大客户加载性能面板使用客户参数");
			log.info(e.param);
			return dao.loadUserKpiByGruoupCust(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("根据大客户加载性能面板使用客户返回值");
			log.info(data);
			dm.userCustForPerfList.removeAll();
			dm.userCustForPerfList.addAll(data as IList);
			dm.userCustForPerfList.refresh();
		}

		public function result(data:Object):void
		{
			log.info("根据大客户加载性能面板使用客户返回值");
			log.info(data);
			dm.userCustForPerfList.removeAll();
			dm.userCustForPerfList.addAll(data as IList);
			dm.userCustForPerfList.refresh();
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result=new ArrayCollection([{"name": "da kehu", "cust_id": "1419022003206076"}]);
				test(result);
			}
		}
	}
}