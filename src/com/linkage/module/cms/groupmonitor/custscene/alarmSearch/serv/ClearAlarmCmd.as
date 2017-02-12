package com.linkage.module.cms.groupmonitor.custscene.alarmSearch.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.alarmSearch.dao.AlarmSignDao;
	import com.linkage.module.cms.groupmonitor.custscene.alarmSearch.dao.IAlarmSignDao;
	import com.linkage.module.cms.groupmonitor.custscene.alarmSearch.domain.AlarmSignDM;
	import com.linkage.module.cms.groupmonitor.custscene.alarmSearch.event.AlarmSignEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2013-2-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ClearAlarmCmd
	{
		private var log:ILogger = Log.getLoggerByClass(ClearAlarmCmd);

		[Inject("alarmSignDao")]
		public var alarmSignDao:IAlarmSignDao;
		[Inject("alarmSignDM")]
		public var alarmSignDM:AlarmSignDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:AlarmSignEvent):AsyncToken
		{
			log.debug("[标记清除]:查询告警标记cmd捕获事件...");
			return alarmSignDao.clearAlarm(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[标记清除]: result info ...");
			log.debug(data);
			this.alarmSignDM.clearResult = data as String;
			msgDispatcher(new AlarmSignEvent(AlarmSignEvent.CMS_ALARMSEARCH_ALARM_DELETE_REAUTL));
		}

		public function error(f:Fault):void
		{
			log.error("[标记清除]:查询列表cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}