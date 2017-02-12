package com.linkage.module.cms.scenedaily.view.components.mainchart
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.mainchart.ChartDM;
	import com.linkage.module.cms.scenedaily.event.mainchart.ChartCompEvent;

	public class ChartPM
	{
		private var log:ILogger = Log.getLoggerByClass(ChartPM);
		
		[Inject("chartDM")]
		[Bindable]
		public var chartDM:ChartDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function loadData(param:Object, type:String=""):void
		{
			log.info("劣化排名 模块loadData！");			
			var e:ChartCompEvent = new ChartCompEvent(ChartCompEvent.LOAD_START_DATA);
			
			log.info("劣化排名 传递数据！" +　e);
			e.param = param;
            e.param.loadType = type;
			dispatchMsg(e);
		}
		
		public function loadHistoryTrendData(param:Object, type:String=""):void
		{
			log.info("指标趋势 模块loadData！");			
			var e:ChartCompEvent = new ChartCompEvent(ChartCompEvent.LOAD_LH_DATA);
			
			log.info("指标趋势 传递数据！" +　e);
			
			e.param = param;
            e.param.loadType = type;
			dispatchMsg(e);
		}
	}
}