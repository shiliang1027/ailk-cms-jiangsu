package com.linkage.module.cms.threeWebPerfChart.view
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.threeWebPerfChart.domain.KpiChartDM;
    import com.linkage.module.cms.threeWebPerfChart.domain.SceneTreeDM;
    import com.linkage.module.cms.threeWebPerfChart.event.KpiChartEvent;
    
    import mx.controls.Alert;

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
		
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.threeWebPerfChart.view.KpiChartViewPM");
		
		public function loadLeftTree():void
		{
			var e:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_LEFT_TREE);
			dispatchMsg(e);
		}
		
        public function queryKpiCharts(type:int):void
        {
            var e:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_QUERYCHARTS);
            e.param = new Object();
            e.param.type = type;
            dispatchMsg(e);
        }

        public function queryKpiMuTypeCharts(param:Object):void
        {
            var e:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_MUTYPE_QUERYCHARTS);
			log.info(param);
			e.param = param;
            dispatchMsg(e);
        }
		
		public function dealParams(xml:XML):Object
		{
			var params:Object = {};
			params.id = String(xml.attribute("id"));
			params.name = String(xml.attribute("name"));
			params.level = String(xml.attribute("level"));
			params.cityId = String(xml.attribute("cityId"));
			params.centerlongitude = String(xml.attribute("centerlongitude"));
			params.centerlatitude = String(xml.attribute("centerlatitude"));
			params.type = "2";
			log.info(params);
			return params;
		}
		
    }
}
