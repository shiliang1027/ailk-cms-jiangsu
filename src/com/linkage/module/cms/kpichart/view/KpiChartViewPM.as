package com.linkage.module.cms.kpichart.view
{
    import com.linkage.module.cms.kpichart.domain.KpiChartDM;
    import com.linkage.module.cms.kpichart.event.KpiChartEvent;

    public class KpiChartViewPM
    {
        public function KpiChartViewPM()
        {
        }

        [MessageDispatcher]
        public var dispatchMsg:Function;

        [Inject("kpiChartDM")]
        [Bindable]
        public var dm:KpiChartDM;

        public function queryKpiCharts(type:int):void
        {
            var e:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_QUERYCHARTS);
            e.param = new Object();
            e.param.type = type;
            dispatchMsg(e);
        }

        public function queryKpiMuTypeCharts(type:String):void
        {
            var e:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_MUTYPE_QUERYCHARTS);
            e.param = new Object();
            e.param.type = type;
            dispatchMsg(e);
        }
    }
}
