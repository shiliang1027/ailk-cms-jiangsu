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
	 * @date 2012-8-28
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ThresHoldDyeDAO implements IThresHoldDyeDAO
	{
		private var log:ILogger = Log.getLoggerByClass(ThresHoldDyeDAO);

		[Inject("remoteObject")]
		public var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		//获取列表数据
		public function getThresHoldConfig():AsyncToken
		{
			log.info("获取[指标阈值配置]调用java接口getThresHoldConfig参数如下");
			log.info("登录名:{0}", user.account);
			return rmtObj.getThresHoldConfig(user, "");
		}

		public function saveTresHoldConfig(name:String, dataList:ArrayCollection):AsyncToken
		{
			log.info(" 保存[指标阈值配置]调用java接口saveTresHoldConfig参数如下");
			log.info("登录名:{0},指标:{1},阈值配置：", user.account, name);
			log.info(dataList);
			return rmtObj.saveThresHoldConfig(user, name, dataList);
		}
	}
}