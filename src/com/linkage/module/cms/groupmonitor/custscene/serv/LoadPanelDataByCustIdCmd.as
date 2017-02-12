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
	 * @date 2012-10-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadPanelDataByCustIdCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadPanelDataByCustIdCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("初始化面板参数");
			log.info(e.param);
			return dao.queryTotalInfoByCustNo(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("初始化左面板返回值");
			log.info(data.custserv);
			log.info("初始化右面板返回值");
			log.info(data.city);
			dm.panelLeftList.removeAll();
			dm.panelLeftList.addAll(data.custserv as IList);
			dm.panelLeftList.refresh();
			dm.panelRightList.removeAll();
			dm.panelRightList.addAll(data.city as IList);
			dm.panelRightList.refresh();
		}

		public function result(data:Object):void
		{
			log.info("初始化左面板返回值");
			log.info(data.custserv);
			log.info("初始化右面板返回值");
			log.info(data.city);
			dm.panelLeftList.removeAll();
			dm.panelLeftList.addAll(data.custserv as IList);
			dm.panelLeftList.refresh();
			dm.panelRightList.removeAll();
			dm.panelRightList.addAll(data.city as IList);
			dm.panelRightList.refresh();
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result=new ArrayCollection();
				test(result);
			}
		}
	}
}