package com.linkage.module.cms.quitstatnew.dao
{
	import mx.rpc.AsyncToken;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-10-25
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IMultKpiDAO
	{
		function getThresHoldRenderConfig(param:Object):AsyncToken;
		function saveThresHoldRenderConfig(param:Object):AsyncToken;
	}
}