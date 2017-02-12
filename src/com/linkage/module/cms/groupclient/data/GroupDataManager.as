package com.linkage.module.cms.groupclient.data
{
	public interface GroupDataManager
	{
		function getCityLayer(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustAlarmMatrix(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getAlarmCompMatrix(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustNumByServ(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustNumBySafe(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCityAlarmStat(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getServType(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getGroupPerf(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getAlarmList(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getPerfStat(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getSuspInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getSheetList(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getProvincialCust(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getTransProvincialCust(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCitySite(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCityLocation(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getDistrictCustCount(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getDistrictCust(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getGroupAlarmCompMatrix(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getSpecNumByServ(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustListByCityId(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustGeneral(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustAlarm(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustomerScale(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getBusinessScale(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getAlarmScale(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
	}
}