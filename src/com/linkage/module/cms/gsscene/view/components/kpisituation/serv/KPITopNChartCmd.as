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

	/*xudx
	 */
	public class KPITopNChartCmd
	{
		private var log:ILogger = Log.getLoggerByClass(KPITopNChartCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("kPISituationDM")]
		public var kpiSituationDM:KPISituationDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("user")]
		public var user:IUser;

		private var systime:Number = 0;


		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("[指标详情]:execute开始执行..user.kpiId=" + user.kpiId + ",user.areaId=" + user.areaId + ",user.moTypeId=" + user.moTypeId + ",user.dateFlag=" + user.dateFlag);
			log.info(user);
			systime = (new Date()).getTime();
			return scenePanelDao.getTopNAreaList(user);
		}

		public function result(data:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.debug("[指标详情]:result 返回结果集 " + data.length);
//			log.info(data as IList);

			log.debug("[指标详情]:抛出处理区域指标详情图表事件：SHOW_KPI_AREA_DATA");
//			log.debug(data);
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.SHOW_KPI_AREA_DATA);
			e.areaKpiData.removeAll();
			e.areaKpiData.addAll(data as IList);
			msgDispatcher(e);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.debug("[指标详情]:抛出处理区域指标详情图表事件：SHOW_KPI_AREA_DATA 成功！");
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("[指标详情]:cmd命令返回失败error..." + f.faultString + "\n" + f.faultDetail);
		}
	}
}

