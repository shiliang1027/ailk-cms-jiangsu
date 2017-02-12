package com.linkage.module.cms.scene.dao
{
	import mx.rpc.AsyncToken;

	/*
	 *说明：
	 *作者：panyin
	 *时间：2012-11-28下午7:40:11
	 **/

	public interface ISiteAlarmDao
	{
		function loadSiteAlarmInfo(siteIds:String):AsyncToken;
	}
}

