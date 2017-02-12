package com.linkage.module.cms.gsscene.view.components.resmatrix.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IResMatrixDAO
	{
		function getResMatrixList():AsyncToken;

		function getBadNeList():AsyncToken;

		function getAreaList():AsyncToken;

		/**
		 * 场景：
		 *	设备资源，点击网元数量后 展示所有网元列表，不只是展示有告警的网元列表。
		 * */
		function getMoInfoByMoTypeId(param:Object):AsyncToken;

		/**
		 * 资源矩阵，点击告警网元数，查询对应数据
		 * */
		function getAlarmInfoByMoType(param:Object):AsyncToken;
		/**
		 * 资源矩阵，点击告警网元数，查询对应数据
		 * */
		function getBadNeListByMoTypeAndWarnLevel(param:Object):AsyncToken;
		/**
		 * 查询导出的数据总数
		 * */
		function exportNeInfoNum(param:Object):AsyncToken;

	}
}