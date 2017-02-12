package com.linkage.module.cms.scene.serv.areaquickconfig
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.alarm.framework.module.server.source.ICollection;
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
     * @date 2012-12-26
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class LoadMoTypeCmd
    {
        private var log:ILogger = Log.getLoggerByClass(LoadMoTypeCmd);

        [Inject("areaQuickConfigDM")]
        public var dm:AreaQuickConfigDM;

        [Inject("areaQuickConfigDao")]
        public var dao:AreaQuickConfigDao;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        public function execute(e:AreaQuickConifgEvent):AsyncToken
        {
            log.info("查询网元类型列表");
            return dao.getMoType();
        }

        public function result(data:Object):void
        {
            log.info("查询网元类型列表成功");
            log.info(data);
            dm.motypeList.removeAll();
//            dm.motypeList.addAll(data as IList);

//            dm.motypeList.addItem({"mo_type_id": "15", "mo_type_name": "BSC"});
//            dm.motypeList.addItem({"mo_type_id": "27", "mo_type_name": "RNC"});
//            dm.motypeList.addItem({"mo_type_id": "101", "mo_type_name": "CELL"});
//            dm.motypeList.addItem({"mo_type_id": "102", "mo_type_name": "UTRANCELL"});
//            dm.motypeList.addItem({"mo_type_id": "16", "mo_type_name": "BTS"});
//            dm.motypeList.addItem({"mo_type_id": "28", "mo_type_name": "NodeB"});
			dm.motypeList = data as ArrayCollection;
            dm.motypeList.refresh();
        }

        public function error(f:Fault):void
        {
            log.error("查询网元类型列表数据~ error:" + f.faultString + "\n" + f.faultDetail);
        }

    }
}
