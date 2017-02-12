package com.linkage.module.cms.roamtopic.dao
{
	import mx.rpc.AsyncToken;
	
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
	public interface RoamTopicDAO
	{
		
		/**
		 * 查询漫游数据
		 * 
		 * @param param
		 * @return AsyncToken
		 * 
		 */
		function queryRomTopicData(param:Object):AsyncToken;
		
		function configParam(param:Object):AsyncToken;
		function configSaveParam(param:Object):AsyncToken;
	}
}