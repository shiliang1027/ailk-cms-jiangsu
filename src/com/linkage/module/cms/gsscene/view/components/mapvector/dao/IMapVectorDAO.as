package com.linkage.module.cms.gsscene.view.components.mapvector.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IMapVectorDAO
	{
		function queryCityAlarmNum():AsyncToken;
		function queryCityQuitNum():AsyncToken;
		function queryCityAreaNum():AsyncToken;
		function queryCityKpiValue():AsyncToken;
	}
}

