package com.linkage.module.cms.scene.serv.areaquickconfig
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.dao.AreaQuickConfigDao;
    import com.linkage.module.cms.scene.dao.AreaQuickConfigImpDao;
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
     * @date 2013-1-15
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class LoadImpDataCmd
    {
        private var log:ILogger = Log.getLoggerByClass(LoadImpDataCmd);

        [Inject("areaQuickConfigDM")]
        public var dm:AreaQuickConfigDM;

        [MessageDispatcher]
        public var dispatchMsg:Function;

        [Inject("areaQuickConfigImpDao")]
        public var dao:AreaQuickConfigImpDao;

        public function execute(e:AreaQuickConifgEvent):AsyncToken
        {
            log.info("加载导入数据参数");
            log.info(e.param);
            return dao.getMoInfoByParams(e.param);
        }

        public function result(data:Object):void
        {
            log.info("导入数据返回值");
            log.info(data);

            dm.impList.addAll(data as IList);
            dm.impList.refresh();

            dispatchMsg(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_IMPORT_DATAS_COMP));
        }

        public function error(f:Fault):void
        {
            log.error("异常错误" + f.faultString + "," + f.faultDetail);
        }
    }
}
