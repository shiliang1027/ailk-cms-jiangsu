package com.linkage.module.cms.roamtopic.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-12-16
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RoamTopicDAOImpl implements RoamTopicDAO
	{
		private var log:ILogger=Log.getLoggerByClass(RoamTopicDAOImpl);
		
		[Inject("remoteObject")]
		public var rmtObj:RemoteObject;

		/**
		 * 查询蛮有数据
		 * 
		 * @param param
		 * @return AsyncToken
		 * 
		 */
		public function queryRomTopicData(param:Object):AsyncToken{
			return rmtObj.getRoamDatas(param);
		}
		
		
		public function configParam(param:Object):AsyncToken{
			return rmtObj.getThreshold(param);
		}
		
		public function configSaveParam(param:Object):AsyncToken{
			return rmtObj.updateThreshold(param);
		}
	}
}