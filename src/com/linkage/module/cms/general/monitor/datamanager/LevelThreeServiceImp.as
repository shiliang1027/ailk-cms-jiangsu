package com.linkage.module.cms.general.monitor.datamanager
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 获取数据的接口
	 * @author czm
	 *
	 */
	public class LevelThreeServiceImp implements LevelThreeService
	{
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.general.monitor.datamanager.LevelThreeServiceImp");

		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";

		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_general_level3_level3service";
		//
		protected var remoteSource:String = "com.linkage.module.cms.general.level3.serv.Level3ServImp";

		public function LevelThreeServiceImp()
		{
			
		}

		public function setEndPoint(context:String):void
		{
			endpoint = context + endpoint_SUFFIX;
		}

		/**
		 * 查询指定属地的信息
		 * @param 包含健值为city_id
		 * @return
		 */
		public function getCitySite(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
				}, true, "getCitySite");

			remote.getCitySite(param);
			remote = null;
		}

		/**
		 * 查询指定属地的网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		public function getResInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
				}, true, "getResInfo");

			remote.getResInfo(param);
			remote = null;
		}
		
		/**
		 * 查询指定属地的网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		public function getResInfoBts(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getResInfoBts");
			
			remote.getResInfoBts(param);
			remote = null;
		}
		
		/**
		 * 查询指定属地的网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		public function getResInfoCell(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getResInfoCell");
			
			remote.getResInfoCell(param);
			remote = null;
		}
		
		/**
		 * 查询指定属地的网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		public function getResInfoWlan(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getResInfoWLan");
			
			remote.getResInfoWLan(param);
			remote = null;
		}
		
		/**
		 * 查询指定属地的网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		public function getResInfoRoom(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getResInfoRoom");
			
			remote.getResInfoRoom(param);
			remote = null;
		}
		/**
		 * 查询指定属地的管线信息
		 * @param 包含健值为city_id
		 * @return
		 */
		public function getCityLinesInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getCityLineInfo");
			
			remote.getCityLinesInfo(param);
			remote = null;
		}
		/**
		 * 查询指定属地的退服网元信息
		 * @param 包含健值为city_id
		 * @return
		 */
		public function getQuitBtsStat(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getQuitBtsStat");
			
			remote.getQuitBtsStat(param);
			remote = null;
		}
		
		/**
		 * 查询指定属地的劣化小区信息
		 * @param 包含健值为city_id
		 * @return
		 */
		public function getBadCellStat(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getBadCellStat");
			
			remote.getBadCellStat(param);
			remote = null;
		}
		
		/**
		 * 查询指定属地的劣化小区信息
		 * @param 包含健值为mo_id\mo_type\mo_name
		 * @return
		 */
		public function getSingleBtsInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getSingleBtsInfo");
			
			remote.getSingleBtsInfo(param);
			remote = null;
		}
		
		/**
		 * 查询指定网元的管线信息
		 * @param 包含健值为mo_id
		 * @return
		 */
		public function getTransferInfo(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getTransferInfo");
			
			remote.getTransferInfo(param);
			remote = null;
		}
		
		/**
		 * 获取场景内告警信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景 ID"}
		 * @return 
		 *         {"bts":[{"mo_id":"网元id","alarm_level":"最高告警级别","quitreason":"退服专业"
		 *         ,"mo_status":"网元状态"," subject":"退服原因"},……], "nodeb": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","
		 *         quitreason":"退服专业","mo_status":"网元状态"," subject":"退服原因"},……],
		 *         "bad_cell": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "bad_ucell": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "worst_cell": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "worst_ucell": [{"mo_id":"
		 *         网元id","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "wlan_hot":[
		 *         {"mo_id":"网元ID","alarm_level":"最高告警级别","mo_status":"网元状态"},……],
		 *         "machine_room":[
		 *         {"mo_id":"机楼 ID","alarm_level":"最高告警级别","mo_status":"网元状态"},……]，
		 *         "venue"
		 *         ：[{"mo_id":"场馆 ID","alarm_level":"最高告警级别","mo_status":"网元状态"
		 *         },……]}
		 */
		public function getResAlarmInfo(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getResAlarmInfo");
			
			remote.getResAlarmInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 获取覆盖范围数据
		 * 
		 * @param paramMap
		 *            {"city_id":"属地ID","mo_type_id":"网元类型"}
		 * @return 如果为MSC/BSC/RNC：{"网元名称":["4323(GIS对象ID)","4325(GIS对象ID)",......
		 *         ],......};如果为BTS：{"bts":["4323(GIS对象ID)","4325(GIS对象ID)",......
		 *         ]};如果为NODEB：{"nodeb":["4323(GIS对象ID)","4325(GIS对象ID)",...... ]}
		 */
		public function getCoverData(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result, String(paramMap.type_name));
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "getCoverData");
			
			remote.getCoverData(paramMap);
			remote = null;
		}
		
		/**
		 * 获取性能指标渲染数据
		 * 
		 * @param paramMap
		 *            {"city_id":"属地ID","perf_type_id":"性能指标，1：用户数；2：话务量；3：接通率"，4：无线利用率
		 *            ，5：拥塞率}
		 * @return [{"mo_id":"网元id","perf_value":"性能值","color":"颜色"},......]
		 */
		public function getDrawData(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result, String(paramMap.type_name));
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "getDrawData");
			
			remote.getDrawData(paramMap);
			remote = null;
		}
		
		/**
		 * 查询天气信息
		 * 
		 * @param cityId
		 * @return
		 */
		public function getWeatherInfo(cityId:String,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getWeatherInfo");
			
			remote.getWeatherInfo(cityId);
			remote = null;
		}
		
		/**
		 * 查询所有故障网元
		 * 
		 * @param cityId
		 * @return
		 */
		public function getAllQuitBts(success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getAllQuitBts");
			
			remote.getAllQuitBts();
			remote = null;
		}
		
		/**
		 * 查询基站的用户数性能信息
		 * @param paramMap 包括参数mo_id
		 * @return
		 */
		public function getBtsUserPerf(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getBtsUserPerf");
			
			remote.getBtsUserPerf(paramMap);
			remote = null;
		}
		
		/**
		 * 查询覆盖范围信息
		 * @param paramMap
		 * @return
		 */
		public function queryCoverAreaByMo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "queryCoverAreaByMo");
			
			remote.queryCoverAreaByMo(paramMap);
			remote = null;
		}
		
		/**
		 * 根据光路信息查询基站信息
		 * @param paramMap
		 * @return
		 */
		public function getDevByRoute(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getDevByRoute");
			
			remote.getDevByRoute(paramMap);
			remote = null;
		}
		
		/**
		 * 查询基站的用户数性能数据
		 * @param moIds
		 * @return
		 */
		public function getUserPerfByBts(moIds:Array, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getUserPerfByBts");
			
			remote.getUserPerfByBts(moIds);
			remote = null;
		}
		
		/**
		 * 按类型统计基站
		 * @param paramMap
		 * @return
		 */
		public function getBtsTypeStat(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getBtsTypeStat");
			
			remote.getBtsTypeStat(paramMap);
			remote = null;
		}
		
		/**
		 * 查询光路的告警信息
		 * @param circuitName
		 * @return
		 */
		public function getOpticAlarmInfo(circuitName:String, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getOpticAlarmInfo");
			
			remote.getOpticAlarmInfo(circuitName);
			remote = null;
		}
		
		/**
		 * 查询概况信息
		 */
		public function queryGeneralInfos(param:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "queryGeneralInfos");
			
			remote.queryGeneralInfos(param);
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