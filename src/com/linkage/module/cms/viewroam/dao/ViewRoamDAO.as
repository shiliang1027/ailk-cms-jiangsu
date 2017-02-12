package com.linkage.module.cms.viewroam.dao
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
	public interface ViewRoamDAO
	{
		/**
		 * 查询性能数据
		 * @param param(gather_time,mo_id,mo_name,port_num)
		 * @return AsyncToken
		 * 
		 */
		function queryPerfs(param:Object):AsyncToken;
		/**
		 * 查询工程状态
		 * @param param(mo_id)
		 * @return AsyncToken
		 * 
		 */
		function getworkStatForFlex(param:Object):AsyncToken;
		
	}
}