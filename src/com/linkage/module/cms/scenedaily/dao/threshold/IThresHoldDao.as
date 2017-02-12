package com.linkage.module.cms.scenedaily.dao.threshold
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IThresHoldDao
	{
		/**
		 *加载指标组信息
		 */
		function getPerfGroup(param:Object):AsyncToken;

		/**
		 *加载阈值信息
		 */
		function getThreshold(param:Object):AsyncToken;

		/**
		 *加载地市
		 */
		function selectCitys():AsyncToken;

		/**
		 *加载网元类型
		 */
		function getMoTypeNames(param:Object):AsyncToken;

		/**
		 *保存阈值信息
		 */
		function saveThreshold(param:Object):AsyncToken;


	}
}