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
	public class QueryCustByConCmd
	{
		private var log:ILogger=Log.getLoggerByClass(QueryCustByConCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("根据条件查集团客户参数");
			log.info(e.param);
			return dao.queryGroupUsers(e.param);
		}


		public function result(data:Object):void
		{
			log.info("根据条件查集团客户返回值");
			log.info(data.users);
			log.info(data.selectedUsers);
			dm.usersList.removeAll();
			dm.usersList.addAll(data.users as IList);
			dm.usersList.refresh();

			dm.selUsersList.removeAll();
			dm.selUsersList.addAll(data.selectedUsers as IList);
			dm.selUsersList.refresh();
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
		}
	}
}