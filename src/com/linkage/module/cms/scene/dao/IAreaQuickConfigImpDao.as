package com.linkage.module.cms.scene.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2013-1-16
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IAreaQuickConfigImpDao
	{
		//分导入的数据
		function getMoInfoByParams(p:Object):AsyncToken;
	}
}