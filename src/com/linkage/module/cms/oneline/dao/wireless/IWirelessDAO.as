package com.linkage.module.cms.oneline.dao.wireless
{
	import mx.rpc.AsyncToken;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IWirelessDAO
	{
		/**
		 * 获取KPI列表 
		 * @param param
		 * @return 
		 * 
		 */		
		function getKpiSet(param:Object):AsyncToken;
		
		/**
		 * 获取指标汇总趋势数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getHourPerfData(param:Object):AsyncToken;
		
		/**
		 * 获取劣化指标数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getBadMatrix(param:Object):AsyncToken;
		
		/**
		 * 获取指标表格数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getPerfData(param:Object):AsyncToken;
		
	}
}