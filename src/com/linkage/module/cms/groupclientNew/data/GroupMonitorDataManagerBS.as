package com.linkage.module.cms.groupclientNew.data
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class GroupMonitorDataManagerBS implements GroupMonitorDataManager
	{
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclientNew.data.GroupMonitorDataManagerBS");
		private static const DESTINATION:String="flexdestination_cms_groupcustom_monitor_groupcustomservice";
		private static const SOURCE:String="com.linkage.module.cms.groupcustom.single.serv.MonitorServImp";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		public function GroupMonitorDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}
		
		public function getNavTree(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getNavTree");
			remoteService.getNavTree(param);
		}
		
		public function getGroupCusStatic(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getGroupCusStatic");
			remoteService.getGroupCusStatic(param);
		}
		
		public function getAlarmGroupCusStatic(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getAlarmGroupCusStatic");
			remoteService.getAlarmGroupCusStatic(param);
		}
		
		public function getGroupCusStaticByCust(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getGroupCusStaticByCust");
			remoteService.getGroupCusStaticByCust(param);
		}
		
		public function getServByCust(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getServByCust");
			remoteService.getServByCust(param);
		}
		
		public function getServByCustForGs(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getServByCustForGs");
			remoteService.getServByCustForGs(param);
		}
		
		public function getServertarget(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getServertarget");
			remoteService.getServertarget(param);
		}
		
		public function getSLA(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getSLA");
			remoteService.getSLA(param);
		}
		
		public function getCustomServerInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getCustomServerInfo");
			remoteService.getCustomServerInfo(param);
		}
		
		public function getServerByCustom(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getServerByCustom");
			remoteService.getServerByCustom(param);
		}
		
		public function getCityList(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----getCityList :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getCityList :失败：" + event.fault.faultString);
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getCityList");
			log.info("-----getCityList ,参数： param:{0}", param);
			remoteService.getCityList(param);
			remoteService=null;
		}
		
		public function getAllServ(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getAllServ");
			remoteService.getAllServ();
		}
		
		public function getServLevel(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getServLevel");
			remoteService.getServLevel();
		}
		
		public function getRealPm(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getRealPm");
			remoteService.getRealPm(param);
		}
		
		public function getPmList(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getPmList");
			remoteService.getPmList(param);
		}
		
		public function getNewPmList(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("getNewPmList请求成功！");
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("getNewPmList请求失败！--->"+event.message.toString());
				error.call(null, event);
			}, true, "getNewPmList");
			remoteService.getNewPmList(param);
		}
		public function getGroupWarnStat(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getGroupWarnStat");
			remoteService.getGroupWarnStat(param);
		}
		
		
		/**
		 * 
		 * 根据业务类型查询设备类型
		 **/ 
		public function getMoTypeList(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----getMoTypeList :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getMoTypeList :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"getMoTypeList");
			
			log.info("-----getMoTypeList ,参数： param:{0}", param);
			remoteService.getMoTypeList(param);
			remoteService=null;
		}

		
		/**
		 * {"param":"参数"}
		 * @param paramMap {"产品编码":"product_id","集客ID:cust_no"}
		 * @return[{"city_name":"地市",
		 *         "vendor_name":"厂商","serv_type":"业务类型","mo_name
		 *         ":"网元名称","alarm_level
		 *         ":"告警级别","alarm_stat":"告警状态","alarm_title":"告警标题","
		 *         ackflag":"确认状态","
		 *         sheetstatus":"工单状态","sheetsendstatus":"派单状态","project_stat
		 *         ":"工程状态"," vendorserialno":"告警流水号","
		 *         sheetno":"工单编号","filter_name":"过滤器名称"," sendgroupflag":"是否上报集团","
		 *         ifsoundalarm":"是否声光告警"," is_related":"是否关联告警","
		 *         ifabnormal":"是否异常告警","start_time":"开始时间","end_time":"结束时间","
		 *         gather_id":"采集点"," alarmuniqueid":"告警唯一标识"},……]
		 */
		public function getAlarmList(paramMap:Object,success:Function,complete:Function=null,error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null,event);
			}, true, "getAlarmList");
			remoteService.getAlarmList(paramMap);
		}
		
		public function getCustEngineeringInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getCustEngineeringInfo");
			remoteService.getCustEngineeringInfo(param);
		}
		
		public function getCustEngineeringDetail(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getCustEngineeringDetail");
			remoteService.getCustEngineeringDetail(param);
		}

		public function getCustPerf(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getCustPerf");
			remoteService.getCustPerf(param);
		}
		
		public function getCustPerfTotal(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getCustPerfTotal");
			remoteService.getCustPerfTotal(param);
		}
		
		public function getCustNum(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getCustNum");
			remoteService.getCustNum(param);
		}
		
		public function getProInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getProInfo");
			remoteService.getProInfo(param);
		}
		
		public function queryFaultInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "queryFaultInfo");
			remoteService.queryFaultInfo(param);
		}
		
		public function queryComplainInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "queryComplainInfo");
			remoteService.queryComplainInfo(param);
		}
		
		public function getComplaintDetail(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "getComplaintDetail");
			remoteService.getComplaintDetail(param);
		}
		public function queryProjectInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error(event.message.toString());
				error.call(null, event);
			}, true, "queryProjectInfo");
			remoteService.queryProjectInfo(param);
		}
	}
}