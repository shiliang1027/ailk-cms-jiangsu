package com.linkage.module.cms.scene.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.domain.common.IUser;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    /**
     *
     *
     * @author hrw (Ailk No.)
     * @version 1.0
     * @date 2012-7-31
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class ResMatrixDAO implements IResMatrixDAO
    {
        private var log:ILogger = Log.getLoggerByClass(ResMatrixDAO);


        [Inject("user")]
        public var user:IUser;

        private var _destination:String;
        private var _endpoint:String;
        private var rmtObj:RemoteObject;

        public function init():void
        {
            if (rmtObj == null)
            {
                rmtObj = new RemoteObject(_destination);
                rmtObj.endpoint = _endpoint;
                rmtObj.showBusyCursor = false;
            }
        }

        public function getResMatrixList():AsyncToken
        {
            log.info("获取资源矩阵调用java接口getResMatrixList.");
            init();
            return rmtObj.getResMatrixList(user);
        }

        public function getBadNeList():AsyncToken
        {
            log.info("获取资源矩阵调用java接口getBadNeList.");
            init();
            return rmtObj.getBadNeList(user);
        }

        public function getAlarmInfoByMoType(param:Object):AsyncToken
        {
            log.info("获取资源矩阵告警网元数调用java接口getBadNeList.");
            init();
            return rmtObj.getBadNeList(param);
        }

        public function getMoInfoByMoTypeId(param:Object):AsyncToken
        {
            log.info("获取资源矩阵调用java接口getMoInfoByMoTypeId.");
            init();
            return rmtObj.getMoInfoByMoTypeId(param);
        }

        public function getAreaList():AsyncToken
        {
            log.info("获取资源矩阵调用java接口getAreaList.");
            init();
            var p:Object = new Object;
            p.level = user.level;
            p.sceneId = user.sceneId;
            p.cityId = user.cityId;
            return rmtObj.getAreaList(p);
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

