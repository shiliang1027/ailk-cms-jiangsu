package com.linkage.module.cms.alarm.matrix.data
{
	public interface IDataManager
	{
		 function getSpecAlarmMatrix(areaId:String, success:Function, error:Function = null):void; 
			
		 function getCityAlarmMatrix(areaId:String, success:Function, error:Function = null):void; 
			
		 function getMoAlarmMatrix(specId:String, areaId:String, success:Function, error:Function = null):void;
	}
}