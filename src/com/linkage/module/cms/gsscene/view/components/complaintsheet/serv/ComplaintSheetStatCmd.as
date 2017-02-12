package com.linkage.module.cms.gsscene.view.components.complaintsheet.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
    import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
    import com.linkage.module.cms.gsscene.view.components.complaintsheet.ComplaintSheetStatDM;
    import com.linkage.module.cms.gsscene.view.components.complaintsheet.dao.IComplaintSheetStatDao;
    import com.linkage.module.cms.gsscene.view.components.complaintsheet.event.ComplaintSheetStatEvent;
    
    import flash.events.Event;
    
    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class ComplaintSheetStatCmd
    {
        private var log:ILogger = Log.getLoggerByClass(ComplaintSheetStatCmd);

        [Inject("complaintSheetStatDM")]
        public var dm:ComplaintSheetStatDM;

        [Inject("complaintSheetStatDao")]
        public var dao:IComplaintSheetStatDao;

        [Inject("user")]
        public var user:IUser;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        public function execute(e:ComplaintSheetStatEvent):AsyncToken
        {
            log.info("调用远程方法，加载 投诉工单(地市维度) 数据！");
            return dao.loadComplaintSheetData();
        }

        public function result(data:Object):void
        {
            log.info("加载 投诉工单(地市维度) 数据成功！");

            dm.sheetListCity.removeAll();
            dm.sheetListCity.addAll(data['city'] as IList);
            log.info(dm.sheetListCity);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
            log.error("加载 投诉工单(地市维度) 数据错误：" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }
    }
}

