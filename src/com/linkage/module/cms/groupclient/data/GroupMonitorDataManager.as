package com.linkage.module.cms.groupclient.data
{
	public interface GroupMonitorDataManager
	{
		function getNavTree(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getGroupCusStatic(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getAlarmGroupCusStatic(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getGroupCusStaticByCust(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getServByCust(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		//新增去除传输业务的功能，2014-2-18，汪炜
		function getServByCustForGs(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getServertarget(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getSLA(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustomServerInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getServerByCustom(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCityList(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getAllServ(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getServLevel(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getRealPm(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getPmList(param:Object,success:Function,complete:Function=null,error:Function=null):void;

		function getNewPmList(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getMoTypeList(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getGroupWarnStat(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		/**
		 * {"param":"参数"}
		 * @param paramMap {"产品编码":"product_id","集客ID:cust_no","开始时间：start_time","结束时间：end_time"}
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
		function getAlarmList(paramMap:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustEngineeringInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustEngineeringDetail(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustPerf(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustPerfTotal(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getCustNum(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getProInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getBaseInfoclientInfoQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getThicknessTableInfoQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getGroupCustDevInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
	 	
		function getServerDataByCustom(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		function getGroupCustAlarmInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		/**
		 * 
		 * @param param
		 * @param success
		 * @param complete
		 * @param error
		 * 
		 */
		
		function saveGroupCustomerInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
	}
}