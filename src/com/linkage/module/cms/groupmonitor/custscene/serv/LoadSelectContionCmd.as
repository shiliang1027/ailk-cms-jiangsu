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
	 * @date 2013-4-9
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadSelectContionCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadSelectContionCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info(e.param);
			return dao.getSelects();
		}

		public function result(data:Object):void
		{
			log.info("选择条件返回值");
			log.info(data.citys);
			log.info(data.industry);
			log.info(data.userLvl);
			log.info(data.servLvl);
			dm.cityList.removeAll();
			dm.cityList.addItem({"cityId": "ALL", "cityName": "ALL"});
			dm.cityList.addAll(data.citys as IList);
			dm.cityList.refresh();

			dm.industryList.removeAll();
			dm.industryList.addItem({"industry": "ALL"});
			dm.industryList.addAll(data.industry as IList);
			dm.industryList.refresh();

			dm.userLvl.removeAll();
			dm.userLvl.addItem({"userLvlId": "ALL", "userLvlName": "ALL"});
			dm.userLvl.addAll(data.userLvl as IList);
			dm.userLvl.refresh();

			dm.servLvl.removeAll();
			dm.servLvl.addItem({"servLvlId": "ALL", "servLvlName": "ALL"});
			dm.servLvl.addAll(data.servLvl as IList);
			dm.servLvl.refresh();
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
		}
	}
}