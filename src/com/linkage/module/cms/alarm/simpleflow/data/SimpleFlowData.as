package com.linkage.module.cms.alarm.simpleflow.data
{

	public interface SimpleFlowData
	{
		/**
		 *保存窗口坐标
		 * @param params 参数
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function queryHisInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
	}
}