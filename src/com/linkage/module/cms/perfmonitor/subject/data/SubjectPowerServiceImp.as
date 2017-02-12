package com.linkage.module.cms.perfmonitor.subject.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class SubjectPowerServiceImp implements SubjectPowerService
	{
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitor.subject.SubjectPowerServiceImp");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_perfmonitor_subject_subjectPowerService";
		//
		protected var remoteSource:String = "com.linkage.module.cms.perfmonitor.subject.serv.power.SubjectPowerService";
		
		public function SubjectPowerServiceImp(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}
		
		/**
		 * 停电基站统计
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return {title:"停电基站统计",
		 * name:["地市","停电基站数","停电基站比例","低电压基站数","低电压基站比例","一次下电基站数","一次下电基站比例"],
		 * column:["city","no_power","no_power_rate","low_power","low_power_rate","drop","drop_rate"],
		 * datalist:[{city:"全省", no_power:"10", no_power_rate:"2%", low_power:"10", low_power_rate:"2%", drop:"10", drop_rate:"2%"},
		 * {city:"南京", no_power:"10", no_power_rate:"2%", low_power:"10", low_power_rate:"2%", drop:"10", drop_rate:"2%"}]}
		 */
		public function btsNoPowerStat(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "btsNoPowerStat");
			
			remote.btsNoPowerStat(paramMap);
			remote = null;
		}
		
		/**
		 * 停电基站GIS撒点接口
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"} 
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","type":"1"}]
		 */
		public function btsNoPowerGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "btsNoPowerGisInfo");
			
			remote.btsNoPowerGisInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 停电基站资源列表
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","type":"1"}] 具体结构待定
		 */
		public function btsNoPowerList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "btsNoPowerList");
			
			remote.btsNoPowerList(paramMap);
			remote = null;
		}
		
		/**
		 * 停电基站性能列表
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","perf_type_name":"掉话率","perf_value":"2%"]
		 */
		public function btsNoPowerPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "btsNoPowerPerfList");
			
			remote.btsNoPowerPerfList(paramMap);
			remote = null;
		}
		
		/**
		 * 蓄电池监控统计
		 * @param paramMap （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return {title:"蓄电池统计",
		 * name:["地市","低性能蓄电池","比例"],
		 * column:["city","low_power","rate"],
		 * datalist:[{city:"全省", low_power:"10", rate:"2%"},
		 * {city:"南京", low_power:"10", rate:"2%", }]}
		 */
		public function powerCellStat(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "powerCellStat");
			
			remote.powerCellStat(paramMap);
			remote = null;
		}
		
		/**
		 * 低性能蓄电池GIS撒点接口
		 * @param paramMap  （可以是全省、地市、区县） {city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172"}]
		 */
		public function lowPowerGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "lowPowerGisInfo");
			
			remote.lowPowerGisInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 单个蓄电池网元的详细信息（蓄电池网元和普通网元有区别，所以单独列出）
		 * @param paramMap {mo_id:"1111"}
		 * @return 格式待定
		 */
		public function powerCellDetail(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "powerCellDetail");
			
			remote.powerCellDetail(paramMap);
			remote = null;
		}
		
		/**
		 * 蓄电池统计趋势图
		 * @param paramMap {startTime:"2011-12-09 08:00:00",stopTime:"2011-12-09 20:00",type:"6",city:"0100"}
		 * @return [{time:"2011-12-09 08:00",value:"34"},{time:"2011-12-09 09:00",value:"23"}]
		 */
		public function getBatteryGraphic(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getBatteryGraphic");
			
			remote.getBatteryGraphic(paramMap);
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