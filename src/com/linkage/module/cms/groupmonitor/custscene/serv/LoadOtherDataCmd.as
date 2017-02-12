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
	 * @date 2012-10-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadOtherDataCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadOtherDataCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("加载客户对应的性能工单投诉工单信息的参数");
			log.info(e.param);
			return dao.loadDispaterData(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("客户对应的性能工单投诉工单信息返回值");
			log.info(data);
			dm.faultDispatchList.removeAll();
			dm.faultDispatchList.addAll(data.fault as IList);
			dm.faultDispatchList.refresh();
			dm.complaintDispatch.removeAll();
			dm.complaintDispatch.addAll(data.complaint as IList);
			dm.complaintDispatch.refresh();
		}

		public function result(data:Object):void
		{
			log.info("客户对应的性能工单投诉工单信息返回值");
			log.info(data);
			dm.faultDispatchList.removeAll();
			dm.faultDispatchList.addAll(data.fault as IList);
			dm.faultDispatchList.refresh();
			dm.complaintDispatch.removeAll();
			dm.complaintDispatch.addAll(data.complaint as IList);
			dm.complaintDispatch.refresh();
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result={"fault": new ArrayCollection([{"id": "1", "cityName": "nanjing", "dispatchId": "0100", "dispatchTip": "工单主题", "sendTime": "2012-09-09", "overTime": "2012-09-13", "alarmClearTime": "2012-09-09", "alarmLevel": "一级"}, {"id": "2", "cityName": "nanjing", "dispatchId": "0100", "dispatchTip": "工单主题", "sendTime": "2012-09-09", "overTime": "2012-09-13", "alarmClearTime": "2012-09-09", "alarmLevel": "一级"}, {"id": "3", "cityName": "nanjing", "dispatchId": "0100", "dispatchTip": "工单主题", "sendTime": "2012-09-09", "overTime": "2012-09-13", "alarmClearTime": "2012-09-09", "alarmLevel": "一级"}, {"id": "4", "cityName": "nanjing", "dispatchId": "0100", "dispatchTip": "工单主题", "sendTime": "2012-09-09", "overTime": "2012-09-13", "alarmClearTime": "2012-09-09", "alarmLevel": "一级"}]), "complaint": new ArrayCollection([{"id": "1", "cityName": "nanjing", "dispatchId": "0100", "dispatchTip": "工单主题", "sendTime": "2012-09-09", "overTime": "2012-09-13"}, {"id": "2", "cityName": "nanjing", "dispatchId": "0100", "dispatchTip": "工单主题", "sendTime": "2012-09-09", "overTime": "2012-09-13"}, {"id": "3", "cityName": "nanjing", "dispatchId": "0100", "dispatchTip": "工单主题", "sendTime": "2012-09-09", "overTime": "2012-09-13"}, {"id": "4", "cityName": "nanjing", "dispatchId": "0100", "dispatchTip": "工单主题", "sendTime": "2012-09-09", "overTime": "2012-09-13"}])};
				test(result);
			}
		}
	}
}