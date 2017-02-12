package com.linkage.module.cms.scene.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-12-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IAreaQuickConfigDao
	{
		//查询指标和应急资源
		function getPref(p:Object):AsyncToken;

		//查询经纬度
		function getAreaTrack(p:Object):AsyncToken;

		//查询经纬度
		function getAreaByGis(p:Object):AsyncToken;

		//查询场景名称
		function getSceneList(p:Object):AsyncToken;

		//查询URL
		function getThumbnail(areaName:String):AsyncToken;

		//查询网元
		function queryMapContainsMo(p:Object):AsyncToken;

		//保存
		function saveFastConf(p:Object):AsyncToken;

		//加载场景类型
		function getSceneTypeList():AsyncToken;

		//加载地市名称
		function getCityList():AsyncToken;

		//加载网元列表
		function getMoType():AsyncToken;

		//根据网元类型查待选择指标
		function getPerfByMoType(p:Object):AsyncToken;

		//根据cityId查基本树
		function loadBaseTree(p:Object):AsyncToken;

		//分页树
		function loadPageTree(p:Object):AsyncToken;

		//分导入的数据
		function loadImpData(p:Object):AsyncToken;


	}
}