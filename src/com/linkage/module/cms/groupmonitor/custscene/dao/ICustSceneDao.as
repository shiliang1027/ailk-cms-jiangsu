package com.linkage.module.cms.groupmonitor.custscene.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface ICustSceneDao
	{
		/**
		 *加载基础数
		 */
		function loadBaseTree(e:Object):AsyncToken;

		/**
		 *加载分页数
		 */
		function loadPageTree(param:Object):AsyncToken;

		/**
		 *加载大客户对应使用客户
		 */
		function loadBigCustData(param:Object):AsyncToken;

		/**
		 *加载大客户对应使用客户模型
		 */
		function loadUserCust(param:Object):AsyncToken;


		/**
		 *加载客户对应性能故障工单投投诉工单信息
		 */
		function loadDispaterData(param:Object):AsyncToken;

		/**
		 *点击TOPU图加载客户对应性能故障工单投投诉工单信息
		 */
		function loadDispaterDataById(param:Object):AsyncToken;

		/**
		 *根据客户ID查询服务类型
		 */
		function loadServerTypeByCustId(param:Object):AsyncToken;

		/**
		 *查询指标
		 */
		function loadKpiGroupBySver(param:Object):AsyncToken;

		/**
		 *查询趋势图数据
		 */
		function loadPerfChartData(param:Object):AsyncToken;

		function getServByCust(param:Object):AsyncToken;

		function getServertarget(param:Object):AsyncToken;

		function getRealPm(param:Object):AsyncToken;

		/**
		 *查询是否有告警
		 */
		function queryAlarmByIds(param:Object):AsyncToken;

		/**
		 *初始化面板
		 */
		function queryTotalInfo():AsyncToken;

		/**
		 *根据大客户ID查询面板数据
		 */
		function queryTotalInfoByCustNo(param:Object):AsyncToken;

		/**
		 *根据大客户加载性能面板使用客户
		 */
		function loadUserKpiByGruoupCust(param:Object):AsyncToken;

		/**
		 *面板指标
		 */
		function loadKpiByCustId(param:Object):AsyncToken;

		function queryFaultOrdersByCity(param:Object):AsyncToken;
		function queryComplaintsOrdersByCity(param:Object):AsyncToken;

		/**
		 *查区县下专线数量
		 */
		function getAreaUserCustData(param:Object):AsyncToken;

		function getSelects():AsyncToken;

		function queryGroupUsers(param:Object):AsyncToken;

		function saveUserInfo(param:Object):AsyncToken;

		function getOverCitySpec(param:Object):AsyncToken;
		function updateUserName(param:Object):AsyncToken;

		function saveXYValues(param:Object):AsyncToken;
		function getOverAreaSpec(param:Object):AsyncToken;

		function queryGroupCustByName(param:Object):AsyncToken;

		function saveColor(param:Object):AsyncToken;
		function getUsersInSQLByCustId(param:Object):AsyncToken;
		function queryTotalInfoByCityId(param:Object):AsyncToken;
		function LoadExportData(param:Object):AsyncToken;

	}
}