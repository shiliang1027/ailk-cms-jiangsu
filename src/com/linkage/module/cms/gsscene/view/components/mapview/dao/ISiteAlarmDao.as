package com.linkage.module.cms.gsscene.view.components.mapview.dao
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

