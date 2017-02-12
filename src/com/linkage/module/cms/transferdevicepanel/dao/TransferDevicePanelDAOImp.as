package com.linkage.module.cms.transferdevicepanel.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2014-5-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class TransferDevicePanelDAOImp implements TransferDevicePanelDAO
	{
		private var log:ILogger=Log.getLoggerByClass(TransferDevicePanelDAOImp);
		[Inject("remoteObject")]
		public var rmtObj:RemoteObject;
		
		public function TransferDevicePanelDAOImp()
		{
		}
		public function getSlotData(param:Object):AsyncToken
		{
			return rmtObj.getSlotData(param);
		}
		
		public function getPtpData(param:Object):AsyncToken
		{
			return rmtObj.getPtpData(param);
		}
		
		public function getPropData(param:Object):AsyncToken
		{
			return rmtObj.getPropData(param);
		}
	}
}