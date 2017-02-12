package com.linkage.module.cms.quitstatnew.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.domain.IUser;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class QuotaConfigDAO implements IQuotaConfigDAO
	{
		private var log:ILogger = Log.getLoggerByClass(QuotaConfigDAO);

		[Inject("remoteObject")]
		public var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		//获取列表数据
		public function getShConfig():AsyncToken
		{
			log.info("获取[显隐配置]调用java接口getShConfig参数如下");
			log.info("name:{0}", user.account);
			return rmtObj.getShConfig(user);
		}

		public function saveShConfig(dataList:ArrayCollection):AsyncToken
		{
			log.info("获取[显隐配置]调用java接口saveShConfig参数如下");
			log.info("name:{0}", user.account);
			log.info(dataList);
			return rmtObj.saveShConfig(user, dataList);
		}
	}
}