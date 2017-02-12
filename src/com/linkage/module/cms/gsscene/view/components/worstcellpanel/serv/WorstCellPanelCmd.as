package com.linkage.module.cms.gsscene.view.components.worstcellpanel.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
    import com.linkage.module.cms.gsscene.view.components.worstcellpanel.WorstCellPanelDM;
    import com.linkage.module.cms.gsscene.view.components.worstcellpanel.dao.IWorstCellPanelDao;
    import com.linkage.module.cms.gsscene.view.components.worstcellpanel.event.WorstCellPanelEvent;
    
    import flash.events.Event;
    
    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class WorstCellPanelCmd
    {
        private var log:ILogger = Log.getLoggerByClass(WorstCellPanelCmd);

        [Inject("worstCellPanelDM")]
        public var dm:WorstCellPanelDM;

        [Inject("worstCellPanelDao")]
        public var dao:IWorstCellPanelDao;

        [Inject("user")]
        public var user:IUser;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        public function execute(e:WorstCellPanelEvent):AsyncToken
        {
            log.info("调用远程方法，加载 小区 数据！");
			var param:Object = {};
			param.flag = dm.currectSelectFlag;
            return dao.getWorstCellData(param);
        }

        public function result(data:Object):void
        {
            log.info("加载 小区 数据成功！");

            dm.cellList.removeAll();
            dm.cellList.addAll(data as IList);

            log.info(dm.cellList);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
			msgDispatcher(new Event("REQUEST_COMPLETE"));
            log.error("加载 小区 数据错误：" + f.faultString + "\n" + f.faultDetail);
        }
    }
}

