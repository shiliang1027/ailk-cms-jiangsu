package com.linkage.module.cms.viewperformance.dao
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
	public class ViewPerformanceDAOImp implements ViewPerformanceDAO
	{
		private var log:ILogger=Log.getLoggerByClass(ViewPerformanceDAOImp);
		
		[Inject("remoteObject")]
		public var rmtObj:RemoteObject;
		
		/**
		 * 查询性能数据
		 * @param param(gather_time,mo_id,mo_name,port_num)
		 * @return AsyncToken
		 * 
		 */
		public function queryPerfData(param:Object):AsyncToken
		{
			return rmtObj.queryPerfData(param);
		}
	}
}