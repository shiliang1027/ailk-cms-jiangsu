package com.linkage.module.cms.scenedaily.dao.mainchart
{
	import mx.rpc.AsyncToken;

	public interface IChartDao
	{
		function loadTopNData(param:Object):AsyncToken; 
	}
}