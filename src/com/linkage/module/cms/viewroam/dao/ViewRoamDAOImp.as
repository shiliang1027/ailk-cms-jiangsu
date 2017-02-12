package com.linkage.module.cms.viewroam.dao
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
	 * @date 2014-11-03
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ViewRoamDAOImp implements ViewRoamDAO
	{
		private var log:ILogger=Log.getLoggerByClass(ViewRoamDAOImp);
		
		[Inject("remoteObject")]
		public var rmtObj:RemoteObject;
		[Inject("remoteObjectResourceMoInfo")]
		public var remoteObjectResourceMoInfo:RemoteObject;
		
		/**
		 * 查询性能数据
		 * @param param(gather_time,mo_id,mo_name,port_num)
		 * @return AsyncToken
		 * 
		 */
		public function queryPerfs(param:Object):AsyncToken
		{
			return rmtObj.queryPerfs(param);
		}
		public function getworkStatForFlex(param:Object):AsyncToken
		{
			return remoteObjectResourceMoInfo.getworkStatForFlex(param);
		}
		
	}
}