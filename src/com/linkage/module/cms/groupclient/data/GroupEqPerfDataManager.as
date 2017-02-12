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
	public interface GroupEqPerfDataManager
	{
		/**
		 * 
		 * 加载左边的树
		 * 
		 **/
		function loadEqTrees(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 
		 * 加载设备指标列表
		 * 
		 **/
		function loadEqKPIList(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 
		 * 加载设备指标详细信息
		 * 
		 **/
		function loadEqKPIDetail(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 
		 * 加载集客业务报表信息
		 * 
		 **/
		function loadEqBusinessReports(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 
		 * 加载集客设备（局端）告警对应的集客业务等详情
		 * 
		 **/
		function loadEqRelatedGroupServDetail(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 
		 * 加载集客设备（重大）告警对应的集客业务等详情
		 * 
		 **/
		function loadEqCatastrophicServDetail(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function qureyHistoryAlarmData(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
	}
}