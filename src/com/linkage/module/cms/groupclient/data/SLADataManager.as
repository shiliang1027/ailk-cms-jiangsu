package com.linkage.module.cms.groupclient.data
{
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-6-27 上午11:45:26
	 * @category com.linkage.module.cms.groupclient.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public interface SLADataManager
	{
		function getSLAXml(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getSafeLevel(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function addSLA(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getSLAConfig(param:Object,success:Function,complete:Function=null,error:Function=null):void;
	}
}