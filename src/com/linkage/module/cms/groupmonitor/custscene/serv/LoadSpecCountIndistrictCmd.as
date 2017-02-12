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
	 * @date 2013-3-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadSpecCountIndistrictCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadSpecCountIndistrictCmd);

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
			return dao.getAreaUserCustData(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("加载使用客户分布信息返回值");
			log.info(data);
			dm.disSpecNumList.removeAll();
			dm.disSpecNumList.addAll(data as IList);
			dm.disSpecNumList.refresh();
			dispatchMsg(new CustSceneEvent(CustSceneEvent.LOAD_SPECOUNT_INDISTRICT_COMP));
		}

		public function result(data:Object):void
		{
			log.info("加载使用客户分布信息返回值");
			log.info(data);
			dm.disSpecNumList.removeAll();
			dm.disSpecNumList.addAll(data as IList);
			dm.disSpecNumList.refresh();
			dispatchMsg(new CustSceneEvent(CustSceneEvent.LOAD_SPECOUNT_INDISTRICT_COMP));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=true;
			if (isTest)
			{
				var result:Object;
				result=new ArrayCollection([{"districtName": "A1区县", "districtId": "1", "count": "2"}, {"districtName": "A2区县", "districtId": "1", "count": "2"}, {"districtName": "A3区县", "districtId": "1", "count": "2"}, {"districtName": "A4区县", "districtId": "1", "count": "2"}, {"districtName": "A5区县", "districtId": "1", "count": "2"}, {"districtName": "A6区县", "districtId": "1", "count": "2"}, {"districtName": "A7区县", "districtId": "1", "count": "2"}, {"districtName": "A8区县", "districtId": "1", "count": "2"}, {"districtName": "A9区县", "districtId": "1", "count": "2"}, {"districtName": "A10区县", "districtId": "1", "count": "2"}, {"districtName": "A11区县", "districtId": "1", "count": "2"}, {"districtName": "A12区县", "districtId": "1", "count": "2"}]);
				test(result);
			}
		}
	}
}