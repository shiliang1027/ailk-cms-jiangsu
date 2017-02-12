package com.linkage.module.cms.alarm.countflow.data
{

	public interface CountAlarmData
	{
		/**
		 *加载统计趋势图数据
		 * @param type 查询类型 1、一级设备告警 2、所有等级设备告警 3、派单数 4、关联后告警数
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function loadStatLineData(type:String, success:Function, error:Function = null):void;
		/**
		 * 告警统计
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function getWarnStatInfoList(success:Function, error:Function = null):void;
		function getWarnStatInfoListNew(success:Function, error:Function = null):void;
		/**
		 * 派单统计
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function getSheetWarnStatInfoList(success:Function, error:Function = null):void;
		/**
		 *加载地市一级告警统计
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function getCityAlarmStatInfoList(success:Function, error:Function = null):void;
		/**
		 * 关联告警统计
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function getRelationWarnStatInfoList(success:Function, error:Function = null):void;

		/**
		 * 加载告警详情数据
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 * @author add by hurw at 5.21.2013
		 */
		function loadWarnStatDetailData(curPage:int, pageSize:int, specId:String, specName:String, sheetType:String, totalCount:String, success:Function, error:Function = null):void;
		
		function loadCityWarnStatDetailData(curPage:int, pageSize:int, specId:String, specName:String, sheetType:String, totalCount:String,alarmregion:String, success:Function, error:Function = null):void;

		/**
		 *加载工单详情数据
		 * @param specId 专业
		 * @param specName 专业
		 * @param sheetType 工单类型
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function loadSheetDetailData(specId:String, specName:String, sheetType:String, success:Function, error:Function = null):void;
		/**
		 *加载工单详细
		 * @param curPage 当前页
		 * @param pageSize 每页数
		 * @param specId 专业
		 * @param cityName 属地
		 * @param queryType 查询类型
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function loadSheetDetailInfo(curPage:int, pageSize:int, specId:String, cityName:String, queryType:String, success:Function, error:Function = null):void;
	}
}

