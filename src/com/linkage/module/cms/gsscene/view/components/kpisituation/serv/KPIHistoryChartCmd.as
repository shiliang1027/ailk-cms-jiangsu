package com.linkage.module.cms.gsscene.view.components.kpisituation.serv
{

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.kpisituation.KPISituationDM;
	import com.linkage.module.cms.gsscene.view.components.kpisituation.event.KPISituationEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author xudx
	 *
	 */
	public class KPIHistoryChartCmd
	{
		private var log:ILogger = Log.getLoggerByClass(KPIHistoryChartCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("kPISituationDM")]
		public var kpiSituationDM:KPISituationDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("user")]
		public var user:IUser;


		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("[指标详情]:execute开始执行..user.kpiId=" + user.kpiId + ",user.timeInterval=" + user.timeInterval+",user.moTypeId="+user.moTypeId+",user.dateFlag="+ user.dateFlag);
			log.info(user);
			return scenePanelDao.getKpiHisByKpiId(user);
		}

		public function result(data:Object):void
		{
			log.debug("[指标详情]:result 返回结果集 " + data.length);
			log.info(data as IList);
			this.kpiSituationDM.kpiCharData.removeAll();
			this.kpiSituationDM.kpiCharData.addAll(data as IList); 
			this.kpiSituationDM.kpiCharData.refresh(); 

			log.debug("[指标详情]:抛出处理历史趋势事件 －－－指标趋势：SHOW_HISTORY_LINE_DATA");
			var kpiChartEvent:KPISituationEvent = new KPISituationEvent(KPISituationEvent.SHOW_HISTORY_LINE_DATA);
			msgDispatcher(kpiChartEvent);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.debug("[指标详情]:cmd命令返回失败error..." + f.faultString + "\n" + f.faultDetail);
		}
	}
}


