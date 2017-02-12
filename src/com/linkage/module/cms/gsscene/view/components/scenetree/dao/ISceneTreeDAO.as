package com.linkage.module.cms.gsscene.view.components.scenetree.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface ISceneTreeDAO
	{
		/**
		 * 获取场景tree
		 * */
		function getSceneAreaList(param:Object = null):AsyncToken;
		/**
		 * 获取场景tree（新场景）
		 * */
		function getSceneTree(param:Object = null):AsyncToken;
	}
}