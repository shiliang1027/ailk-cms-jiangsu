package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustSceneDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * 
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2013-5-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadUserInSqlBycustIdCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadUserInSqlBycustIdCmd);
		
		[Inject]
		public var dm:CustSceneDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		[Inject]
		public var dao:CustSceneDao;
		
		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("加载使用客户SQL参数");
			log.info(e.param);
			return dao.getUsersInSQLByCustId(e.param);
		}
		
		
		public function result(data:Object):void
		{
			log.info("加载使用客户SQL返回值");
			log.info(data);
			dm.userInSql=String(data);
		}
		
		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
		}
	}
}