package com.linkage.module.cms.scenedaily.dao.impkpi
{
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-21
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IImpProKpiDao
	{
		/**
		 * 获取重点指标概览数据信息
		 */
		function getImpKpiGeneralInfo(indexPage:int, perPageCount:int, perfName:String):AsyncToken;
		/**
		 * 根据状态信息查询指标信息
		 */
		function getImpKpiCfgInfo(status:int):AsyncToken;
		/**
		 *保存指标信息
		 */
		function saveImpKpiCfgInfo(isSelectArrData:ArrayCollection):AsyncToken;

		function loadDelistingMoData(param:Object):AsyncToken;

	}
}

