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

    public class SceneIntroDao implements ISceneIntroDao
    {
        private var _destination:String;
        private var _endpoint:String;

        private var log:ILogger = Log.getLoggerByClass(SceneIntroDao);

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

        public function loadData():AsyncToken
        {
            log.info("场景介绍 调用远程方法！");
            var param:Object = new Object();
            param.layerurl = user.layerurl;
            param.sceneTypeId = user.sceneTypeId;
            param.rn = user.rn;
            param.sceneId = user.sceneId;
            param.kpiId = user.kpiId;
            param.layerId = user.layerId;
            param.areaId = user.areaId;
            param.refreshPolygon = user.refreshPolygon;
            param.floatId = user.sceneId;
            param.level = user.level;
            param.kpiName = user.kpiName;
            param.context = user.context;
            param.alarmParam = user.alarmParam;
            param.account = user.account;
            param.showBadMoPoints = user.showBadMoPoints;
            param.floatLevel = user.floatLevel;
            param.usinglayer = user.usinglayer;
            param.showMoLayer = user.showMoLayer;
            param.cityId = user.cityId;

            init();

            return rmtObj.getSceneInfo(param);
        }

        /**
         *网元级列表指标详细信息
         */
        public function getMoTypeBadKpiList():AsyncToken
        {
            return rmtObj.getMoTypeBadKpiList(user);
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

