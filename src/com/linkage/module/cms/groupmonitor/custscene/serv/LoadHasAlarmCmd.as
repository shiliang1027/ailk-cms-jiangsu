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
	 * @date 2012-10-24
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadHasAlarmCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadHasAlarmCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("查询是否有告警参数");
			log.info(e.param);
			return dao.queryAlarmByIds(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("查询是否有告警返回值");
			log.info(data);
			dm.hasAlarmList.removeAll();
			dm.hasAlarmList.addAll(data as IList);
			dm.hasAlarmList.refresh();
			dispatchMsg(new CustSceneEvent(CustSceneEvent.QUERY_HAS_ALARM_COMP));
		}

		public function result(data:Object):void
		{
			log.info("查询是否有告警返回值");
			log.info(data);
			dm.hasAlarmList.removeAll();
			dm.hasAlarmList.addAll(data as IList);
			dm.hasAlarmList.refresh();
			dispatchMsg(new CustSceneEvent(CustSceneEvent.QUERY_HAS_ALARM_COMP));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result=new ArrayCollection([{"custno": "1419022003206076", "hasalarm": "4"}, {"custno": "1", "hasalarm": "0"}, {"custno": "2", "hasalarm": "1"}, {"custno": "3", "hasalarm": "2"}, {"custno": "4", "hasalarm": "3"}, {"custno": "5", "hasalarm": "4"}]);
				test(result);
			}
		}
	}
}