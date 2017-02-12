package com.linkage.module.cms.scene.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.domain.common.IUser;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    /**
     *
     * 赛事信息
     * @author hurw (69065)
     * @version 1.0
     * @date 2013-7-25
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class RaceInfoDAO implements IRaceInfoDAO
    {
        private var log:ILogger = Log.getLoggerByClass(RaceInfoDAO);

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

        public function saveRaceInfos(param:Object):AsyncToken
        {
            init();
            return rmtObj.saveRaceInfos(param);
        }

        public function modifyRaceInfos(param:Object):AsyncToken
        {
            init();
            return rmtObj.modifyRaceInfos(param);
        }

        public function deleteRaceInfos(param:Object):AsyncToken
        {
            init();
            return rmtObj.deleteRaceInfos(param);
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
