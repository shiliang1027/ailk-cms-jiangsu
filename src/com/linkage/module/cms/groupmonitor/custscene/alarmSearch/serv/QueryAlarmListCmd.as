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
	public class QueryAlarmListCmd
	{
		private var log:ILogger = Log.getLoggerByClass(QueryAlarmListCmd);

		[Inject("alarmSignDao")]
		public var alarmSignDao:IAlarmSignDao;
		[Inject("alarmSignDM")]
		public var alarmSignDM:AlarmSignDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:AlarmSignEvent):AsyncToken
		{
			log.debug("[告警标记]:查询告警标记cmd捕获事件...");
			return alarmSignDao.queryAlarmSignList(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[告警标记]: result info ...");
			log.debug(data);
			log.debug(data.countTotal);
			log.debug(data.datas as ArrayCollection);
			alarmSignDM.alarmSignList.removeAll();
			alarmSignDM.alarmSignList.addAll(data.datas as IList);
			alarmSignDM.countTotal = data.countTotal;
			alarmSignDM.alarmSignList.refresh();
			log.debug("DM信息...");
			log.debug(alarmSignDM.alarmSignList);
			log.debug(alarmSignDM.countTotal);
			msgDispatcher(new AlarmSignEvent(AlarmSignEvent.CMS_ALARMSEARCH_SHOW_DATA));



		}

		public function error(f:Fault):void
		{
			log.error("[告警标记]:查询列表cmd返回失败..." + f.faultString + "," + f.faultDetail);
			var arr:ArrayCollection = new ArrayCollection([{"alarmuniqueid": "001", "alarmtile": "111", "alarmlevel": "1", "eventtime": "20130101", "daltime": "20130101", "custno": "01", "prodno": "000", "businesssystem": "1", "commname": "1"}, {"alarmuniqueid": "002", "alarmtile": "111", "alarmlevel": "1", "eventtime": "20130101", "daltime": "20130101", "custno": "01", "prodno": "000", "businesssystem": "1", "commname": "1"}, {"alarmuniqueid": "003", "alarmtile": "111", "alarmlevel": "1", "eventtime": "20130101", "daltime": "20130101", "custno": "01", "prodno": "000", "businesssystem": "1", "commname": "1"}]);
			alarmSignDM.alarmSignList = arr;
			log.debug(alarmSignDM.alarmSignList);
			msgDispatcher(new AlarmSignEvent(AlarmSignEvent.CMS_ALARMSEARCH_SHOW_DATA));
		}
	}
}