package com.linkage.module.cms.scene.view.components
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.linkage.module.cms.scene.domain.WorstCellPanelDM;
    import com.linkage.module.cms.scene.event.WorstCellPanelEvent;

    public class WorstCellPanelPM
    {
        private var log:ILogger = Log.getLoggerByClass(WorstCellPanelPM);

        [MessageDispatcher]
        public var dispatchMsg:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
        public function loadData():void
        {
            if (log.infoEnabled)
                log.info("加载工单统计数据！");

            var e:WorstCellPanelEvent = new WorstCellPanelEvent(WorstCellPanelEvent.LOAD_DATA);
//            dispatchMsg(e);
			requestServerUtil.addRequest(e);
        }
    }
}
