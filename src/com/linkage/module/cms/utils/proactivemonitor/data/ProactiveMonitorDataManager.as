package com.linkage.module.cms.proactivemonitor.data
{
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-10-18 下午12:07:57
	 * @category com.linkage.module.cms.proactivemonitor.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public interface ProactiveMonitorDataManager
	{
		function citysQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function zoreTraffic2GDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function zoreTraffic2GGisDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function zoreTrafficTDDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function zoreTrafficTDGisDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function wlanRateBusyChartDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function wlanRateBusyDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function wlanRateBusyGisDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function wlanRate2GChartDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function wlanRate2GDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function wlanRate2GGisDataQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function estCellStpData(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getKpis(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function estCellData(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
	}
}