package com.linkage.module.cms.threeWebPerfChart.view
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.threeWebPerfChart.domain.KpiChartDM;
    import com.linkage.module.cms.threeWebPerfChart.domain.SceneTreeDM;
    import com.linkage.module.cms.threeWebPerfChart.event.KpiChartEvent;
    
    import mx.controls.Alert;

    public class KpiTreeViewPM
    {
        public function KpiTreeViewPM()
        {
        }

        [MessageDispatcher]
        public var dispatchMsg:Function;

        [Inject("kpiChartDM")]
        [Bindable]
        public var dm:KpiChartDM;
		
		[Inject("sceneTreeDM")]
		[Bindable]
		public var stdm:SceneTreeDM;

		private var log:ILogger = Log.getLogger("com.linkage.module.cms.threeWebPerfChart.view.KpiTreeViewPM");
		
		public function loadLeftTree():void
		{
			Alert.show("111");
			var e:KpiChartEvent = new KpiChartEvent(KpiChartEvent.CMS_KPICHART_LEFT_TREE);
			dispatchMsg(e);
		}
		
		
		
    }
}
