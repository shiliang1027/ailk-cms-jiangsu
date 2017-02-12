package com.linkage.module.cms.gsscene.view.components.quitservice.dao
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	import mx.rpc.AsyncToken;

	public interface IQuitServiceDao
	{
		function getSceneQuitSvs():AsyncToken;
		
		//概括统计
		function querySceneDevSheet():AsyncToken;

		/**
		 * 获取退服统计中地市查询的详情信息
		 *
		 * */
		function queryCityQuitDataDetail(param:Object):AsyncToken;
	}
}