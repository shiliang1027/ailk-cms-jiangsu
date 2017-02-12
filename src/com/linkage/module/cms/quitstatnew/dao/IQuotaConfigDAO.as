package com.linkage.module.cms.quitstatnew.dao
{
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IQuotaConfigDAO
	{
		function getShConfig():AsyncToken;
		function saveShConfig(dataList:ArrayCollection):AsyncToken
	}
}