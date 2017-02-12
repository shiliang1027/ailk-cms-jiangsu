package com.linkage.module.cms.scene.view.components
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.linkage.module.cms.scene.domain.SheetStatDM;
    import com.linkage.module.cms.scene.event.SheetStatEvent;


    public class SheetStatPM
    {
        private var log:ILogger = Log.getLoggerByClass(SheetStatPM);

        [Inject("sheetStatDM")]
        [Bindable]
        public var sheetStatDM:SheetStatDM;

        [MessageDispatcher]
        public var dispatchMsg:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
        public function loadData():void
        {
            if (log.infoEnabled)
                log.info("加载工单统计数据！");

            var e:SheetStatEvent = new SheetStatEvent(SheetStatEvent.LOAD_SHEET_DATA);
//            dispatchMsg(e);
			requestServerUtil.addRequest(e);
        }
    }
}
