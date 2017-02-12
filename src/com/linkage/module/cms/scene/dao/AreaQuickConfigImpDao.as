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
     * @author 华伟 (69088)
     * @version 1.0
     * @date 2013-1-16
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class AreaQuickConfigImpDao implements IAreaQuickConfigImpDao
    {
        private var log:ILogger = Log.getLoggerByClass(AreaQuickConfigImpDao);

        private var _destination:String;
        private var _endpoint:String;

        private var rmtObj:RemoteObject;

        [Inject("user")]
        public var user:IUser;

        [Init]
        public function initDao():void
        {
            rmtObj = new RemoteObject(_destination);
            rmtObj.endpoint = _endpoint;
			rmtObj.showBusyCursor=false;
        }

        public function getMoInfoByParams(p:Object):AsyncToken
        {
            return rmtObj.getTempImportNeList(p);
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
