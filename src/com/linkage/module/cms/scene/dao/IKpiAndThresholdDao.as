package com.linkage.module.cms.scene.dao
{
	import mx.rpc.AsyncToken;

	public interface IKpiAndThresholdDao
	{
		function queryThresholdByCon(p:Object):AsyncToken; //这个借口的名称问写java代码的人
	}
}