package com.linkage.module.cms.general.regional.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * GIS视图数据接口
	 * @author czm
	 *
	 */
	public class GisServImp implements GisServ
	{
		
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.general.regional.data.GisServImp");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_general_regional_gisservice";
		//
		protected var remoteSource:String = "com.linkage.module.cms.general.regional.view.gis.serv.GisServ";
		
		public function GisServImp(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}

		/**
		 * 获取场景信息
		 * 
		 * @param paramMap
		 *            {"monitor_type":"场景类型","accounts":"用户名，如：admin"}
		 * @return [{"monitor_id":"场景ID","monitor_name":"场景名称","
		 *         relevant_view":"关联视图","icon":"场景天气图标路径"},……] ,关联视图：格式为1,2,3,....
		 *         解释如下： 1:主视图 2：漫游视图 3：场馆视图 4：现场图片视图
		 */
		public function getScene(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getScene");
			
			remote.getScene(paramMap);
			remote = null;
		}
		
		/**
		 * 获取场景实时（历史）信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景
		 *            ID","type":"类型，1：实时，实时的需要传当前轮巡的指标ID和网元类型；2：历史
		 *            ，历史数据需要传时间","time"
		 *            :"时间","mo_type_id":"网元类型，可以为空","perf_type_id":"指标ID,可以为空"}
		 * @return { "bts": [{"mo_id":" 网元id","mo_name":"网元名称"," longitdue":"经度","
		 *         latitude":"纬度","
		 *         mo_type":"网元类型","vip_type":"vip类型","alarm_level":"最高告警级别","
		 *         quitreason":"退服专业","mo_status":"网元状态","work_stat":"工程状态","
		 *         subject":"退服原因"},……], "nodeb": [{"mo_id":"
		 *         网元id","mo_name":"网元名称"," longitue":"经度"," latitude":"纬度","":"
		 *         mo_type":"网元类型","vip_type":"vip类型","alarm_level":"最高告警级别","
		 *         quitreason":"退服专业","mo_status":"网元状态","work_stat":"工程状态","
		 *         subject":"退服原因"},……], "cell":[ {"mo_id":"
		 *         网元id","mo_name":"网元名称"," longitue":"经度"," latitude":"纬度","":"
		 *         mo_type
		 *         ":"网元类型","alarm_level":"最高告警级别","mo_status":"网元状态","work_stat
		 *         ":"工程状态" },……], "ucell": [ {"mo_id":" 网元id","mo_name":"网元名称","
		 *         longitue":"经度"," latitude":"纬度","":"
		 *         mo_type":"网元类型","alarm_level"
		 *         :"最高告警级别","mo_status":"网元状态","work_stat":"工程状态" },……],
		 *         "bad_cell": [{"mo_id":" 网元id","mo_name":"网元名称"," longitue":"经度","
		 *         latitude":"纬度","":"
		 *         mo_type":"网元类型","alarm_level":"最高告警级别","mo_status
		 *         ":"网元状态","work_stat":"工程状态" },……], "bad_ucell": [{"mo_id":"
		 *         网元id","mo_name":"网元名称"," longitdue":"经度"," latitude":"纬度","":"
		 *         mo_type
		 *         ":"网元类型","alarm_level":"最高告警级别","mo_status":"网元状态","work_stat
		 *         ":"工程状态" },……], "worst_cell": [{"mo_id":"
		 *         网元id","mo_name":"网元名称"," longitue":"经度"," latitude":"纬度","":"
		 *         mo_type
		 *         ":"网元类型","alarm_level":"最高告警级别","mo_status":"网元状态","work_stat
		 *         ":"工程状态" },……], "worst_ucell": [{"mo_id":"
		 *         网元id","mo_name":"网元名称"," longitdue":"经度"," latitude":"纬度","
		 *         mo_type
		 *         ":"网元类型","alarm_level":"最高告警级别","mo_status":"网元状态","work_stat
		 *         ":"工程状态"},……], "wlan_hot":[{"mo_id":"网元ID","mo_name":"网元名称", "
		 *         longitdue":"经度"," latitude":"纬度", "
		 *         mo_type":"网元类型","alarm_level":"最高告警级别"},……], "machine_room":[
		 *         {"mo_id":"机楼 ID","mo_name":"机楼名称", " longitdue":"经度","
		 *         latitude":"纬度", " mo_type":"机楼类型，一个机楼的机楼类型可能会有多种，多种以逗号分隔
		 *         ","alarm_level":"最高告警级别"},……]， "venue"：[{"mo_id":"场馆
		 *         ID","mo_name":"场馆名称", " longitdue":"经度","
		 *         latitude":"纬度","alarm_level":"最高告警级别"},……], "oil":[{ "mo_id":"油机
		 *         ID","mo_name":"油机名称", " longitdue":"经度"," latitude":"纬度" }],
		 *         "communicationcar":[ { "mo_id":"通信车 ID","mo_name":"通信车名称", "
		 *         longitdue":"经度"," latitude":"纬度" }], "emergency_use":[{
		 *         "communicationcar
		 *         ":{"total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述
		 *         "},"person":{
		 *         "total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述"}
		 *         ,"oilmachine":{
		 *         "total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述"}," fiber":{
		 *         "total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述"},"
		 *         oilplants":{
		 *         "total_num":"总数量","use_num":"使用的数量","desc":"使用情况描述"}}]}
		 */
		public function getSceneInfo(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getSceneInfo");
			
			remote.getSceneInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 获取概况信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID" ,
		 *            "type":"类型，1：实时，实时的需要传当前轮巡的指标ID和网元类型；2：历史
		 *            ，历史数据需要传时间","time":"时间，10位的秒数" }
		 * @return [{"show_name":"指标名称","perf_value":"指标值","stat_time":" 统计时间","
		 *         compare_num":" 较平时变化数量"," compare_rate":"变化百分比","
		 *         compare_flag":"增减标识","stat_type":"统计分类"},……]
		 */
		public function getGeneralInfo(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getGeneralInfo");
			
			remote.getGeneralInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 获取保障简讯
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID" }
		 * @return {"news":"简讯内容"}
		 */
		public function getEnsureNews(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getEnsureNews");
			
			remote.getEnsureNews(paramMap);
			remote = null;
		}
		
		/**
		 * 获取单网元性能信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID", "mo_type_id":"网元类型", "mo_id":"网元ID" ,
		 *            "type
		 *            ":"类型，1：实时，实时的需要传当前轮巡的指标ID和网元类型；2：历史，历史数据需要传时间","time":"时间
		 *            ，10位的秒数" }
		 * @return 
		 *         {"mo_id":"网元id","mo_name":"网元名称","perf_info":[{"show_name":"指标名称",
		 *         "perf_value":"指标值","stat_time":"统计时间"},……]}
		 */
		public function getSingleNePerf(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getSingleNePerf");
			
			remote.getSingleNePerf(paramMap);
			remote = null;
		}
		
		/**
		 * 获取应急资源详细信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID","emergency_id":"应急资源ID","
		 *            emergency_type":" 应急资源类型" }
		 * @return {"res_name":"资源名称","res_desc":"资源描述"}
		 */
		public function getEmergencyDetail(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getEmergencyDetail");
			
			remote.getEmergencyDetail(paramMap);
			remote = null;
		}
		
		/**
		 * 获取天气情况
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景 ID" ,
		 *            "type":"类型，1：实时，实时的需要传当前轮巡的指标ID和网元类型；2：
		 *            历史，历史数据需要传时间","time":"时间，10位的秒数" }
		 * @return [{"icon":"图片路径","longitue":"经度","
		 *         latitude":"纬度","weather_desc":"天气情况描述" },……]},……]
		 */
		public function getWeatherInfo(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			
			remote.getWeatherInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 获取传输电路信息
		 * 
		 * @param paramMap
		 *            {"mo_id":"网元 ID","mo_type_id":"网元类型"}
		 * @return [{"circuit_id":"电路编码"," circuit_name":"电路名称" },……]
		 */
		public function getTransferInfo(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			
			remote.getTransferInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 获取历史灾情
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景 ID","start_time":"开始时间","end_time":" 结束时间"}
		 * @return [{ "disaster_type":"灾情类型","longitue":"经度"," latitude":"纬度","
		 *         disaster _desc":"灾情描述","wind_info":[{"time":"时间"," longitue":"
		 *         经度"," latitude":" 纬度"," wind_speed":"风速"," bts_num":"影响基站数量"},……]
		 *         },……]},……]
		 */
		public function getHisDisaster(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getHisDisaster");
			
			remote.getHisDisaster(paramMap);
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
		public function getSceneAlarmInfo(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getSceneAlarmInfo");
			
			remote.getSceneAlarmInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 获取资源列表信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID" }
		 * @return {"cell":[{"mo_name":"小区名称","bts_name":"归属基站名称","vip_type":"基站类型"
		 *         ,"city_name ":"属地","bsc_name":"归属bsc名称","msc_name":"归属MSC"
		 *         },……],"ucell"
		 *         :[{"mo_name":"小区名称","bts_name":"归属基站名称","vip_type":"基站类型"
		 *         ,"city_name ":"属地","bsc_name":"归属rnc名称","msc_name":"归属MSC" },……]}
		 */
		public function getNeList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getNeList");
			
			remote.getNeList(paramMap);
			remote = null;
		}
		
		/**
		 * 获取网元性能列表信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID", "type":"类型，1：实时；2：
		 *            历史，历史数据需要传时间","time":"时间，10位的秒数"}
		 * @return 
		 *         {"cell":{"column":["","",……],"name":["",……],"datalist":[{"":"",},…
		 *         …]},"ucell":{"column":["","",……],"name":["",……],"datalist":[{"":"
		 *         ",},……]}}
		 */
		public function getNePerfList(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getNePerfList");
			
			remote.getNePerfList(paramMap);
			remote = null;
		}
		
		/**
		 * 获取缩略图信息
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景 ID","perf_type":"指标ID"}
		 * @return {"1308672000":[
		 *         {"grid_id":"1","longitude":"113.259518","latitude"
		 *         :"23.13172","width"
		 *         :"100","heigth":"100","color":"0x555555"},....]}
		 */
		public function getBreviaryInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getBreviaryInfo");
			
			remote.getBreviaryInfo(paramMap);
			remote = null;
		}
		
		/**
		 * 获取指标渲染数据
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID","perf_type":"指标ID","type":"1:实时；2：历史","time"
		 *            :"历史的数据需传，秒数"}
		 * @return [
		 *         {"grid_id":"1","longitude":"113.259518","latitude":"23.13172","width"
		 *         :"100","heigth":"100","color":"0x555555"},
		 *         {"grid_id":"2","longitude"
		 *         :"114.259518","latitude":"24.13172","width"
		 *         :"100","heigth":"100","color":"0x555555"},
		 *         {"grid_id":"3","longitude"
		 *         :"113.259518","latitude":"24.13172","width"
		 *         :"100","heigth":"100","color":"0x555555"} ]
		 */
		public function getPerfDraw(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getPerfDraw");
			
			remote.getPerfDraw(paramMap);
			remote = null;
		}
		
		/**
		 * 获取覆盖范围数据
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID","mo_type_id":"网元类型"}
		 * @return 如果为MSC/BSC/RNC：{"网元名称":["4323(GIS对象ID)","4325(GIS对象ID)",......
		 *         ],......};如果为BTS：{"bts":["4323(GIS对象ID)","4325(GIS对象ID)",......
		 *         ]};如果为NODEB：{"nodeb":["4323(GIS对象ID)","4325(GIS对象ID)",...... ]}
		 */
		public function getCoverData(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result, paramMap.type_name);
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
		
		private function doNoParamCallBack(complete:Function):void
		{
			if (complete != null)
			{
				complete.call(null);
			}
		}
		
		public function getAreaBorder(param:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "getAreaBorder");
			
			log.info(" MapChooseDataManagerDS 查询框选区域数据 。。。 monitorId:" + param['monitor_id']);
			remoteService.getAreaBorder(param);
		}
		
		public function getPerfData(param:Object, success:Function, error:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("【获取性能指标】成功");
				success.call(this, result);
			}, function():void
			{
				log.info("【获取性能指标】失败");
			});
			log.info("【获取性能指标】开始");
			remoteService.getPerfData(param);
		}
		
		public function getBackImg(param:Object, success:Function, error:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("【获取场景背景图片】成功");
				success.call(this, result);
			}, function():void
			{
				log.info("【获取场景背景图片】失败");
			});
			log.info("【获取场景背景图片】开始");
			remoteService.getBackImg(param);
		}
		
		public function editBaseValue(param:Object, success:Function, error:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("【编辑预案方案值】成功");
				success.call(this, result);
			}, function():void
			{
				log.info("【编辑预案方案值】失败");
			});
			log.info("【编辑预案方案值】开始");
			remoteService.editBaseValue(param);
		}
		
		public function getEmPerfType(param:Object, success:Function, error:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("【获取重点指标】成功");
				success.call(this, result);
			}, function():void
			{
				log.info("【获取重点指标】失败");
			});
			log.info("【获取重点指标】开始");
			remoteService.getEmPerfType(param);
		}
		
		public function editIsShow(param:Object, success:Function, error:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("【编辑重点指标】成功");
				success.call(this, result);
			}, function():void
			{
				log.info("【编辑重点指标】失败");
			});
			log.info("【编辑重点指标】开始");
			remoteService.editIsShow(param);
		}
	}
}