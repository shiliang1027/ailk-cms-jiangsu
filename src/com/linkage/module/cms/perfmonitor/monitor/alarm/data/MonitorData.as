package com.linkage.module.cms.perfmonitor.monitor.alarm.data
{

	public interface MonitorData
	{
		/**
		 *加载设备性能数据
		 * @param success 成功时执行
		 * @param error 失败时执行
		 *
		 */
		function loadStatData(success:Function, error:Function=null):void;
		/**
		 *获取性能指标
		 * @param params 参数
		 * @param success 成功时执行
		 * @param error 失败时执行
		 *
		 */
		function getPerfsByMoType(params:Object, success:Function, error:Function=null):void;
		/**
		 *获取趋势图数据
		 * @param params 参数
		 * @param success 成功时执行
		 * @param error 失败时执行
		 *
		 */
		function createSTP(params:Object, success:Function, error:Function=null):void;
	}
}