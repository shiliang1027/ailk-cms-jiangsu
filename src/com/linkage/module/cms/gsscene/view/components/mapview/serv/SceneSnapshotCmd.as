package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
    import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
    import com.linkage.module.cms.gsscene.view.components.sceneview.dao.ISceneViewDao;
    
    import flash.events.Event;
    
    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class SceneSnapshotCmd
    {
        private var log:ILogger = Log.getLoggerByClass(SceneSnapshotCmd);

        [Inject("mapViewDM")]
        public var dm:MapViewDM;

        [Inject(sceneViewDao)]
        public var dao:ISceneViewDao;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        public function execute(e:SceneEvent):AsyncToken
        {
            log.info("调用远程方法，加载gis场景下所有区域缩略图数据！");
            return dao.getSceneImg();
        }

        public function result(data:Object):void
        {
            log.info("加载gis场景下所有区域缩略图数据成功！");
            dm.snapshotList.removeAll();
            dm.snapshotList.addAll(data as IList);

            msgDispatcher(new SceneEvent(SceneEvent.DEAL_SCENE_SNAPSHOTS_ALL));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
			msgDispatcher(new Event("REQUEST_COMPLETE"));
            log.error("加载gis场景下所有区域缩略图数据错误：" + f.faultString + "\n" + f.faultDetail);
        }
    }
}