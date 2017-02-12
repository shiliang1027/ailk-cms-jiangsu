package com.linkage.module.cms.scene.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.domain.common.IUser;

    import flash.utils.ByteArray;

    import mx.controls.Alert;
    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    /**
     *
     *
     * @author hurw (69065)
     * @version 1.0
     * @date 2012-7-30
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class SceneTreeDAO implements ISceneTreeDAO
    {
        private var log:ILogger = Log.getLoggerByClass(SceneTreeDAO);

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

        [Inject]
        public var user:IUser;

        /**
         * 获取场景导航tree
         * */
        public function getSceneAreaList(param:Object = null):AsyncToken
        {
            log.info("获取场景导航tree 调用java接口getSceneAreaList，参数如下");
            init();

            if (param == null)
            {
                param = new Object();
                param.sceneId = user.sceneId;
                param.level = user.level;
                param.cityId = user.cityId;
                param.flag = "0";
            }
            return rmtObj.getSceneAreaList(param);
        }

        public function getSceneAreaThumb():AsyncToken
        {
            log.info("[缩略图]加载调用接口");

            var copy:ByteArray = new ByteArray();
            copy.writeObject(user);
            copy.position = 0;
            var obj:Object = copy.readObject();

            init();
            return rmtObj.getSceneAreaThumb(obj);
        }

        public function getAreaBadAndImpPerf(param:Object):AsyncToken
        {
            log.info("[缩略图tip窗口]加载调用接口");
            init();
            return rmtObj.getAreaBadAndImpPerf(param);
        }

        public function deleteImgData(param:Object):AsyncToken
        {
            log.info("[缩略图-删除区域]加载调用接口");
            init();
            return rmtObj.deleteImgData(param);
        }

        public function updateListAreaStatus(param:Object):AsyncToken
        {
            log.info("[缩略图-启停区域]加载调用接口");
            init();
            return rmtObj.updateListAreaStatus(param);
        }

        public function queryUpdateAreaName(param:Object):AsyncToken
        {
            log.info("[缩略图-启停区域]加载调用接口");
            init();
            return rmtObj.queryUpdateAreaName(param);
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

