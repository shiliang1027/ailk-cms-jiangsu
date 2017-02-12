package com.linkage.module.cms.scenedaily.dao.hangandpick
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IHangPlateDAO
	{
		function queryListInfo(param:Object):AsyncToken;
		function delist(param:Object):AsyncToken;

		function loadListingMoData(param:Object):AsyncToken;
	}
}