package com.linkage.module.cms.scene.dao
{
    /**
     *
     *
     * @author xudx (69291)
     * @version 1.0
     * @date 2012-7-27
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */

    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.domain.common.IUser;

    import mx.controls.Alert;
    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    public class SceneIntro1Dao implements ISceneIntro1Dao
    {
        private var _destination:String;
        private var _endpoint:String;

        private var log:ILogger = Log.getLoggerByClass(SceneIntro1Dao);

        [Inject("user")]
        public var user:IUser;

        private var rmtObj:RemoteObject; //RemoteObject 类使您可以访问远程应用程序服务器上的类。

        public function init():void
        {
            if (rmtObj == null)
            {
                rmtObj = new RemoteObject(_destination);
                rmtObj.endpoint = _endpoint;
                rmtObj.showBusyCursor = false;
            }
        }

        public function updateSceneInfo(params:Object):AsyncToken
        {
            init();
            log.info("999999999");
            log.info(rmtObj == null);
            log.info(rmtObj.endpoint);
            log.info(rmtObj.destination);
            return rmtObj.updateSceneInfo(params);
        }

        public function sceneIntroduction(obj:Object):AsyncToken
        {
            init();
            log.info("999999999  sceneIntroduction");
            return rmtObj.sceneIntroduction(obj);
        }

        public function set destination(value:String):void
        {
            _destination = value;
        }

        public function set endpoint(value:String):void
        {
            _endpoint = value;
        }

    }
}

