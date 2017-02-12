package com.linkage.module.cms.alarm.eventwindow.dao
{
	import mx.rpc.AsyncToken;

	public interface EventWindowDAO
	{
		function queryEventData(param:Object):AsyncToken;
//		function queryIvrevens(param:Object):AsyncToken;
		function callIVR(param:Object):AsyncToken;
		function deleteEvent(param:Object):AsyncToken;
		/**
		 * 查询备注事件
		 */
		function selectRemarkById(param:Object):AsyncToken;
		/**
		 * 更新备注事件
		 */
		function updateRemarkById(param:Object):AsyncToken;
		/**
		 * 查询条件结果集
		 */
		function selectFilterDatas():AsyncToken;
	}
}