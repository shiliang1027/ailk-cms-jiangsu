package com.linkage.module.cms.scene.kpicustom.dao
{
	import mx.rpc.AsyncToken;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IKpiCustomDAO
	{
		/**
		 * 查询场景区域列表 
		 * @param param
		 * @return 
		 * 
		 */		
		function getSceneAreas(param:Object):AsyncToken;
		/**
		 * 查询场景指标列表 
		 * @param param
		 * @return 
		 * 
		 */		
		function getSceneKpis(param:Object):AsyncToken;
		/**
		 * 查询场景网元列表 
		 * @param param
		 * @return 
		 * 
		 */		
		function getSceneMos(param:Object):AsyncToken;
		/**
		 * 查询场景网元类型 
		 * @param param
		 * @return 
		 * 
		 */		
		function getSceneMoTypes(param:Object):AsyncToken;
		/**
		 * 查询指标数据 
		 * @param param
		 * @return 
		 * 
		 */		
		function getSceneKpiData(param:Object):AsyncToken;
		
	}
}