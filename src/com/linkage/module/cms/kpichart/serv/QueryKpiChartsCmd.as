package com.linkage.module.cms.kpichart.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.kpichart.dao.KpiChartDAO;
	import com.linkage.module.cms.kpichart.domain.KpiChartDM;
	import com.linkage.module.cms.kpichart.event.KpiChartEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class QueryKpiChartsCmd
	{
		public function QueryKpiChartsCmd()
		{
		}
		
		private var log:ILogger = Log.getLoggerByClass(QueryKpiChartsCmd);
		
		[Inject("kpiChartDAO")]
		public var dao:KpiChartDAO;
		
		[Inject("kpiChartDM")]
		public var dm:KpiChartDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var param:Object;
		
		public function execute(e:KpiChartEvent):AsyncToken
		{
			log.info("获取[指标图表]图表参数:{0}",e.param);
			param = e.param;
			return dao.queryKpiChartDatas(e.param);
		}
		
		public function result(data:Object):void
		{
			log.info("QueryKpiChartsCmd 获取[指标图表]结果:{0}",data.length);
			log.info(data);
			dm.charts.removeAll();
			if(data&&data.length>0)
				dm.charts.addAll(data as IList);
			else
				dm.charts.addAll(new ArrayCollection([new ArrayCollection([{kpi_name:"2G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"2G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"2G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"2G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"2G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"2G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"2G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"2G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"2G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"2G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}]),
					new ArrayCollection([{kpi_name:"3G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"3G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"3G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"3G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"3G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"3G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"3G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"3G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"3G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"3G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}]),
					new ArrayCollection([{kpi_name:"4G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"4G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"4G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"4G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"4G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"4G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"4G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"4G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"4G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"4G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}]),
					new ArrayCollection([{kpi_name:"5G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"5G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"5G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"5G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"5G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"5G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"5G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"5G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"5G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"5G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}]),
					new ArrayCollection([{kpi_name:"6G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"6G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"6G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"6G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"6G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"6G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"6G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"6G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"6G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"6G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}]),
					new ArrayCollection([{kpi_name:"7G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"7G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"7G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"7G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"7G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
						{kpi_name:"7G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
						{kpi_name:"7G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"7G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
						{kpi_name:"7G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
						{kpi_name:"7G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}])]));
			dm.charts.refresh();
			var evt:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_INITCHARTS);
			evt.param = param;
			dispatchMsg(evt);
		}
		
		public function error(f:Fault):void
		{
			log.error("获取[指标图表]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
			dm.charts.removeAll();
			dm.charts = new ArrayCollection([[{kpi_name:"2G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
				{kpi_name:"2G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
				{kpi_name:"2G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
				{kpi_name:"2G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
				{kpi_name:"2G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
				{kpi_name:"2G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
				{kpi_name:"2G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
				{kpi_name:"2G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
				{kpi_name:"2G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
				{kpi_name:"2G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}],
				[{kpi_name:"3G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"3G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"3G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"3G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"3G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"3G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"3G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"3G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"3G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"3G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}],
				[{kpi_name:"4G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"4G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"4G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"4G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"4G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"4G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"4G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"4G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"4G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"4G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}],
				[{kpi_name:"5G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"5G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"5G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"5G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"5G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"5G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"5G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"5G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"5G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"5G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}],
				[{kpi_name:"6G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"6G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"6G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"6G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"6G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"6G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"6G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"6G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"6G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"6G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}],
				[{kpi_name:"7G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"7G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"7G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"7G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"7G流量",color:0X00ff00,perf_value:90,gather_time:"网元1"},
					{kpi_name:"7G流量",color:0Xff0000,perf_value:80,gather_time:"网元2"},
					{kpi_name:"7G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"7G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"},
					{kpi_name:"7G流量",color:0Xffff00,perf_value:70,gather_time:"网元3"},
					{kpi_name:"7G流量",color:0X0000ff,perf_value:45,gather_time:"网元4"}]]);
			
			dm.charts.refresh();
			var evt:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_INITCHARTS);
			evt.param = param;
			dispatchMsg(evt);
		}
		
	}
}