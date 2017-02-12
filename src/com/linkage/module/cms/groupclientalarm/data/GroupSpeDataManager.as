package com.linkage.module.cms.groupclientalarm.data
{
	
	public interface GroupSpeDataManager
	{
		/**
		 * 
		 * 加载左边的树
		 * 
		 **/
		function queyrKpiTree(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 
		 * 加载设备指标列表
		 * 
		 **/
		function queryKpiListInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
	}
}