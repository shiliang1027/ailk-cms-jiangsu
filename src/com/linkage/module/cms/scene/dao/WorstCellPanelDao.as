package com.linkage.module.cms.scene.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.domain.WorstCellPanelDM;
    import com.linkage.module.cms.scene.domain.common.IUser;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    public class WorstCellPanelDao implements IWorstCellPanelDao
    {
        private var log:ILogger = Log.getLoggerByClass(WorstCellPanelDao);

        private var _destination:String;
        private var _endpoint:String;

        private var rmtObj:RemoteObject;

        [Inject("user")]
        public var user:IUser;

        [Inject("worstCellPanelDM")]
        public var dm:WorstCellPanelDM;

        public function init():void
        {
            if (rmtObj == null)
            {
                rmtObj = new RemoteObject(_destination);
                rmtObj.endpoint = _endpoint;
                rmtObj.showBusyCursor = false;
            }
        }

        public function loadData():AsyncToken
        {
            log.info("调用远程方法 加载小区信息!");

            var p:Object = {};
            p.level = user.level;
            p.sceneId = user.initSceneId;
            p.flag = dm.currectSelectFlag;

            if (user.level == "2")
                p.areaId = user.areaId;
            else if (user.level == "3")
                p.cityId = user.cityId;

            log.info(p);

            init();

            return rmtObj.getWorstCellData(p);
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
