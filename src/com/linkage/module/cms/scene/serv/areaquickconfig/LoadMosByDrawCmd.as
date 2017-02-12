package com.linkage.module.cms.scene.serv.areaquickconfig
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.dao.AreaQuickConfigDao;
    import com.linkage.module.cms.scene.domain.AreaQuickConfigDM;
    import com.linkage.module.cms.scene.event.AreaQuickConifgEvent;

    import mx.collections.ArrayCollection;
    import mx.collections.IList;
    import mx.controls.Alert;
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
    public class LoadMosByDrawCmd
    {
        private var log:ILogger = Log.getLoggerByClass(LoadMosByDrawCmd);

        [Inject("areaQuickConfigDM")]
        public var dm:AreaQuickConfigDM;

        [Inject("areaQuickConfigDao")]
        public var dao:AreaQuickConfigDao;

        [MessageDispatcher]
        public var msgDispatcher:Function;


        public function execute(e:AreaQuickConifgEvent):AsyncToken
        {
            log.debug("加载MO参数");
            log.info(e.param);
            return dao.queryMapContainsMo(e.param);
        }

        //test
        public function test(data:Object):void
        {
            log.info("加载mo返回");

            if (data.count && data.count == "more")
            {
                Alert.show("框选的网元过多请重新框选");
            }
            else
            {
                log.info(data.xmlStr);
                log.info(data.city);
                dm.treeData = new XML(data.xmlStr);
                dm.cityList.removeAll();
                dm.cityList.addAll(data.city as IList);
                dm.cityList.refresh();
                msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_MOS_BY_DRAW_COMP));
            }
        }

        public function result(data:Object):void
        {
            log.info("加载mo返回");

            if (data.count && data.count == "more")
            {
//				var evt:AreaQuickConifgEvent=new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_MOS_BY_DRAW_COMP);
//				evt.param=data;
//				msgDispatcher(evt);
                Alert.show("框选的网元过多请重新框选");
            }
            else
            {
                log.info(data.xmlStr);
                log.info(data.city);
                dm.treeData = new XML(data.xmlStr);
                dm.cityList.removeAll();
                dm.cityList.addAll(data.city as IList);
                dm.cityList.refresh();
                dm.moTypeMap = data.moTypeMap;
                    //msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_MOS_BY_DRAW_COMP));
            }
            var evt:AreaQuickConifgEvent = new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_MOS_BY_DRAW_COMP);
            evt.param = data;
            msgDispatcher(evt);
        }

        public function error(f:Fault):void
        {
            log.error("异常错误" + f.faultString + "," + f.faultDetail);

            var isTest:Boolean = false;

            if (isTest)
            {
                var result:Object;
                result = {"xmlStr": '<R label="h"><N label="基站"><N label="NDD" isSave="1"></N><N label="ddd" isSave="1"></N></N><N label="热点"><N label="nnn" isSave="1"></N><N label="nnn" isSave="1"></N></N><N label="几楼"></N></R>', "city": new ArrayCollection([{"cityid": "0100"}, {"cityid": "0200"}])};
                test(result);
            }
        }
    }
}
