package com.linkage.module.cms.gsscene.view.components.common.dao
{
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.common.domain.User;

	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 *  @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-3
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IScenePanelDao
	{
		/**
		 * 应急概况接口
		 */
		function getSceneEmgyInfo():AsyncToken;
		/**
		 * 根据应急资源类型查询应急资源接口
		 */
		function getSceneEmgyDetail(param:Object):AsyncToken;
		/**
		 *查询应急资源轨迹接口
		 */
		function getSceneEmgyChg(param:Object):AsyncToken;
		/**
		 * 重点指标接口
		 */
		function getSceneCoreKpi(startTime:String, endTime:String):AsyncToken;
		/**
		 * 获取指标概况列表数据接口
		 */
		function getSceneKpiGeneralInfo():AsyncToken;
		/**
		 * 获取网元性能TOPN 下拉指标列表
		 */
		function getSceneKpiList():AsyncToken;
		/**
		 * 获取网元性能TOPN 单个指标TOPN数据图表
		 */
		function getSceneTopN(kpiId:String, moTypeId:String):AsyncToken;
		/**
		 *获取漫游信息
		 */
		function getSceneRoamInfo():AsyncToken;
		/**
		 * 获取天气概况接口
		 */
		function getSceneWeatherInfo():AsyncToken;
		/**
		 * 根据城市获取24小时天气详情接口
		 */
		function getSceneWeatherDetail(cityId:String):AsyncToken;
		/**
		 * 根据指标ID获取指标概况图表信息
		 */
		function getKpiHisByKpiId(user:IUser):AsyncToken;
		/**
		 * 台风轨迹信息
		 */
		function getSceneTyphoonInfo():AsyncToken;
		/**
		 * 台风影响地市信息
		 */
		function getCoverCityMsg():AsyncToken;
		/**
		 * 获得今日运动会赛事列表信息
		 */
		function getSceneTodayGameList():AsyncToken;

		/**
		 * topn劣化矩阵
		 * */
		function getSceneTopNAll(strKpiId:String, strMoTypeId:String):AsyncToken;
		/**
		 * topn二次指标		 * */
		function getTopNAreaList(user:IUser):AsyncToken;

		function getMoKpiHisByKpiId(user:IUser):AsyncToken;
		function getKpiCompareyKpiId(user:IUser):AsyncToken;
		function updateEmgyIsUsed(param:Object):AsyncToken;

		/**
		 *
		 * top N值修改
		 * */
		function updateSceneTopnNum(param:Object):AsyncToken;
		/**
		 *
		 * 获取当前top N值
		 * */
		function getSceneDetail(param:Object):AsyncToken;
		/**
		 * 查询阈值指标
		 */
		function queryAllPerf(param:Object):AsyncToken;
		/**
		 * 保存指标配置
		 */
		function kpiConfig(param:Object):AsyncToken;
		/**
		 * 阈值配置指标保存
		 */
		function thresholdConfig(param:Object):AsyncToken;

		/**
		 * 区域、网元劣化趋势数据查询
		 */
		function queryBadHis(param:Object):AsyncToken;
		/**
		 * 查询阈值
		 */
		function queryThreshold(param:Object):AsyncToken;
		/**
		 * 查询场景信息
		 */
		function queryShareScene(param:Object):AsyncToken;
		/**
		 * 查询场景信息
		 */
		function saveShareScene(param:Object):AsyncToken;
		/**
		 * 保存多个topN指标配置信息
		 */
		function topnKpiConfig(param:Object):AsyncToken;
		/**
		 * 获取多个topN指标信息
		 */
		function getSceneConfigTopN(param:Object):AsyncToken;
		/**
		 * 获取多个topn指标配置信息
		 */
		function queryTopnKpiConfig(param:Object):AsyncToken;
		/**
		 * 获取所有摄像头
		 */
		function getCameraList(param:Object):AsyncToken;
		/**
		 * 查询摄像头
		 */
		function queryCameraList(param:Object):AsyncToken;
		/**
		 * gis视图下基站退服数据获取！
		 */
		function queryBtsAndQuitBtsNum():AsyncToken;
		
	}
}

