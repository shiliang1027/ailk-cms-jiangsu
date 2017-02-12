package com.linkage.module.cms.scene.dao.roam
{
	import mx.rpc.AsyncToken;

	public interface IRoamDAO
	{
		/**
		 *加载色板数据
		 */
		function loadLegendData(param:Object):AsyncToken;

		/**
		 * 查询地图和列表数据
		 */
		function getSceneRoamList(param:Object):AsyncToken;

		/**
		 * 查询趋势图数据
		 */
		function getSceneTrains(param:Object):AsyncToken;

		/**
		 *保存图例信息
		 */
		function saveLegendData(param:Object):AsyncToken;
	}
}