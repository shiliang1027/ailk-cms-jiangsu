package com.linkage.module.cms.scenedaily.dao.kqikpipi
{
	import mx.rpc.AsyncToken;

	public interface IKQIKPIPIDao
	{
		function getKqiKpiPiRelation(kpiId:String):AsyncToken;
		function getKpiMoList(kpiId:String, moTypeId:String):AsyncToken;
	}
}

