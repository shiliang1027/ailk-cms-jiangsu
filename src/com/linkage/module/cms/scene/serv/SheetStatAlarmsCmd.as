package com.linkage.module.cms.scene.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    
    import com.linkage.module.cms.scene.dao.ISheetStatDao;
    import com.linkage.module.cms.scene.domain.SheetStatDM;
    import com.linkage.module.cms.scene.domain.common.IUser;
    import com.linkage.module.cms.scene.event.SceneEvent;
    import com.linkage.module.cms.scene.event.SheetStatEvent;
    
    import flash.events.Event;
    
    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class SheetStatAlarmsCmd
    {
        private var log:ILogger = Log.getLoggerByClass(SheetStatAlarmsCmd);

        [Inject("sheetStatDM")]
        public var dm:SheetStatDM;

        [Inject("sheetStatDao")]
        public var dao:ISheetStatDao;

        [Inject("user")]
        public var user:IUser;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        public function execute(e:SheetStatEvent):AsyncToken
        {
            log.info("调用远程方法，加载 工单(告警) 数据！");
            return dao.loadSheetAlarmsData(e.param);
        }

        public function result(data:Object):void
        {
            log.info("加载 工单(告警) 数据成功！");

            dm.sheetAlarmsList = data;

            log.debug(dm.sheetAlarmsList['total']);
            log.debug(dm.sheetAlarmsList['datas'].length);
            log.debug(dm.sheetAlarmsList['displayColumns'].length);

            msgDispatcher(new SheetStatEvent(SheetStatEvent.LOAD_SHEET_ALARMS_SUCC));
            log.info("加载 工单(告警) 数据成功: LOAD_SHEET_ALARMS_SUCC");
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
            log.error("加载 工单(告警) 数据错误：" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }
    }
}

