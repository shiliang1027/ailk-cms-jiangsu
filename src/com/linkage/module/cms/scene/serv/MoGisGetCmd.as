package com.linkage.module.cms.scene.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    
    import com.linkage.module.cms.scene.dao.IMapViewDao;
    import com.linkage.module.cms.scene.domain.MapViewDM;
    import com.linkage.module.cms.scene.domain.common.IUser;
    import com.linkage.module.cms.scene.event.SceneEvent;
    
    import flash.events.Event;
    import flash.utils.ByteArray;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;
    import mx.utils.ObjectUtil;

    /**
     *
     *
     * @author hurw (69065)
     * @version 1.0
     * @date 2012-10-19
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class MoGisGetCmd
    {
        private var log:ILogger = Log.getLoggerByClass(MoGisGetCmd);

        [Inject("mapViewDao")]
        public var mapViewDao:IMapViewDao;

        [Inject("mapViewDM")]
        public var mapViewDM:MapViewDM;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        [Inject("user")]
        public var user:IUser;

        public function execute(e:SceneEvent):AsyncToken
        {
            log.info("获取网元gis定位数据~!");
            log.info(user);

            e.param.sceneId = user.sceneId;
            e.param.level = user.level;
            e.param.cityId = user.cityId;

            return mapViewDao.getMoLatitudeByMoId(e.param);
        }

        public function result(data:Object):void
        {
            log.info("获取网元gis定位数据~ success!");

            if (data != null)
            {
//				var temp:Object = clone(data);
//				log.info(temp);
                mapViewDM.gisPositionList.removeAll();
                mapViewDM.gisPositionList.addItem(data);
                mapViewDM.gisPositionList.refresh();
//				log.info(mapViewDM.gisPositionList);
                log.info("获取网元gis定位数据success，抛出事件向地图上撒相应网元~SHOW_MOGIS_LAYER!");
                log.debug(data);
                var evt:SceneEvent = new SceneEvent(SceneEvent.SHOW_MOGIS_LAYER);

                evt.param = data;
                msgDispatcher(evt);
            }
            else
            {
                log.info("data is null!");
            }
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
            log.error("获取网元gis定位数据~ error:" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        private function clone(source:Object):*
        {
            var copy:ByteArray = new ByteArray();
            copy.writeObject(source);
            copy.position = 0;
            return (copy.readObject());
        }
    }
}

