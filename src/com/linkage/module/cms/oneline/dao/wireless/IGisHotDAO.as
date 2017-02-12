package com.linkage.module.cms.oneline.dao.wireless
{
	import mx.rpc.AsyncToken;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-12-10
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IGisHotDAO
	{
		
		/**
		 * 查询GIS热图地市列表数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getCitys(param:Object):AsyncToken;
		/**
		 * 根据地市查询GIS热图右侧列表数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getHotSpotCell(param:Object):AsyncToken;
		/**
		 * 根据地市和时间（今天，昨天，前天）查询GIS热图右侧历史列表数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getHistoryHotSpot(param:Object):AsyncToken;
		/**
		 * 根据地图框选查询GIS热图右侧列表数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function queryMapContainsMo(param:Object):AsyncToken;
		/**
		 * 查询GIS热图右侧列表详情
		 * @param param
		 * @return 
		 * 
		 */		
		function getHisInfo(param:Object):AsyncToken;
		/**
		 * 查询GIS点信息
		 * @param param
		 * @return 
		 * 
		 */		
		function getGisInfo(param:Object):AsyncToken;
		
		/**
		 * 查询历史热点GIS点信息
		 * @date 2013-08-15
		 * @author 汪炜
		 * @param param
		 * @return 
		 * 
		 */		
		function getHotHistoryGisInfo(param:Object):AsyncToken;
		
		/**
		 * 查询GIS点指标信息
		 * @param param
		 * @return 
		 * 
		 */		
		function getKpiInfo(param:Object):AsyncToken;
		/**
		 * 查询小区辐射范围
		 * @param param
		 * @return 
		 * 
		 */		
		function getRadius(param:Object):AsyncToken;
		
		/**
		 * 更新小区辐射范围
		 * @param param
		 * @return 
		 * 
		 */		
		function updateRadius(param:Object):AsyncToken;
		
		/**
		 * 保存标注 
		 * @param param
		 * @return 
		 * 
		 */		
		function saveRemark(param:Object):AsyncToken;
		/**
		 * 查询网元指标历史性能数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getHisKpiInfo(param:Object):AsyncToken;
		/**
		 * 查询指标列表数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getKpiByMoId(param:Object):AsyncToken;
		/**
		 *  查询指标列表数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getKpiByMoTypeId(param:Object):AsyncToken;
		/**
		 * 查询指标最新及上周同期数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getLastWeekAnd24hKpiinfo(param:Object):AsyncToken;
		
		/**
		 * 保存一键快速定制 
		 * @param param
		 * @return 
		 * 
		 */		
		function saveScene(param:Object):AsyncToken;
		/**
		 * 查询小区拨打号码top10数据
		 * @param param
		 * @return 
		 * 
		 */		
		function getSpecialPhoneInfo(param:Object):AsyncToken;
		/**
		 * 查询普通小区gisinfo
		 * @param param
		 * @return 
		 * 
		 */		
		function getNormalCellGisInfo(param:Object):AsyncToken;
		
	}
}