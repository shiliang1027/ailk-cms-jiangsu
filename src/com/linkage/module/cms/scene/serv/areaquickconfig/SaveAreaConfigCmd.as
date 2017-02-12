package com.linkage.module.cms.scene.serv.areaquickconfig
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.dao.AreaQuickConfigDao;
    import com.linkage.module.cms.scene.domain.AreaQuickConfigDM;
    import com.linkage.module.cms.scene.domain.common.IUser;
    import com.linkage.module.cms.scene.event.AreaQuickConifgEvent;

    import flash.external.ExternalInterface;

    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    /**
     *
     *
     * @author 华伟 (69088)
     * @version 1.0
     * @date 2012-12-14
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class SaveAreaConfigCmd
    {
        private var log:ILogger = Log.getLoggerByClass(SaveAreaConfigCmd);

        [Inject("areaQuickConfigDM")]
        public var dm:AreaQuickConfigDM;

        [Inject("areaQuickConfigDao")]
        public var dao:AreaQuickConfigDao;

        [Inject("user")]
        public var user:IUser;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        public function execute(e:AreaQuickConifgEvent):AsyncToken
        {
            log.info("保存区域配置");
			log.info(e.param);
            return dao.saveFastConf(e.param);
        }

        //test
        public function test(data:Object):void
        {
            log.info("保存结果");
            log.info(data);
            Alert.show(data.toString());
        }

        public function result(data:Object):void
        {
            log.info("保存结果");
            log.info(data);

            if (data.url && data.url != "" && data.url != null)
            {
                dm.url = user.context + data.url + "&isNew=true";
                //Alert.show(data.result + "\n是否跳转到刚配置的页面？", "保存提示", Alert.YES | Alert.NO, null, closesaveConfigHandler);
				Alert.show(data.result, "保存提示");
            }
            else
            {
                Alert.show(data.result, "保存提示");
            }
        }

        private function closesaveConfigHandler(event:CloseEvent):void
        {
            log.debug("url{0}", dm.url);

            if (Alert.YES == event.detail)
            {
                ExternalInterface.call("function(){window.open('" + dm.url + "','_self')}");
            }
            else
            {
                ExternalInterface.call("function(){window.open('scene/quickconf/quickMgrAction.action' ,'_self')}");
            }
        }

        public function error(f:Fault):void
        {
            log.error("异常错误" + f.faultString + "," + f.faultDetail);
            var isTest:Boolean = false;

            if (isTest)
            {
                var result:Object;
                result = "成功";
                test(result);
            }
        }
    }
}

