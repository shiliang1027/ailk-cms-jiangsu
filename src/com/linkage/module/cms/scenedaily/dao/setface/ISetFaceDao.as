package com.linkage.module.cms.scenedaily.dao.setface
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-3
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface ISetFaceDao
	{
		/**
		 *保存基本设置信息
		 */
		function saveBaseSetData(param:Object):AsyncToken;

		/**
		 *加载基本设置信息
		 */
		function loadBaseSetData():AsyncToken;

		/**
		 *加载健康算法设置信息
		 */
		function loadHealthSetData():AsyncToken;

		/**
		 *保存健康算法设置信息
		 */
		function saveHealthSetData(param:Object):AsyncToken;
	}
}