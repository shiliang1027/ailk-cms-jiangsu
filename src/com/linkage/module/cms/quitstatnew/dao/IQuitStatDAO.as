package com.linkage.module.cms.quitstatnew.dao
{
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-28
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IQuitStatDAO
	{
		function getQuitServiceStat(param:Object):AsyncToken;
		function getHisQuitServiceStat(param:Object):AsyncToken;

		function getQuitStatDetail(param:Object):AsyncToken;

		function getcitys():AsyncToken;
		
		function getMapRenderList(param:Object):AsyncToken;
		
		function getKpiCityDataList(param:Object):AsyncToken;
	}
}