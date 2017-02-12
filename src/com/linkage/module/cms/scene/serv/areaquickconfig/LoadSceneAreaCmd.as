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
    public class LoadSceneAreaCmd
    {
        private var log:ILogger = Log.getLoggerByClass(LoadSceneAreaCmd);

        [Inject("areaQuickConfigDM")]
        public var dm:AreaQuickConfigDM;

        [Inject("areaQuickConfigDao")]
        public var dao:AreaQuickConfigDao;

        [MessageDispatcher]
        public var msgDispatcher:Function;


        public function execute(e:AreaQuickConifgEvent):AsyncToken
        {
            log.info("加载场景名称列表");
            log.info(e.param.type_id);
            return dao.getSceneList(e.param.type_id);
        }

        //test
        public function test(data:Object):void
        {
            log.info("加载场景名称返回");
            log.info(data);
            dm.sceneNameList.removeAll();
            dm.sceneNameList.addAll(data as IList);
            dm.sceneNameList.refresh();
            msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_SCENES_AREA_COMP));

        }

        public function result(data:Object):void
        {
            log.info("加载场景名称返回");
            log.info(data);
            dm.sceneNameList.removeAll();
            dm.sceneNameList.addAll(data as IList);
            dm.sceneNameList.refresh();
            msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_SCENES_AREA_COMP));
        }

        public function error(f:Fault):void
        {
            log.error("异常错误" + f.faultString + "," + f.faultDetail);

            var isTest:Boolean = false;

            if (isTest)
            {
                var result:Object;
                result = new ArrayCollection([{"sceneid": "1", "sceneName": "日常"}, {"sceneid": "2", "sceneName": "一线"}, {"sceneid": "3", "sceneName": "汛期"}, {"sceneid": "4", "sceneName": "重大事件"}, {"sceneid": "5", "sceneName": "高校"}]);
                test(result);
            }
        }
    }
}
