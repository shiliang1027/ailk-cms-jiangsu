package com.linkage.module.cms.general.monitor.datamanager
{
	public interface DevLocation
	{
		/**
		 * 查询指定定位网元信息的信息
		 * @locateType 定位类型 
		 *   BTS        根据网元直接GIS定位
		 *   TOBTS    根据网元查询下属基站在GIS上定位
		 *   AP          根据网元直接GIS定位
		 *   TOAP      根据网元查询下属AP在GIS定位        --暂不支持
		 *   self         直接在gis上定位该网元(经纬度使用网元所属机楼经纬度)
		 * @moId 网元编号
		 * @return
		 */
		function devLocate(locateType:String, moId:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 根据管线信息查询属地信息
		 * @param paramMap
		 * @return
		 */
		function getCircuitCity(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 根据基站查询BSC
		 * @param paramMap
		 * @return
		 */
		function getBscInfo(moId:String, success:Function, complete:Function = null, error:Function = null):void;
		
	}
}