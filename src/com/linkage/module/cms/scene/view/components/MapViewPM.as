package com.linkage.module.cms.scene.view.components
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.ailk.common.ui.gis.core.GisLayer;
    import com.ailk.common.ui.gis.core.metry.GisPoint;
    import com.linkage.module.cms.scene.domain.MapViewDM;
    import com.linkage.module.cms.scene.domain.common.IUser;
    import com.linkage.module.cms.scene.event.SceneEvent;
    
    import flash.display.Scene;

    public class MapViewPM
    {
        private var log:ILogger = Log.getLoggerByClass(MapViewPM);

        [MessageDispatcher]
        public var msgDispatcher:Function;

        [Bindable]
        [Inject("mapViewDM")]
        public var mapViewDM:MapViewDM;

        [Inject("user")]
        public var user:IUser;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
        public function initMapView():void
        {
            log.info("[gis地图]初始化地图数据，user如下：");
            log.info(user);

            if ((user.showMoLayer == "0" && user.level != "1") || user.level == "3" || user.level == "2")
            {
                log.info("加载场景/区域的缩略图 event:" + user.sceneId);
//                msgDispatcher(new SceneEvent(SceneEvent.LOAD_SCENE_SNAPSHOTS));
				requestServerUtil.addRequest(new SceneEvent(SceneEvent.LOAD_SCENE_SNAPSHOTS));
            }

//            mapViewDM.impKpiList.removeAll();

//            log.info("开始加载重点指标信息 imp kpi event！");
////            msgDispatcher(new SceneEvent(SceneEvent.LOAD_IMP_KPI));
//			requestServerUtil.addRequest(new SceneEvent(SceneEvent.LOAD_IMP_KPI));
        }

        public function loadTyphoon():void
        {
            log.info("加载台风数据:" + user.sceneId);
//            msgDispatcher(new SceneEvent(SceneEvent.LOAD_TYPHOON_DATA));
			requestServerUtil.addRequest(new SceneEvent(SceneEvent.LOAD_TYPHOON_DATA));
        }

        public function loadCityLayers():void
        {
            log.info("加载地市图层数据:" + user.sceneId);
//            msgDispatcher(new SceneEvent(SceneEvent.LOAD_CITY_LAYER));
			requestServerUtil.addRequest(new SceneEvent(SceneEvent.LOAD_CITY_LAYER));
        }

        public function getCityRoadIndicatorLight():void
        {
            log.info("加载道路性能劣化信息:" + user.sceneId);
//            msgDispatcher(new SceneEvent(SceneEvent.LOAD_ROAD_PERF_MSG));
			requestServerUtil.addRequest(new SceneEvent(SceneEvent.LOAD_ROAD_PERF_MSG));
        }

        public function loadLineInfo(moId:String):void
        {
            log.info("加载传输管线信息:" + moId);
            var e:SceneEvent = new SceneEvent(SceneEvent.LOAD_LINE_INFO);
            e.param = moId;
//            msgDispatcher(e);
			requestServerUtil.addRequest(e);
        }

        public function loadLineGisInfo(circName:String):void
        {
            log.info("加载传输管线 GIS撒点信息:" + circName);
            var e:SceneEvent = new SceneEvent(SceneEvent.LOAD_LINE_GIS_INFO);
            e.param = circName;
//            msgDispatcher(e);
			requestServerUtil.addRequest(e);
        }

        public function loadOpticInfo(circName:String):void
        {
            log.info("加载光路信息:" + circName);
            var e:SceneEvent = new SceneEvent(SceneEvent.LOAD_OPTIC_INFO);
            e.param = circName;
//            msgDispatcher(e);
			requestServerUtil.addRequest(e);
        }

        public function loadSiteAlarmInfo(siteIds:String):void
        {
            log.info("加载机楼告警信息:" + siteIds);
            var e:SceneEvent = new SceneEvent(SceneEvent.LOAD_SITE_ALARM);
            e.param = siteIds;
//            msgDispatcher(e);
			requestServerUtil.addRequest(e);
        }

        private var pointsNum:int = 100;

        public function createCirclePoints(centerPoint:GisPoint, radius:Number):Array
        {
            var points:Array = new Array();
            var i:Number;
            var sin:Number;
            var cos:Number;
            var x:Number;
            var y:Number;

            i = 0;

            while (i < this.pointsNum)
            {

                sin = Math.sin(Math.PI * 2 * i / pointsNum);
                cos = Math.cos(Math.PI * 2 * i / pointsNum);
                x = centerPoint.x + radius / 96490 * cos;
                y = centerPoint.y + radius / 110850 * sin;
                points[i] = new GisPoint(x, y);
                i++;
            }

            points.push(points[0]);
            return points;
        }

        public function clearFeatures():void
        {
            log.info("清空GIS数据！" + user.sceneId);
            mapViewDM.gisLayerMap = null;
            mapViewDM.gisLayerMap = {};
        }
    }
}

