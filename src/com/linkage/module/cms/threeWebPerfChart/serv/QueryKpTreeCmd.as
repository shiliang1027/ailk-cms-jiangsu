package com.linkage.module.cms.threeWebPerfChart.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.threeWebPerfChart.dao.KpiChartDAO;
    import com.linkage.module.cms.threeWebPerfChart.domain.KpiChartDM;
    import com.linkage.module.cms.threeWebPerfChart.event.KpiChartEvent;
    
    import mx.collections.ArrayCollection;
    import mx.collections.IList;
    import mx.controls.Alert;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;
    import mx.utils.ObjectUtil;

    public class QueryKpTreeCmd
    {
        public function QueryKpTreeCmd()
        {
        }

        private var log:ILogger = Log.getLoggerByClass(QueryKpTreeCmd);

        [Inject("kpiChartDAO")]
        public var dao:KpiChartDAO;

        [Inject("kpiChartDM")]
        public var dm:KpiChartDM;

        [MessageDispatcher]
        public var dispatchMsg:Function;

        private var param:Object;

        public function execute(e:KpiChartEvent):AsyncToken
        {
            return dao.queryTreeDatas();
        }

        public function result(data:Object):void
        {
            log.info("QueryKpTreeCmd ~~~获取[指标图表]结果:{0}", data.length);
			log.info("kpi QueryKpTreeCmd adminTreeData result" + (ObjectUtil.copy(data.adminTreeData)));
			log.info("kpi QueryKpTreeCmd specialTreeData result" + (ObjectUtil.copy(data.specialTreeData)));
			dm.adminTreeData = new XML(ObjectUtil.copy(data.adminTreeData));
			dm.specialTreeData = new XML(ObjectUtil.copy(data.specialTreeData));
			
			
		/*	dm.adminTreeData = <node id="tree" name="tree">
					<node id="tree" name="tree" level="2" cityId=""/>
				</node>*/
			var evt:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_LEFT_TREE_DEFAULT_SELECTED);
			dispatchMsg(evt);
        }

        public function error(f:Fault):void
        {
            log.error("获取[指标图表]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
			
			dm.adminTreeData = <node id="tree" name="tree">
								<node id="tree" name="tree" level="2" cityId=""/>
							</node>
			var evt:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_LEFT_TREE_DEFAULT_SELECTED);
			dispatchMsg(evt);
        }

    }
}
