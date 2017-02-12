package com.linkage.module.cms.alarm.customrule.data
{

	public interface CustomRuleData
	{
		/**
		 *保存窗口坐标
		 * @param params 参数
		 * @param success 成功时执行方法
		 * @param error 失败时执行方法
		 *
		 */
		function saveWindowXY(params:Object, success:Function, error:Function=null):void;
	}
}