package com.linkage.module.cms.scene.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *说明：
	 *作者：panyin
	 *时间：2012-11-28上午10:24:24
	 */

	public interface ILineGisInfoDao
	{

		function loadLineGisInfo(circName:String):AsyncToken;
	}
}

