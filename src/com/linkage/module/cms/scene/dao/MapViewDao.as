package com.linkage.module.cms.scene.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.domain.common.IUser;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    public class MapViewDao implements IMapViewDao
    {
        private var log:ILogger = Log.getLoggerByClass(MapViewDao);

        private var _destination:String;
        private var _endpoint:String;

        private var rmtObj:RemoteObject;

        [Inject("user")]
        public var user:IUser;

        public function init():void
        {
            if (rmtObj == null)
            {
                rmtObj = new RemoteObject(_destination);
                rmtObj.endpoint = _endpoint;
                rmtObj.showBusyCursor = false;
            }
        }

        //区域缩略图
        public function getRegionImgs():AsyncToken
        {
            init();
            return rmtObj.getSceneImg(user);
        }

        //泰森多边形
        public function getScenePolygonData():AsyncToken
        {
            init();
            return rmtObj.getScenePolygon(user);
        }

        //地市图层
        public function getCityGisId():AsyncToken
        {
            init();
            return rmtObj.getCityGisId();
        }

        //重点指标
        public function getSceneImpKpi():AsyncToken
        {
            init();
            return rmtObj.getImpKpi(user);
        }

        //加载退服原因
        public function getOutServerReason():AsyncToken
        {
            init();
            return rmtObj.getOutServerReason(user);
        }

        //加载道路场景 区域的劣化情况。
        public function getCityRoadIndicatorLight():AsyncToken
        {
            init();
            return rmtObj.getCityRoadIndicatorLight(user);
        }

        //网元gis定位
        public function getMoLatitudeByMoId(param:Object):AsyncToken
        {
            init();
            return rmtObj.getMoLatitudeByMoId(param);
        }


        public function queryMoByCon(p:Object):AsyncToken
        {
            init();
            log.debug("接口:参数");
            log.debug(p);
            return rmtObj.queryMoByCon(p);
        }

        public function queryMoContains(p:Object):AsyncToken
        {
            init();
            log.debug("圈圈接口:参数");
            log.debug(p);
            return rmtObj.queryMoContainsMo(p);
        }

        //网元gis定位
        public function getMultiMoLatitudeByMoId(param:Object):AsyncToken
        {
            init();
            return rmtObj.getMultiMoLatitudeByMoId(param);
        }


        public function get destination():String
        {
            init();
            return _destination;
        }

        public function set destination(value:String):void
        {
            _destination = value;
        }

        public function get endpoint():String
        {
            return _endpoint;
        }

        public function set endpoint(value:String):void
        {
            _endpoint = value;
        }
    }
}

