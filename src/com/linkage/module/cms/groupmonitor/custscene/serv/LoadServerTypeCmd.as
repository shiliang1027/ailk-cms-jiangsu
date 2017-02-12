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
	 * @date 2012-10-15
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadServerTypeCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadServerTypeCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("服务类型参数");
			log.info(e.param);
			return dao.getServByCust(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("服务类型返回值");
			log.info(data);
			dm.realServTypeBar.removeAll();
			dm.realServTypeBar.addAll(data as IList);
			dm.realServTypeBar.refresh();
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_SERVER_TYPE_BY_CUSTID_COMP);
			evt.param=data;
			dispatchMsg(evt);
		}

		public function result(data:Object):void
		{
			log.info("服务类型返回值");
			log.info(data);
			dm.realServTypeBar.removeAll();
			dm.realServTypeBar.addAll(data as IList);
			dm.realServTypeBar.refresh();
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_SERVER_TYPE_BY_CUSTID_COMP);
			evt.param=data;
			dispatchMsg(evt);
//			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_KPI_GROUP_BY_CUST_ID);
//			evt.param.servTypeId=dm.realServTypeBar[0].serv_type_id;
//			dispatchMsg(evt);
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result=new ArrayCollection([{"cust_serv_type_name": "专线网络", "serv_type_id": "11"}, {"cust_serv_type_name": "小区网络", "serv_type_id": "22"}]);
				test(result);
			}
		}
	}
}