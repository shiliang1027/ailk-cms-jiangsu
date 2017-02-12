package com.linkage.module.cms.perfmonitor.subject.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class SubjectWlanServiceImp implements SubjectWlanService
	{
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitor.subject.SubjectWlanServiceImp");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_perfmonitor_subject_subjectWlanService";
		//
		protected var remoteSource:String = "com.linkage.module.cms.perfmonitor.subject.serv.wlan.SubjectWlanService";
		
		public function SubjectWlanServiceImp(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}
		
		/**
		 * 退服AP统计接口
		 * @return {title:"AP退服统计",
		 * name:["地市","AP退服数","AP退服比例"],
		 * column:["city","quit_ap","quit_rate"],
		 * datalist:[{city:"全省", quit_ap:"10", quit_rate:"2%"},{city:"南京", quit_ap:"10", quit_rate:"2%"}]}
		 *
		 */
		public function quitApStat(success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "quitApStat");
			
			remote.quitApStat();
			remote = null;
		}
		
		/**
		 * 零业务热点统计列表
		 * @return {title:"零业务热点统计",
		 * name:["地市","零业务热点数","零业务热点比例"],
		 * column:["city","zero_wlan","zero_rate"],
		 * datalist:[{city:"全省", zero_wlan:"10", zero_rate:"2%"},
		 * {city:"南京", zero_wlan:"10", zero_rate:"2%"}]}
		 */
		public function zeroWlanStat(success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "zeroWlanStat");
			
			remote.zeroWlanStat();
			remote = null;
		}
		
		/**
		 * 退服AP和零业务热点GIS撒点接口
		 * @param paramMap {type："1：AP退服，2：零业务热点"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","type":"1"}]
		 */
		public function wlanGisInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "wlanGisInfo");
			
			remote.wlanGisInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 所有AP、热点GIS撒点接口
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","type":"1"}]
		 */
		public function wlanGisCityInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "wlanGisCityInfo");
			
			remote.wlanGisCityInfo(paramMap);
			remote = null;
		}
		
		/**
		 * AP和热点资源列表
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","longitude":"113.259518","latitude":"23.13172","type":"1"}]待定
		 */
		public function wlanResList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "wlanResList");
			
			remote.wlanResList(paramMap);
			remote = null;
		}
		
		/**
		 * AP和热点性能列表
		 * @param paramMap （可以是全省、地市、区县）{city_id:"0008",city_layer:"2"}
		 * @return [{"mo_id":"1","mo_name":"test","perf_type_name":"掉话率","perf_value":"2%"]
		 */
		public function wlanPerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "wlanPerfList");
			
			remote.wlanPerfList(paramMap);
			remote = null;
		}
		
		/**
		 * 零业务热点趋势图
		 * @param paramMap {startTime:"2011-12-09 08:00:00",stopTime:"2011-12-09 20:00",type:"7",city:"0100"}
		 * @return [{time:"2011-12-09 08:00",value:"34"},{time:"2011-12-09 09:00",value:"23"}]
		 */
		public function wlanGrophic(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "wlanGrophic");
			
			remote.wlanGrophic(paramMap);
			remote = null;
		}
		
		/**
		 * 退服AP
		 * @param paramMap {startTime:"2011-12-09 08:00:00",stopTime:"2011-12-09 20:00",type:"7",city:"0100"}
		 * @return [{time:"2011-12-09 08:00",value:"34"},{time:"2011-12-09 09:00",value:"23"}]
		 */
		public function quitApGrophic(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "quitApGrophic");
			
			remote.quitApGrophic(paramMap);
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