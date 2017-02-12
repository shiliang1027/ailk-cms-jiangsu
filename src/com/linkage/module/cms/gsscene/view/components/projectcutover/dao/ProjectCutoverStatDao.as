package com.linkage.module.cms.gsscene.view.components.projectcutover.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    public class ProjectCutoverStatDao implements IProjectCutoverStatDao
    {
        private var log:ILogger = Log.getLoggerByClass(ProjectCutoverStatDao);

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

        public function loadProjectCutoverData():AsyncToken
        {
            log.info("调用远程方法 加载工程割接信息!");
            log.info(user);
            init();
            return rmtObj.querySceneProjectCutoverWithCity(user);
        }

        public function loadProjectCutoverAlarmsData(param:Object):AsyncToken
        {
            log.info("调用远程方法 加载工程割接告警信息!");
            log.info(param);
            init();
            return rmtObj.queryProjectCutoverStatInfoDetail(param);
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
