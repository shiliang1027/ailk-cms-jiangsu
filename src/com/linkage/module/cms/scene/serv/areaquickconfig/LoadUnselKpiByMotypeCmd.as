package com.linkage.module.cms.scene.serv.areaquickconfig
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.dao.AreaQuickConfigDao;
    import com.linkage.module.cms.scene.domain.AreaQuickConfigDM;
    import com.linkage.module.cms.scene.event.AreaQuickConifgEvent;

    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    /**
     *
     *
     * @author 华伟 (69088)
     * @version 1.0
     * @date 2012-12-28
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class LoadUnselKpiByMotypeCmd
    {
        private var log:ILogger = Log.getLoggerByClass(LoadUnselKpiByMotypeCmd);

        [Inject("areaQuickConfigDM")]
        public var dm:AreaQuickConfigDM;

        [MessageDispatcher]
        public var dispatchMsg:Function;

        [Inject("areaQuickConfigDao")]
        public var dao:AreaQuickConfigDao;

        public function execute(e:AreaQuickConifgEvent):AsyncToken

        {
            log.info("根据网元类型加载待选择指标参数");
            log.info(e.param);
            return dao.getPerfByMoType(e.param);
        }

        //test
        public function test(data:Object):void
        {
            log.info("根据网元类型加载待选择指标返回");
            log.info(data);
//			dm.kpiunselList.removeAll();
//			dm.kpiunselList.addAll(data as IList);
//			dm.kpiunselList.refresh();

        }

        public function result(data:Object):void
        {
            log.info("根据网元类型加载待选择指标返回");
            log.info(data);
//			dm.kpiunselList.removeAll();
//			dm.kpiunselList.addAll(data as IList);
//			dm.kpiunselList.refresh();
        }

        public function error(f:Fault):void
        {
            log.error("异常错误" + f.faultString + "," + f.faultDetail);
        }
    }
}
