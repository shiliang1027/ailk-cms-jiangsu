package com.linkage.module.cms.groupclient.data
{
	public interface AlarmDialSheetNoticeDataManager
	{
		function getCallRecord(param:Object, success:Function, error:Function = null):void;
		
		function getDone(param:Object, success:Function, error:Function = null):void;
		
		function updateCallRecords(param:Object, success:Function, error:Function = null):void;
		
		function getWarnDatas(param:Object, success:Function, error:Function = null):void;
		
		function getDisplayColumns(param:Object, success:Function, error:Function = null):void;
		
		function delCallRecord(param:Object, success:Function, error:Function = null):void;
		
		function exportUnDoneF(param:Object, success:Function, error:Function = null):void;
		
		function exportDoneF(param:Object, success:Function, error:Function = null):void;
	}
}