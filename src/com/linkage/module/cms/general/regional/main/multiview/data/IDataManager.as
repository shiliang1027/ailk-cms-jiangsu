package com.linkage.module.cms.general.regional.main.multiview.data
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
		 * @param viewId 视图ID
		 * @param success
		 */
		function loadAlarmTotal(viewId:String, success:Function):void;
		/**
		 *获取指标信息列表
		 * @param viewId 视图ID
		 * @param segmentType 指标类型（2代表业务指标、1代表性能指标
		 * @param success
		 */
		function getSegmentList(viewId:String, segmentType:int, success:Function):void;
		/**
		 *获取指定场景业务指标柱状图统计数据
		 * @param viewId 视图ID
		 * @param success
		 */
		function getBusinessSegmentData(viewId:String, success:Function):void;
		/**
		 *获取指定场景性能指标趋势图统计数据
		 * @param viewId 视图ID
		 * @param success
		 */
		function getPerfSegmentData(viewId:String, success:Function):void;
		/**
		 *获取多维视图告警过滤器
		 * @param viewId 视图ID
		 * @param success
		 */
		function getAlarmFilter(viewId:String, success:Function):void;
	}
}