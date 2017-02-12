package com.linkage.module.cms.scene.serv.areaquickconfig
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.dao.AreaQuickConfigDao;
    import com.linkage.module.cms.scene.domain.AreaQuickConfigDM;
    import com.linkage.module.cms.scene.event.AreaQuickConifgEvent;

    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    /**
     *
     *
     * @author 华伟 (69088)
     * @version 1.0
     * @date 2013-1-10
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class LoadBaseTreeCmd
    {
        private var log:ILogger = Log.getLoggerByClass(LoadBaseTreeCmd);

        [Inject("areaQuickConfigDM")]
        public var dm:AreaQuickConfigDM;

        [MessageDispatcher]
        public var dispatchMsg:Function;

        [Inject("areaQuickConfigDao")]
        public var dao:AreaQuickConfigDao;

        public function execute(e:AreaQuickConifgEvent):AsyncToken
        {
            log.info("加载树");
            log.info(e.param);
            return dao.loadBaseTree(e.param);
        }

        //test
        public function test(data:Object):void
        {
            log.info("基础数返回值");
            log.info(data);

            try
            {
                dm.motreeData = new XML(data);
            }
            catch (e:Error)
            {
                log.error(e.message.toString(), "ERROR");
                return;
            }
        }

        public function result(data:Object):void
        {
            log.info("基础数返回值");
            log.info(data);

            try
            {
                dm.motreeData = new XML(data);
                dispatchMsg(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_BASE_TREE_COMP));
            }
            catch (e:Error)
            {
                log.error(e.message.toString(), "ERROR");
                return;
            }
        }

        public function error(f:Fault):void
        {
            log.error("异常错误" + f.faultString + "," + f.faultDetail);

            var isTest:Boolean = false;

            if (isTest)
            {
                var result:Object;
                test(result);
            }
        }
    }
}
