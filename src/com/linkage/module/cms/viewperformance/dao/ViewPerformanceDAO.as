package com.linkage.module.cms.viewperformance.dao
{
	import mx.rpc.AsyncToken;
	
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
	public interface ViewPerformanceDAO
	{
		/**
		 * 查询性能数据
		 * @param param(gather_time,mo_id,mo_name,port_num)
		 * @return AsyncToken
		 * 
		 */
		function queryPerfData(param:Object):AsyncToken;
	}
}