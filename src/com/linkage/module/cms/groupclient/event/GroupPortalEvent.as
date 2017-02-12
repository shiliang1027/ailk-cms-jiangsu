package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;
	
	public class GroupPortalEvent extends Event
	{
		//业务故障概况
		public static const GET_ALARM_INFO:String = "getAlarmInfo";
		//消息提醒
		public static const GET_MSG_INFO:String = "getMsgInfo";
		//服务质量全流程概况
		public static const GET_SERVICE_QA_CIRCUIT="getServiceQACircuit";
		//SLA越限
		public static const GET_SLA_ALARM="getSLAAlarm";
		//服务质量越限
		public static const GET_SERVICE_QA_ALARM="getServiceQAAlarm";
		public var param:Object;
		public var currentPage:int;
		public var pageSize:int;
		public function GroupPortalEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
