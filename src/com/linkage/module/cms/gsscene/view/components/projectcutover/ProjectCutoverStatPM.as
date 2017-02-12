package com.linkage.module.cms.gsscene.view.components.projectcutover
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.linkage.module.cms.gsscene.view.components.projectcutover.event.ProjectCutoverStatEvent;

    public class ProjectCutoverStatPM
    {
        private var log:ILogger = Log.getLoggerByClass(ProjectCutoverStatPM);

        [Inject("projectCutoverStatDM")]
        [Bindable]
        public var projectCutoverStatDM:ProjectCutoverStatDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

        [MessageDispatcher]
        public var dispatchMsg:Function;

        public function loadData():void
        {
            if (log.infoEnabled)
                log.info("加载工程割接统计数据！");
            var e:ProjectCutoverStatEvent = new ProjectCutoverStatEvent(ProjectCutoverStatEvent.LOAD_PROJECTCUTOVER_DATA);
//            dispatchMsg(e);
			requestServerUtil.addRequest(e);
        }
		
		public function loadDetailData(param:Object):void
		{
			if (log.infoEnabled)
				log.info("加载工程割接详情数据！");
			var e:ProjectCutoverStatEvent = new ProjectCutoverStatEvent(ProjectCutoverStatEvent.LOAD_PROJECTCUTOVER_DETAILS_DATA);
			e.param = param;
			dispatchMsg(e);
//			requestServerUtil.addRequest(e);
		}
		
    }
}
