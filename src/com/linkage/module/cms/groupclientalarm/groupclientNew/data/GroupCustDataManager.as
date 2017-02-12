package com.linkage.module.cms.groupclientNew.data
{
	public interface GroupCustDataManager
	{
		function load(param:String,success:Function,complete:Function=null,error:Function=null):void;
		
		function save(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function loadCompetitors(param:String,success:Function,complete:Function=null,error:Function=null):void;
		
		function saveCompetitors(param:Object,success:Function,complete:Function=null,error:Function=null):void;
	}
}