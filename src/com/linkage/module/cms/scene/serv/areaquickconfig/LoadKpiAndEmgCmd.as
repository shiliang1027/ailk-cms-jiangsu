package com.linkage.module.cms.scene.serv.areaquickconfig
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.dao.AreaQuickConfigDao;
    import com.linkage.module.cms.scene.domain.AreaQuickConfigDM;
    import com.linkage.module.cms.scene.event.AreaQuickConifgEvent;

    import mx.collections.ArrayCollection;
    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    /**
     *
     *
     * @author 华伟 (69088)
     * @version 1.0
     * @date 2012-12-13
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class LoadKpiAndEmgCmd
    {
        private var log:ILogger = Log.getLoggerByClass(LoadKpiAndEmgCmd);

        [Inject("areaQuickConfigDM")]
        public var dm:AreaQuickConfigDM;

        [MessageDispatcher]
        public var dispatchMsg:Function;

        [Inject("areaQuickConfigDao")]
        public var dao:AreaQuickConfigDao;

        public function execute(e:AreaQuickConifgEvent):AsyncToken
        {
            log.info("加载指标和应急资源参数");
            log.info(e.param);
            return dao.getPref(e.param);
        }

        public function result(data:Object):void
        {
            log.info("加载指标和应急资源数据返回");

            dm.supportCustomFeelKpiList.removeAll();

            if (data.preCustomFeelKpiList)
                dm.supportCustomFeelKpiList.addAll(data.preCustomFeelKpiList as IList);
            dm.supportCustomFeelKpiList.refresh();

            dm.configedCustomFeelKpiList.removeAll();

            if (data.configedCustomFeelKpiList)
                dm.configedCustomFeelKpiList.addAll(data.configedCustomFeelKpiList as IList);
            dm.configedCustomFeelKpiList.refresh();

            dm.supportBussPmKpiList.removeAll();

            if (data.preBussPmKpiList)
                dm.supportBussPmKpiList.addAll(data.preBussPmKpiList as IList);
            dm.supportBussPmKpiList.refresh();

            dm.configedBussPmKpiList.removeAll();

            if (data.configedBussPmKpiList)
                dm.configedBussPmKpiList.addAll(data.configedBussPmKpiList as IList);
            dm.configedBussPmKpiList.refresh();

            dm.supportDevPmKpiList.removeAll();

            if (data.preDevPmKpiList)
                dm.supportDevPmKpiList.addAll(data.preDevPmKpiList as IList);
            dm.supportDevPmKpiList.refresh();

            dm.configedDevPmKpiList.removeAll();

            if (data.configedDevPmKpiList)
                dm.configedDevPmKpiList.addAll(data.configedDevPmKpiList as IList);
            dm.configedDevPmKpiList.refresh();

        }

        public function error(f:Fault):void
        {
            log.error("异常错误" + f.faultString + "," + f.faultDetail);
        }
    }
}
