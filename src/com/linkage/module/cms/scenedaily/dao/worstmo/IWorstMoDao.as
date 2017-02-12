package com.linkage.module.cms.scenedaily.dao.worstmo
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 *  @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IWorstMoDao
	{
		/**
		 *根据网元类别查询最差网元信息
		 */
		function getWorstType(worstType:String):AsyncToken;
		/**
		 *保存最差网元信息
		 */
		function saveWorstMoSetList(worstInfo:Object):AsyncToken;
	}
}