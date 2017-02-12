package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustSceneDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;

	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-15
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadKpiGroupCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadKpiGroupCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("加载指标参数");
			log.info(e.param);
			//return dao.loadKpiGroupBySver(e.param);
			return dao.getServertarget(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("加载指标返回值");
			log.info(data);
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_KPI_GROUP_BY_CUST_ID_COMP);
			evt.param=data;
			dispatchMsg(evt);
		}

		public function result(data:Object):void
		{
			log.info("加载指标返回值");
			log.info(data);
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_KPI_GROUP_BY_CUST_ID_COMP);
			evt.param=data;
			dispatchMsg(evt);
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result=new ArrayCollection([{"showName": "接通率", "perfTypeId": "1", "perf_algorithm": "2"}, {"showName": "呼叫次数", "perfTypeId": "2", "perf_algorithm": "2"}, {"showName": "接通率", "perfTypeId": "3", "perf_algorithm": "2"}, {"showName": "呼叫次数", "perfTypeId": "4", "perf_algorithm": "2"}, {"showName": "接通率", "perfTypeId": "5", "perf_algorithm": "2"}, {"showName": "呼叫次数", "perfTypeId": "6", "perf_algorithm": "2"}, {"showName": "接通率", "perfTypeId": "7", "perf_algorithm": "2"}, {"showName": "呼叫次数", "perfTypeId": "8", "perf_algorithm": "2"}, {"showName": "接通率", "perfTypeId": "9", "perf_algorithm": "2"}, {"showName": "呼叫次数", "perfTypeId": "10", "perf_algorithm": "2"}]);
				test(result);
			}
		}
	}
}