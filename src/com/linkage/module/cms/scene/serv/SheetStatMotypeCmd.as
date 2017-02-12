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

    public class SheetStatMotypeCmd
    {
        private var log:ILogger = Log.getLoggerByClass(SheetStatMotypeCmd);

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
            log.info("调用远程方法，加载 工单(网元类型维度) 数据！");
            return dao.loadSheetDataMotype(e.param);
        }

        public function result(data:Object):void
        {
            log.info("加载 工单(网元类型维度) 数据成功！");

            dm.sheetListMotype.removeAll();
            dm.sheetListMotype.addAll(data['motype'] as IList);

            log.info(dm.sheetListCity);

            msgDispatcher(new SheetStatEvent(SheetStatEvent.LOAD_SHEET_DATA_MOTYPE_SUCC));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
            log.error("加载 工单(网元类型维度) 数据错误：" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }
    }
}

