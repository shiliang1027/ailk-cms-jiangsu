package com.linkage.module.cms.general.monitor.datamanager
{
	public interface LineInfo
	{
		function setEndPoint(context:String):void;
		
		/**
		 * 查询指定管线的信息
		 * @param locateType "circuit"
		 * @param moId "{'cuid':'苏州市区硫酸厂-苏州市区苏州园区机楼30N0001-EMS','moid':'9-2006-西楼里,9-2005-长桥'}"
		 * @return
		 */
		function devLocate(locateType:String, moId:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询指定管线的信息
		 
		 * @param locateType "circuit"
		 * @param moId "{'cuid':'苏州市区硫酸厂-苏州市区苏州园区机楼30N0001-EMS','moid':'9-2006-西楼里,9-2005-长桥'}"
		 * @return
		 */
		function devLocate2(locateType:String, circName:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 根据光路查询电路信息
		 * @param paramMap
		 * @return
		 */
		function getCircuitByOptic(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询电路对应光路的管线的信息
		 * @param cuid
		 * @return
		 */
		function getDevLocateByCuId(cuid:String, success:Function, complete:Function = null, error:Function = null):void;
			
		/**
		 * 根据机楼id查询机楼最高告警等级
		 * @param paramMap
		 * @return
		 */
		function getSiteAlarmLevels(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 根据大面积退服告警id查询 退服基站的传输资源
		 * @param paramMap
		 * @return
		 */
		function getQuitBtsTransRes(param:Object, success:Function, complete:Function = null, error:Function = null):void;
			
		/**
		 * 根据光缆段查询光路信息、根据物理管线查询光缆段信息
		 * @param paramMap
		 * @return
		 */
		function queryRouteInfo(type:String, id:String, success:Function, complete:Function = null, error:Function = null):void;
		
		
		/**
		 * 根据光路编码查询出光路路由
		 * @param paramMap
		 * @return
		 */
		function queryOpticalPathRoutingInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		
		/**
		 * 根据光路ID查询物理段（吊线段，管道段，虚连接）详细信息
		 * @param paramMap
		 * @return
		 */
		function queryPhysicalSegmentInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		
		
	}
}