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
	 * @date 2013-1-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadUserCustCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadUserCustCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("加载使用客户分布信息参数");
			log.info(e.param);
			return dao.loadUserCust(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("加载使用客户分布信息返回值");
			log.info(data);
			dm.userCustList.removeAll();
			dm.userCustList.addAll(data as IList);
			dm.userCustList.refresh();
			dispatchMsg(new CustSceneEvent(CustSceneEvent.LOAS_USER_CUST_DATA_COMP));
		}

		public function result(data:Object):void
		{
			log.info("加载使用客户分布信息返回值");
			log.info(data);
			dm.userCustList.removeAll();
			dm.userCustList.addAll(data as IList);
			dm.userCustList.refresh();
			dispatchMsg(new CustSceneEvent(CustSceneEvent.LOAS_USER_CUST_DATA_COMP));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result=new ArrayCollection([{"custname": "da kehu", "custid": "1419022003206076", "isbig": "1", "cityId": "00"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0004"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0003"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0002"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0007"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0002"}, {"custname": "kehu00", "custid": "1", "isbig": "0", "cityId": "00"}, {"custname": "kehu00", "custid": "1", "isbig": "0", "cityId": "00"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0003"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0003"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0003"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0004"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0005"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0005"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0005"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0006"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0006"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0007"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0007"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0007"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0008"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0008"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0009"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0009"}, {"custname": "kehu1", "custid": "1", "isbig": "0", "cityId": "0010"}]);
				test(result);
			}
		}
	}
}