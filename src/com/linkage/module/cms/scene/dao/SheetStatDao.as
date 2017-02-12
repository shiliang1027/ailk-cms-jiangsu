package com.linkage.module.cms.scene.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.domain.common.IUser;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    public class SheetStatDao implements ISheetStatDao
    {
        private var log:ILogger = Log.getLoggerByClass(SheetStatDao);

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

        public function loadSheetData():AsyncToken
        {
            log.info("调用远程方法 加载工单信息!");

            if (user.level == "3")
                user.sceneId = user.sceneId;
//              user.sceneId = user.cityId;


            log.info(user);
            init();
            return rmtObj.querySceneSheetWithCity(user);
        }

        public function loadSheetDataMotype(p:Object):AsyncToken
        {
            log.info("调用远程方法 加载工单Motype信息!");
            var param:Object = {};
            param.level = user.level;
            param.sceneId = user.sceneId;
            param.cityName = p;
            log.info(param);
            init();
            return rmtObj.querySceneSheetWithMoType(param);
        }

        public function loadSheetAlarmsData(param:Object):AsyncToken
        {
            log.info("调用远程方法 加载工单告警信息!");
            log.info(param);
            init();
            return rmtObj.querySheetStatInfoDetail(param);
        }

        public function get destination():String
        {
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
