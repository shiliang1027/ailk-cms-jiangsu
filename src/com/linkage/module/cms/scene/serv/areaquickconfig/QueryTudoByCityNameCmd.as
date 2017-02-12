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
     * @date 2012-12-19
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class QueryTudoByCityNameCmd
    {
        private var log:ILogger = Log.getLoggerByClass(QueryTudoByCityNameCmd);

        [Inject("areaQuickConfigDM")]
        public var dm:AreaQuickConfigDM;

        [Inject("areaQuickConfigDao")]
        public var dao:AreaQuickConfigDao;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        public function execute(e:AreaQuickConifgEvent):AsyncToken
        {
            log.info("gis上查询 地址 信息：");
            log.info(e.param);
            return dao.getAreaByGis(e.param);
        }

        //test
        public function test(data:Object):void
        {
            log.info("gis上查询 地址 信息返回");
            log.info(data);
            dm.chooseList.removeAll();
            dm.chooseList.addAll(data.dataList as IList);
            dm.chooseList.refresh();
            dm.countRow = Number(data.rowCount);
            msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.QUERY_TUDE_BY_CITYNAME_COMP));
        }

        public function result(data:Object):void
        {
            log.info("gis上查询 地址 信息返回");
            log.info(data.areas as IList);
            log.info(data.count);
            dm.chooseList.removeAll();
            dm.chooseList.addAll(data.areas as IList);
            dm.chooseList.refresh();
            dm.countRow = Number(data.count);
            msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.QUERY_TUDE_BY_CITYNAME_COMP));
        }

        public function error(f:Fault):void
        {
            log.error("gis上查询 地址 信息 异常错误" + f.faultString + "," + f.faultDetail);

            var isTest:Boolean = false;

            if (isTest)
            {
                var result:Object;
                result = new ArrayCollection([{"mo_name": "aaa", "pointlongitude": "118.275499", "pointlatitude": "33.962"}, {"mo_name": "bbb", "pointlongitude": "118.275499", "pointlatitude": "33.962"}, {"mo_name": "cvv", "pointlongitude": "118.275499", "pointlatitude": "33.962"}, {"mo_name": "cccd", "pointlongitude": "118.275499", "pointlatitude": "33.962"}]);
                test(result);
            }
        }
    }
}
