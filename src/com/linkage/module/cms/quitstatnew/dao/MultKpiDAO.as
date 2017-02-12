package com.linkage.module.cms.quitstatnew.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.domain.IUser;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-10-25
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MultKpiDAO implements IMultKpiDAO
	{
		private var log:ILogger = Log.getLoggerByClass(QuitStatDAO);
		
		[Inject("remoteObject")]
		public var rmtObj:RemoteObject;
		[Inject("user")]
		public var user:IUser;
		
		public function MultKpiDAO()
		{
		}
		
		public function getThresHoldRenderConfig(param:Object):AsyncToken
		{
			return rmtObj.getThresHoldRenderConfig(user);
		}
		
		public function saveThresHoldRenderConfig(param:Object):AsyncToken
		{
			return rmtObj.saveThresHoldRenderConfig(user,param);
		}
	}
}