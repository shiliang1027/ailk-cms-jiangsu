package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.dao.ScenePanelDao;
	import com.linkage.module.cms.scene.domain.KPISituationDM;
	import com.linkage.module.cms.scene.event.KPISituationEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
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
	public class TopnSelectCmd
	{
		private var log:ILogger = Log.getLoggerByClass(TopnSelectCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:ScenePanelDao;

		[Inject("kPISituationDM")]
		public var kpiSituationDM:KPISituationDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		private var systime:Number = 0;

		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("[指标概况：]下拉框数据execute开始执行...");
			systime = (new Date()).getTime();
			log.warn("[指标概况：]下拉框 开始：{0}", new Date().toString());
			return scenePanelDao.getSceneKpiList();
		}

		public function result(data:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.warn("[指标概况：]下拉框 结束：{0}", new Date().toString());
			log.debug("[指标概况：]result 返回结果集" + data.length);

			this.kpiSituationDM.topNList.removeAll();
			this.kpiSituationDM.topNList.addAll(data as IList);
			this.kpiSituationDM.topNList.refresh();
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_TOPN_DATA);
			e.selectTopnId = kpiSituationDM.topNList.getItemAt(0)['kpiId'];
			e.strMoTypeId = kpiSituationDM.topNList.getItemAt(0)['moTypeId'];
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
			var e2:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_BADTOPN_MATRIXDATA);
			e2.strKpiId = kpiSituationDM.topNList.getItemAt(0)['kpiId'];
			e2.strMoTypeId = kpiSituationDM.topNList.getItemAt(0)['moTypeId'];
			log.debug("strKpiId" + e2.strKpiId + "strMoTypeId" + e2.strMoTypeId);
//			msgDispatcher(e2);
			requestServerUtil.addRequest(e2);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			
		}

		public function error(f:Fault):void
		{
			log.error("[指标概况：]cmd命令返回失败error..." + f.faultDetail + "\n" + f.faultString);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

