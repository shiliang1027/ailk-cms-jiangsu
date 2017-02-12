package com.linkage.module.cms.specialty.alarmSearch.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.specialty.alarmSearch.dao.AlarmSignDao;
	import com.linkage.module.cms.specialty.alarmSearch.dao.IAlarmSignDao;
	import com.linkage.module.cms.specialty.alarmSearch.domain.AlarmSignDM;
	import com.linkage.module.cms.specialty.alarmSearch.event.AlarmSignEvent;

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
	public class ClearSignCmd
	{

		[Inject("alarmSignDao")]
		public var alarmSignDao:IAlarmSignDao;
		[Inject("alarmSignDM")]
		public var alarmSignDM:AlarmSignDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;
		private var log:ILogger = Log.getLoggerByClass(ClearSignCmd);

		public function execute(e:AlarmSignEvent):AsyncToken
		{
			log.debug("[标记]:查询告警标记cmd捕获事件...");
			log.debug(e.param);
			return alarmSignDao.remove(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[标记]: result info ...");
			log.debug(data);
			var evt:AlarmSignEvent = new AlarmSignEvent(AlarmSignEvent.CMS_ALARMSEARCH_ALARM_SIGN_RESULT);
			evt.param = data;
			msgDispatcher(evt);
		}

		public function error(f:Fault):void
		{
			log.error("[标记]:查询列表cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}