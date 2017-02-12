package com.linkage.module.cms.general.monitor.datamanager
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class LineInfoImp implements LineInfo
	{
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.general.monitor.datamanager.LineInfoImp");

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

		public function LineInfoImp()
		{

		}

		public function setEndPoint(context:String):void
		{
			endpoint = context + endpoint_SUFFIX;
		}

		/**
		 * 查询指定管线的信息
		 * @param locateType "circuit"
		 * @param moId "{'cuid':'苏州市区硫酸厂-苏州市区苏州园区机楼30N0001-EMS','moid':'9-2006-西楼里,9-2005-长桥'}"
		 * @return
		 */
		public function devLocate(locateType:String, moId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					success.call(null, result, moId);
					result = null;
					doNoParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					error.call(null, event);
					doNoParamCallBack(complete);
				}, true, "devLocate");

			remote.devLocate(locateType, "{'model':'2','circName':'" + moId + "','device':'1'}");
			remote = null;
		}
		
		/**
		 * 查询指定管线的信息
		 
		 * @param locateType "circuit"
		 * @param moId "{'cuid':'苏州市区硫酸厂-苏州市区苏州园区机楼30N0001-EMS','moid':'9-2006-西楼里,9-2005-长桥'}"
		 * @return
		 */
		public function devLocate2(locateType:String, circName:String, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "devLocate");
			
			remote.devLocate(locateType, circName);
			remote = null;
		}
		
		/**
		 * 查询电路对应光路的管线的信息
		 * @param cuid
		 * @return
		 */
		public function getDevLocateByCuId(cuid:String, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getDevLocateByCuId");
			
			remote.getDevLocateByCuId(cuid);
			remote = null;
		}
		
		/**
		 * 根据光路查询电路信息
		 * @param paramMap
		 * @return
		 */
		public function getCircuitByOptic(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getCircuitByOptic");
			
			remote.getCircuitByOptic(paramMap);
			remote = null;
		}
		
		/**
		 * 根据机楼id查询机楼最高告警等级
		 * @param paramMap
		 * @return
		 */
		public function getSiteAlarmLevels(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getSiteAlarmLevels");
			
			remote.getSiteAlarmLevels(param);
			remote = null;
		}
		
		/**
		 * 根据大面积退服告警id查询 退服基站的传输资源
		 * @param paramMap
		 * @return
		 */
		public function getQuitBtsTransRes(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getQuitBtsTransRes");
			
			remote.getQuitBtsTransRes(param);
			remote = null;
		}
		
		/**
		 * 根据光缆段查询光路信息、根据物理管线查询光缆段信息
		 * @param paramMap
		 * @return
		 */
		public function queryRouteInfo(type:String, id:String, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result, type);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "getOpticOrCable");
			
			remote.queryRouteInfo(type, id);
			remote = null;
		}
		/**
		 * 根据光路编码查询出光路路由
		 * @param paramMap
		 * @return
		 */
		public function queryOpticalPathRoutingInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result, param);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "queryOpticalPathRoutingInfo");
			
			remote.queryOpticalPathRoutingInfo(param);
			remote = null;
		}
		/**
		 * 根据光路ID查询物理段（吊线段，管道段，虚连接）详细信息
		 * @param paramMap
		 * @return
		 */
		public function queryPhysicalSegmentInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result, param);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "queryPhysicalSegmentInfo");
			
			remote.queryPhysicalSegmentInfo(param);
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