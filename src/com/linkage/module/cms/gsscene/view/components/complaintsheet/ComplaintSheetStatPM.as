package com.linkage.module.cms.gsscene.view.components.complaintsheet
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.linkage.module.cms.gsscene.view.components.complaintsheet.event.ComplaintSheetStatEvent;

    public class ComplaintSheetStatPM
    {
        private var log:ILogger = Log.getLoggerByClass(ComplaintSheetStatPM);

        [Inject("complaintSheetStatDM")]
        [Bindable]
        public var complaintSheetStatDM:ComplaintSheetStatDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;


        [MessageDispatcher]
        public var dispatchMsg:Function;

        public function loadData():void
        {
            if (log.infoEnabled)
                log.info("加载投诉工单统计数据！");
            var e:ComplaintSheetStatEvent = new ComplaintSheetStatEvent(ComplaintSheetStatEvent.LOAD_COMPLAINTSHEET_DATA);
//            dispatchMsg(e);
			requestServerUtil.addRequest(e);
        }

		public function loadDetailData(param:Object):void
		{
			if (log.infoEnabled)
				log.info("加载投诉工单详情数据！");
			var e:ComplaintSheetStatEvent = new ComplaintSheetStatEvent(ComplaintSheetStatEvent.LOAD_COMPLAINTSHEET_ALARMS);
			e.param = param;
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);

		}
    }
}
