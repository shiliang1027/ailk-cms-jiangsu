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
     * @date 2012-12-13
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class AreaQuickConfigDao implements IAreaQuickConfigDao
    {
        private var log:ILogger = Log.getLoggerByClass(AreaQuickConfigDao);

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

        public function getPref(p:Object):AsyncToken
        {
            return rmtObj.getConfigurationKpiList(p);
        }

        public function getSceneList(p:Object):AsyncToken
        {
            return rmtObj.getSceneListByType(p);
        }

        public function getScenePanelList(p:Object):AsyncToken
        {
            return rmtObj.getConfigurationPanelList(p);
        }

        public function getAreaTrack(p:Object):AsyncToken
        {
            return rmtObj.getAreaTrack(p);
        }

        public function getCityList():AsyncToken
        {
            return rmtObj.getCityList();
        }

        public function getAreaByGis(p:Object):AsyncToken
        {
            return rmtObj.getGisAreaList(p);
        }

        public function getThumbnail(areaName:String):AsyncToken
        {
            return rmtObj.getThumbnail(areaName);
        }

        public function queryMapContainsMo(p:Object):AsyncToken
        {
            return rmtObj.getMarqueeNeList(p);
        }

        public function getPerfByMoType(p:Object):AsyncToken
        {
            return rmtObj.getPerfByMoType(p);
        }

        public function loadBaseTree(p:Object):AsyncToken
        {
            //return rmtObj.getUnClickNodeTree(p);
			return rmtObj.loadBaseTree(p);
        }

        public function loadPageTree(p:Object):AsyncToken
        {
//			return rmtObj.getClickNodeTree(p);
			return rmtObj.loadPageTree(p);
        }

        public function loadImpData(p:Object):AsyncToken
        {
            return rmtObj.loadImpData(p);
        }

        public function saveFastConf(p:Object):AsyncToken
        {
            p.account = user.account;
            log.debug(p);
            return rmtObj.saveConfiguration(p);
        }

        public function getSceneTypeList():AsyncToken
        {
            return rmtObj.getSceneTypeList();
        }

        public function getMoType():AsyncToken
        {
            return rmtObj.getMoTypeList();
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
