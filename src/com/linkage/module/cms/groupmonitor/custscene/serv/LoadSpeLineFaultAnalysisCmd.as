package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustChartDao;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustSceneDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustChartDM;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class LoadSpeLineFaultAnalysisCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadSpeLineFaultAnalysisCmd);
		
		[Inject]
		public var dm:CustChartDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		[Inject]
		public var dao:CustChartDao;
		
		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("专线故障分析");
			log.info(e.param);
			return dao.querySpecLineFault(e.param);
		}
		
		
		
		public function result(data:Object):void
		{
			log.info("加载专线故障分析返回值");
			log.info(data);
			log.info("data[totalFaultTime]="+data["totalFaultTime"] +"--data[totalFaultCount]="+data["totalFaultCount"]);
			
			dm.totalFaultTime = data["totalFaultTime"];
			dm.totalFaultCount = data["totalFaultCount"];
			dm.speLineFaultList.removeAll();
			dm.speLineFaultList.addAll(data["faultList"] as IList);
			log.info(dm.speLineFaultList);

			dispatchMsg(new CustSceneEvent(CustSceneEvent.SHOW_SPE_LINE_FAULT_ANALYSIS_DATA));
			log.info("---SHOW_SPE_LINE_FAULT_ANALYSIS_DATA");
		}
		
		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
			dispatchMsg(new CustSceneEvent(CustSceneEvent.SHOW_SPE_LINE_FAULT_ANALYSIS_DATA));
		}
	}
}