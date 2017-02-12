package com.linkage.module.cms.scene.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;


    /*
     *说明：
     *作者：panyin
     *时间：2012-11-28下午7:41:45
     **/

    public class SiteAlarmDao implements ISiteAlarmDao
    {
        private var log:ILogger = Log.getLoggerByClass(SceneViewDao);

        private var _destination:String;
        private var _endpoint:String;

        private var rmtObj:RemoteObject;

        [Init]
        public function init():void
        {
            rmtObj = new RemoteObject(_destination);
            rmtObj.endpoint = _endpoint;
            rmtObj.showBusyCursor = false;
        }

        public function loadSiteAlarmInfo(siteIds:String):AsyncToken
        {
            log.info("调用远程方法 加载机楼告警信息! " + siteIds);
            return rmtObj.getSiteAlarmInfo({'siteid': siteIds});
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

