package com.linkage.module.cms.threeWebPerfChart.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.common.LoadManager;
    import com.linkage.module.cms.threeWebPerfChart.dao.KpiChartDAO;
    import com.linkage.module.cms.threeWebPerfChart.domain.KpiChartDM;
    import com.linkage.module.cms.threeWebPerfChart.event.KpiChartEvent;
    
    import mx.collections.ArrayCollection;
    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class QueryKpiMUTypeChartsCmd
    {
        public function QueryKpiMUTypeChartsCmd()
        {
        }

        private var log:ILogger = Log.getLoggerByClass(QueryKpiMUTypeChartsCmd);
		
		private var lm:LoadManager = new LoadManager(this);

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
//			param = e.param;
			log.info(e.param);
			
            return dao.getNetCompareValue(e.param);
//            return dao.getBigScreenValueforOne(e.param);
        }

        public function result(data:Object):void
        {
            log.info("QueryKpiMUTypeChartsCmd ~~~获取[指标图表]结果:{0}", data.length);
			dm.chartDatas.removeAll();
            log.info(data);
            dm.chartDatas.addAll(ArrayCollection(data));
			log.info(dm.chartDatas);
			
//            dm.charts.refresh();
        }

        public function error(f:Fault):void
        {
			lm.hideLoading();
            log.error("获取[指标图表]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
//			dm.charts.removeAll();
//			dm.charts.addAll(new ArrayCollection([
//				new ArrayCollection([
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: 33, perf_4G_value:"no", gather_time: "1"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 60, perf_3G_value: 33, perf_4G_value:"no", gather_time: "1"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 44, perf_3G_value: 33, perf_4G_value:"no", gather_time: "1"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 55, perf_3G_value: 33, perf_4G_value:"no", gather_time: "2014-07-11"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 25, perf_3G_value: 33, perf_4G_value:"no", gather_time: "2014-07-12"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 74, perf_3G_value: 33, perf_4G_value:"no", gather_time: "2014-07-13"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 72, perf_3G_value: 33, perf_4G_value:"no", gather_time: "2014-07-14"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 67, perf_3G_value: 33, perf_4G_value:"no", gather_time: "2014-07-15"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 71, perf_3G_value: 33, perf_4G_value:"no", gather_time: "2014-07-16"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 15, perf_3G_value: 33, perf_4G_value:"no", gather_time: "2014-07-17"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 23, perf_3G_value: 33, perf_4G_value:"no", gather_time: "2014-07-18"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 87, perf_3G_value: 33, perf_4G_value:"no", gather_time: "2014-07-19"},
//					{unit:"个",area_id:"100371",perf_type_id:1246,kpi_name:"话务量",mo_type_id:102,st:1407797210,et:1407818810,isBing:"false"}
//					//					{unit="miao",area_id:"100371",perf_type_id:1246,kpi_name:"青奥会东西门3G用户数",mo_type_id:102,st:1407797210,et:1407818810}
//				]),
//				new ArrayCollection([
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 65, gather_time: "2"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 76, gather_time: "2"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 23, gather_time: "2"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 66, gather_time: "2014-07-11"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 89, gather_time: "2014-07-12"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 76, gather_time: "2014-07-13"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 45, gather_time: "2014-07-14"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 12, gather_time: "2014-07-15"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 77, gather_time: "2014-07-16"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 34, gather_time: "2014-07-17"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 54, gather_time: "2014-07-18"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: "no", perf_4G_value: 60, gather_time: "2014-07-19"},
//					{unit:"个",area_id:"100371",perf_type_id:1246,kpi_name:"用户数",mo_type_id:102,st:1407797210,et:1407818810,isBing:"false"}
//					//					{unit="miao",area_id:"100371",perf_type_id:1246,kpi_name:"青奥会东西门3G用户数",mo_type_id:102,st:1407797210,et:1407818810}
//				]),
//				new ArrayCollection([
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 80, perf_3G_value: 34, perf_4G_value: "no", gather_time: "3"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 60, perf_3G_value: 45, perf_4G_value: "no", gather_time: "3"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 44, perf_3G_value: 64, perf_4G_value: "no", gather_time: "3"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 55, perf_3G_value: 23, perf_4G_value: "no", gather_time: "2014-07-11"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 25, perf_3G_value: 78, perf_4G_value: "no", gather_time: "2014-07-12"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 74, perf_3G_value: 44, perf_4G_value: "no", gather_time: "2014-07-13"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 72, perf_3G_value: 83, perf_4G_value: "no", gather_time: "2014-07-14"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 67, perf_3G_value: 56, perf_4G_value: "no", gather_time: "2014-07-15"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 71, perf_3G_value: 9, perf_4G_value: "no", gather_time: "2014-07-16"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 15, perf_3G_value: 66, perf_4G_value: "no", gather_time: "2014-07-17"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 23, perf_3G_value: 45, perf_4G_value: "no", gather_time: "2014-07-18"},
//					{kpi_name_2g: "2G流量", kpi_name_3g: "3G流量", kpi_name_4g: "4G流量", color: 0Xff0000, perf_2G_value: 87, perf_3G_value: 760, perf_4G_value: 60, gather_time: "2014-07-19"},
//					{unit:"个",area_id:"100371",perf_type_id:1246,kpi_name:"流量",mo_type_id:102,st:1407797210,et:1407818810,isBing:"false"}
//					//				                                                      {unit="fen",area_id:"100371",perf_type_id:1246,kpi_name:"青奥会东西门3G用户数",mo_type_id:102,st:1407797210,et:1407818810}
//				]),
//				new ArrayCollection([ 
//					{mo_type_id:"32",mo_type_name:"GSM基站",value:"96",gather_time: "2014-07-08"},
//					{mo_type_id:"12",mo_type_name:"TD基站",value:"22",gather_time: "2014-07-09"},
//					{mo_type_id:"45",mo_type_name:"LTE基站",value:"25",gather_time: "2014-07-10"},
//					{unit:"个",area_id:"100371",perf_type_id:1246,kpi_name:"青奥会东4",mo_type_id:102,st:1407797210,et:1407818810,isBing:"true"}
//				])]));
//			dm.charts.refresh();
//			var evt:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_MUTYPE_INITCHARTS);
			//			evt.param = param;
//			dispatchMsg(evt);
        }

    }
}
