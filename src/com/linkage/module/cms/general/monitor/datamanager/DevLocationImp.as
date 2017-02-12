package com.linkage.module.cms.general.monitor.datamanager
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class DevLocationImp implements DevLocation
	{
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.general.monitor.datamanager.DevLocationImp");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_gis_location_devLocateservice";
		//
		protected var remoteSource:String = "com.linkage.module.cms.gis.location.serv.DevLocateServImp";

		public function DevLocationImp(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}
		
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
		public function devLocate(locateType:String, moId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result, locateType);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "devLocate");
			
			remote.devLocate(locateType,moId);
			remote = null;
		}
		
		/**
		 * 根据管线信息查询属地信息
		 * @param paramMap
		 * @return
		 */
		public function getCircuitCity(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "getCircuitCity");
			
			remote.getCircuitCity(paramMap);
			remote = null;
		}
		
		/**
		 * 根据基站查询BSC
		 * @param paramMap
		 * @return
		 */
		public function getBscInfo(moId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "getBscInfo");
			
			remote.getBscInfo(moId);
			remote = null;
		}
		
		
		private function doNoParamCallBack(complete:Function):void
		{
			if (complete != null)
			{
				complete.call(null);
			}
		}
	}
}