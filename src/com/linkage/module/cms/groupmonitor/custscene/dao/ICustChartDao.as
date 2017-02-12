package com.linkage.module.cms.groupmonitor.custscene.dao
{
	import mx.rpc.AsyncToken;

	public interface ICustChartDao
	{
		function querySpecLineFault(param:Object):AsyncToken;
		
		function querySpecLineComplaint(param:Object):AsyncToken;
	}
}