package com.linkage.module.cms.scene.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.domain.KPISituationDM;
	import com.linkage.module.cms.scene.event.KPISituationEvent;
	
	import flash.utils.setTimeout;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-2
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DegradationTOPNPM
	{
		private var log:ILogger = Log.getLoggerByClass(DegradationTOPNPM);

		public var exportColumns:Array = new Array();

		[Inject("kPISituationDM")]
		[Bindable]
		public var kpiSituationDM:KPISituationDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		public function showTopnSelectData():void
		{
			log.debug("[指标概况:]事件派发加载下拉选择框：" + KPISituationEvent.SHOW_TOPN_LIST);
			var topnSelectEvent:KPISituationEvent = new KPISituationEvent(KPISituationEvent.SHOW_TOPN_LIST);
//			msgDispatcher(topnSelectEvent);
			requestServerUtil.addRequest(topnSelectEvent);
		}

		public function getTopnDataBySelectId(topnId:String, strKpiId:String, strMoTypeId:String):void
		{
			log.debug("[指标概况:]topN下拉选择，当前TOPNID=" + topnId);
			var loadTOPNEvent:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_TOPN_DATA);
			loadTOPNEvent.selectTopnId = topnId;
			loadTOPNEvent.strMoTypeId = strMoTypeId;
//			msgDispatcher(loadTOPNEvent);
			requestServerUtil.addRequest(loadTOPNEvent);
			kpiSituationDM.loadTopNDataEvent = loadTOPNEvent;
			setTimeout(function():void{
			var e2:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_BADTOPN_MATRIXDATA);
			e2.strKpiId = strKpiId;
			e2.strMoTypeId = strMoTypeId;
			log.debug("strKpiId" + e2.strKpiId + "strMoTypeId" + e2.strMoTypeId);
//			msgDispatcher(e2);
			requestServerUtil.addRequest(e2);
				}, 500);
		}
	}
}

