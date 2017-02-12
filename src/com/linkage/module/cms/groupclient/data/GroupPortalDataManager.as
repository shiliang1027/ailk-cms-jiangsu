package com.linkage.module.cms.groupclient.data
{
	import mx.collections.ArrayCollection;

	public interface GroupPortalDataManager
	{
		function getSLAAlarmData(param:Object,success:Function,complete:Function=null,error:Function=null):ArrayCollection;		
		
		function getServiceQAAlarmData(param:Object,success:Function,complete:Function=null,error:Function=null):ArrayCollection;
		
		function getAlarmInfo(param:Object,success:Function,complete:Function=null,error:Function=null):ArrayCollection;
		
		function getTotalSheetInfo(param:Object,success:Function,complete:Function=null,error:Function=null):ArrayCollection;
		
		function getMsgInfo(param:Object,success:Function,complete:Function=null,error:Function=null):String;
	}
}
