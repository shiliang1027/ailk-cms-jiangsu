package com.linkage.module.cms.scene.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface ISceneTreeDAO
	{
		/**
		 * 获取场景tree
		 * */
		function getSceneAreaList(param:Object = null):AsyncToken;

		/**
		 * 获取缩略图
		 * */
		function getSceneAreaThumb():AsyncToken;

		/**
		 * 获取缩略图tip窗口数据
		 * @param   里面参数 cityId  sceneId areaId
		 * */
		function getAreaBadAndImpPerf(param:Object):AsyncToken;

		/**
		 * 删除缩略图数据
		 * @param   里面参数 account areaId
		 * */
		function deleteImgData(param:Object):AsyncToken;


		/**
		 * 启停缩略图数据
		 * @param   里面参数  status 、areaId、sceneId
		 * */
		function updateListAreaStatus(param:Object):AsyncToken;

		/**
		 * 查询缩略图数据
		 * @param   里面参数  cityId 、name、sceneId
		 * */
		function queryUpdateAreaName(param:Object):AsyncToken;


	}
}