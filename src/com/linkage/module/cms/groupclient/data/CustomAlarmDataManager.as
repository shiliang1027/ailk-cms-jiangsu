package com.linkage.module.cms.groupclient.data
{
	/**
	 * 该as的描述信息
	 * @author shiliang(66614) Tel:13770527121
	 * @version 1.0
	 * @since 2012-1-5 上午11:52:58
	 * @category com.linkage.module.cms.groupclient.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public interface CustomAlarmDataManager
	{
		function queryCust(param:Object,success:Function,complete:Function=null,error:Function=null):void;
	}
}