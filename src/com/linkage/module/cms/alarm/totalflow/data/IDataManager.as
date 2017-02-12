package com.linkage.module.cms.alarm.totalflow.data
{

	/**
	 * 获取数据的接口
	 * @author mengqiang
	 *
	 */
	public interface IDataManager
	{
		/**
		 * 加载统计数据
		 * @param success 回调,参数为 Map<String,List>
		 * @param error
		 *
		 */
		function loadStatData(success:Function, error:Function=null):void;
		/**
		 *加载工单统计数据
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function loadSheetStatData(success:Function, error:Function=null):void;
		/**
		 *加载工单详情数据
		 * @param spec 专业
		 * @param sheetType 工单类型
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function loadSheetDetailData(spec:String, sheetType:String, success:Function, error:Function=null):void;
		/**
		 *加载工单详细
		 * @param curPage 当前页
		 * @param pageSize 每页数
		 * @param specName 专业
		 * @param cityName 属地
		 * @param queryType 属地
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function loadSheetDetailInfo(curPage:int, pageSize:int, specName:String, cityName:String, queryType:String, success:Function, error:Function=null):void;
	}
}