package com.linkage.module.cms.scenedaily.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IDailyMapDAO
	{
		function getGisKpi(param:Object):AsyncToken;
	}
}