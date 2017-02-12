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
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KPIChartCmd
	{
		private var log:ILogger = Log.getLoggerByClass(KPIChartCmd);

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
			log.debug("[指标详情]:execute开始执行..user.kpiId=" + user.kpiId + ",user.timeInterval=" + user.timeInterval + ",user.moTypeId=" + user.moTypeId + ",user.dateFlag=" + user.dateFlag);
			log.info(user);
			systime = (new Date()).getTime();
			return scenePanelDao.getKpiHisByKpiId(user);
		}

		public function result(data:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.debug("[指标详情]:result 返回结果集 " + data.length);
			this.kpiSituationDM.kpiCharData.removeAll();
			this.kpiSituationDM.kpiCharData.addAll(data as IList);

			log.debug("[指标详情]:抛出处理详情图表事件 －－－指标趋势：SHOW_LINE_DATA");
			var kpiChartEvent:KPISituationEvent = new KPISituationEvent(KPISituationEvent.SHOW_LINE_DATA);
			kpiChartEvent.kpiDetailChartData.removeAll();
			kpiChartEvent.kpiDetailChartData.addAll(kpiSituationDM.kpiCharData);
			msgDispatcher(kpiChartEvent);
			msgDispatcher(new Event("REQUEST_COMPLETE"));

		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("[指标详情]:cmd命令返回失败error..." + f.faultString + "\n" + f.faultDetail);
		}
	}
}

