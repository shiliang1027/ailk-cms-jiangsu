package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustChartDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustChartDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class LoadSpeLineComplaintsAnalysisCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadSpeLineComplaintsAnalysisCmd);
		
		[Inject]
		public var dm:CustChartDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		[Inject]
		public var dao:CustChartDao;
		
		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("专线tousu分析");
			log.info(e.param);
			return dao.querySpecLineComplaint(e.param);
		}
		
		
		public function result(data:Object):void
		{
			log.info("加载专线tousu分析返回值");
			log.info(data);
			log.info("data[totalComplaintCount="+data["totalComplaintCount"] +"--data[totalComplaintTime]="+data["totalComplaintTime"]);
			
			dm.totalComplaintCount = data["totalComplaintCount"];
			dm.totalComplaintTime = data["totalComplaintTime"];
			dm.speLineCompList.removeAll();
			dm.speLineCompList.addAll(data["complaintList"] as IList);
			log.info(dm.speLineCompList);
			
			dispatchMsg(new CustSceneEvent(CustSceneEvent.SHOW_SPE_LINE_COMP_ANALYSIS_DATA));
			log.info("---SHOW_SPE_LINE_COMP_ANALYSIS_DATA");
		}
		
		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
			dispatchMsg(new CustSceneEvent(CustSceneEvent.SHOW_SPE_LINE_COMP_ANALYSIS_DATA));
			
		}
	}
}