package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.domain.KPISituationDM;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.KPISituationEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	/**
	 *
	 *
	 * @author xudx 
	 * @version 1.0
	 * @date 2012-11-08
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KPIChartCompareCmd
	{
		private var log:ILogger = Log.getLoggerByClass(KPIChartCompareCmd);
		
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
			log.debug("[指标详情]:execute开始执行..user.kpiId=" + user.kpiId + ",user.timeInterval=" + user.timeInterval + ",user.moTypeId=" + user.moTypeId + ",user.dateFlag=" + user.dateFlag);
			log.info(user);
			return scenePanelDao.getKpiCompareyKpiId(user);
		}
		
		public function result(data:Object):void
		{
			log.debug("[指标详情]:result 返回结果集 " + data.length);
			log.info(data as IList);
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
			log.error("[指标详情]:cmd命令返回失败error..." + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}
