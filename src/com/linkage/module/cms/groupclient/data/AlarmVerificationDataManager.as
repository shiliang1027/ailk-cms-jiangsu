package com.linkage.module.cms.groupclient.data
{
	import mx.collections.ArrayCollection;

	public interface AlarmVerificationDataManager
	{
		function alarmValidationList(param:Object, success:Function, error:Function = null):void;
		
		function validateAlarm(param:Object, success:Function, error:Function = null):void;
	}
}