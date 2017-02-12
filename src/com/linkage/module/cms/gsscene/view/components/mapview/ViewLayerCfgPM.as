package com.linkage.module.cms.gsscene.view.components.mapview
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
    import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
    
    import flash.utils.ByteArray;
    
    import mx.controls.Alert;

    public class ViewLayerCfgPM
    {
        private var log:ILogger = Log.getLoggerByClass(ViewLayerCfgPM);

        [MessageDispatcher]
        public var msgDispatcher:Function;

        [Inject("user")]
        public var user:IUser;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

        public function viewLayerCfgChange(type:String = null):void
        {
            log.info("filter feature:派发过滤图层的事件。");

            var e:SceneEvent = new SceneEvent(SceneEvent.FILTER_LAYER);
            e.filterType = type;
            msgDispatcher(e);
        }

        public function loadPolygon(refreshDataFlag:Boolean = false):void
        {
            user.isDrillDown = true;

            if (user.currentMapType == "0" && user.level == "2") //矢量图  一级视图 地市试图  LTE场景默认 不加载泰森多边形
            {
                if (user.isGisFlag == "0")
                {
                    if ("2" == user.logicalType && !refreshDataFlag)
                        return;

                    log.info("加载场景/区域泰森多边形数据:" + user.sceneId);
//                    msgDispatcher(new SceneEvent(SceneEvent.LOAD_SCENE_POLYGON));
					requestServerUtil.addRequest(new SceneEvent(SceneEvent.LOAD_SCENE_POLYGON));

                }
                else
                {
                    msgDispatcher(new SceneEvent(SceneEvent.SEARCH_MOGIS_LAYER));
                    user.isGisFlag = "0";
                }
            }
        }

        public function refreshPolygon():void
        {
            user.refreshPolygon = true;

            loadPolygon();
        }
    }
}

