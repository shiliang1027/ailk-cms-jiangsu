package com.linkage.module.cms.groupmonitor.custscene.alarmSearch.dao
{
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2013-2-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IAlarmSignDao
	{
		function queryAlarmSignList(param:Object):AsyncToken;
		function clearAlarm(param:Object):AsyncToken;
		function remove(param:Object):AsyncToken;
	}
}