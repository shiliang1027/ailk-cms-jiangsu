package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
    import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
    import com.linkage.module.cms.gsscene.view.components.sceneview.dao.ISceneViewDao;
    
    import flash.events.Event;
    
    import mx.collections.IList;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class SceneUserNumCmd
    {
        private var log:ILogger = Log.getLoggerByClass(SceneUserNumCmd);

        [Inject("mapViewDM")]
        public var dm:MapViewDM;

        [Inject(sceneViewDao)]
        public var dao:ISceneViewDao;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        public function execute(e:SceneEvent):AsyncToken
        {
            log.info("@@@调用远程方法，加载景区场景下用户数数据！");
            return dao.queryAreaCount();
        }

        public function result(data:Object):void
        {
            log.info("@@@加载景区场景下用户数数据成功！");
            dm.userNumList.removeAll();
            dm.userNumList.addAll(data as IList);

            var sort:Sort = new Sort();
            //按照usernum降序排序  
            sort.fields = [new SortField("usernum", true, true, true)];
            dm.userNumList.sort = sort;
            dm.userNumList.refresh();

            msgDispatcher(new SceneEvent(SceneEvent.DEAL_SCENE_JINGQUKPI));
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
			msgDispatcher(new Event("REQUEST_COMPLETE"));
            log.error("@@@加载景区场景下用户数数据错误：" + f.faultString + "\n" + f.faultDetail);
        }
    }
}
