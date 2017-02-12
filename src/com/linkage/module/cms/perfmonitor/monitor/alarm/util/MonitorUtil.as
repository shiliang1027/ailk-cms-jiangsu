package com.linkage.module.cms.perfmonitor.monitor.alarm.util
{

	public class MonitorUtil
	{
		/**
		 *获取类型通过指标Id
		 * @param perfTypeId
		 * @return
		 *
		 */
		public static function getTypeByPerfTypeId(perfTypeId:String):int
		{
			if ("8000" == perfTypeId || '8008' == perfTypeId) //零话务量小区
			{
				return 3;
			}
			else if ("8001" == perfTypeId) //最差小区
			{
				return 1;
			}
			else if ("8002" == perfTypeId) //劣化小区
			{
				return 2;
			}
			else if ("8003" == perfTypeId) //小区无线利用率
			{
				return 5;
			}
			else if ("8004" == perfTypeId) //零业务量热点
			{
				return 7;
			}
			else if ("8005" == perfTypeId) //退服AP
			{
				return 7;
			}
			else if ("8006" == perfTypeId) //停电基站
			{
				return 6;
			}
			else if ("8007" == perfTypeId) //低性能蓄电池
			{
				return 6;
			}
			return 7;
		}
	}
}