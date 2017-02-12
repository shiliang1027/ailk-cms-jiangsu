package com.linkage.module.cms.gsscene.view.components.worstcellpanel
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.linkage.module.cms.gsscene.view.components.worstcellpanel.event.WorstCellPanelEvent;

    public class WorstCellPanelPM
    {
        private var log:ILogger = Log.getLoggerByClass(WorstCellPanelPM);

		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		
        [MessageDispatcher]
        public var dispatchMsg:Function;

        public function getWorstCellData():void
        {
            if (log.infoEnabled)
                log.info("加载工单统计数据！");

            var e:WorstCellPanelEvent = new WorstCellPanelEvent(WorstCellPanelEvent.LOAD_WORSTCELL_DATA);
//            dispatchMsg(e);
			requestServerUtil.addRequest(e);
        }
    }
}
