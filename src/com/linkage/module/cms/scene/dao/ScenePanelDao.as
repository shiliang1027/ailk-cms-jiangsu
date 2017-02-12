package com.linkage.module.cms.scene.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.domain.common.IUser;

    import flash.utils.ByteArray;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;
    import mx.utils.ObjectUtil;

    /**
     *
     *
     * @author 张传存 (69207)
     * @version 1.0
     * @date 2012-8-3
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class ScenePanelDao implements IScenePanelDao
    {
        private var log:ILogger = Log.getLoggerByClass(ScenePanelDao);
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

        /**
         * 获取应急概况信息
         */
        public function getSceneEmgyInfo():AsyncToken
        {
            init();
            return rmtObj.getSceneEmgyInfo(user);
        }

        /**
         * 根据应急资源类型查询应急资源详细
         */
        public function getSceneEmgyDetail(param:Object):AsyncToken
        {
            init();
            log.debug("查询应急资源详细");
            return rmtObj.getSceneEmgyDetail({'empergResType': param.emergrestype, "isUsed": param.isUsed, "sceneId": user.sceneId, "level": user.level, "cityId": user.cityId});
        }

        /**
         * 查询应急资源轨迹
         */
        public function getSceneEmgyChg(resId:String, beginTime:String, endTime:String):AsyncToken
        {
            init();
            return rmtObj.getSceneEmgyChg({"emgyId": resId, "beginTime": beginTime, "endTime": endTime, "sceneId": user.sceneId, "level": user.level});
        }

        /**
         * 获取重点指标数据
         */
        public function getSceneCoreKpi(startTime:String, endTime:String):AsyncToken
        {
            log.info("load CoreKpi chart data!");
            init();
            return rmtObj.getSceneCoreKpi(user, user.sceneId, user.level, startTime, endTime);
        }

        /**
         * 获取指标概况列表数据
         */
        public function getSceneKpiGeneralInfo():AsyncToken
        {
            log.info("load CoreKpi chart data!");
            init();
            return rmtObj.getSceneKpiGeneralInfo(user);
        }

        /**
         * 获取网元性能TOPN 下拉指标列表
         */
        public function getSceneKpiList():AsyncToken
        {
            init();
            return rmtObj.getSceneKpiList(user);
        }

        /**
         * 获取网元性能TOPN 单个指标TOPN数据图表
         */
        public function getSceneTopN(kpiId:String, moTypeId:String):AsyncToken
        {
            log.info("getSceneTopN dao");
            var copy:ByteArray = new ByteArray();
            copy.writeObject(user);
            copy.position = 0;
            var obj:Object = copy.readObject();

            obj.kpiId = kpiId;
            obj.moTypeId = moTypeId;

            init();

            return rmtObj.getSceneTopN(obj);
        }

        /**
         *获取漫游数据信息
         */
        public function getSceneRoamInfo():AsyncToken
        {
            log.info("调用远程方法 加载漫游图表数据！");
            init();
            return rmtObj.getSceneRoamInfo(user);
        }

        /**
         * 获取天气概况信息
         */
        public function getSceneWeatherInfo():AsyncToken
        {
            log.info("调用远程方法 加载weather数据！");
            init();
            return rmtObj.getSceneWeatherInfo(user, user.sceneId, user.level);
        }

        /**
         * 根据城市ID天气详细信息
         */
        public function getSceneWeatherDetail(cityId:String):AsyncToken
        {
            init();
            return rmtObj.getSceneWeatherDetail(user, cityId);
        }

        /**
         * 根据指标ID获取指标概况图表信息
         */
        public function getKpiHisByKpiId(user:IUser):AsyncToken
        {
            init();
            return rmtObj.getKpiHisByKpiId(user);
        }
		
		/**
		 * 根据指标ID获取指标概况图表信息
		 */
		public function getKpiHisByKpiIdNew(param:Object):AsyncToken
		{
			init();
			return rmtObj.getKpiHisByKpiId(param);
		}


        public function getSceneTyphoonInfo():AsyncToken
        {
            init();
            return rmtObj.getSceneTyphoonInfo(user, user.sceneId, user.level);
        }

        /**
         * 获得今日运动会赛事列表信息
         */
        public function getSceneTodayGameList():AsyncToken
        {
            init();

            return rmtObj.getSceneTodayGameList(user);
        }

        /**
         * 查询台风影响地市信息
         */
        public function getCoverCityMsg():AsyncToken
        {
            init();

            return rmtObj.getCoverCityMsg(user);
        }

        public function getTopNAreaList(user:IUser):AsyncToken
        {
            init();

            return rmtObj.getTopNAreaList(user);
        }

        public function getKpiCompareyKpiId(user:IUser):AsyncToken
        {
            init();
            return rmtObj.getKpiCompareyKpiId(user);
        }

        public function getSceneTopNAll(strKpiId:String, strMoTypeId:String):AsyncToken
        {
            var copy:ByteArray = new ByteArray();
            copy.writeObject(user);
            copy.position = 0;
            var obj:Object = copy.readObject();

            obj.kpiId = strKpiId;
            obj.moTypeId = strMoTypeId;

            init();
            return rmtObj.getSceneTopNAll(obj);
        }


        public function updateEmgyIsUsed(param:Object):AsyncToken
        {
            return rmtObj.updateEmgyIsUsed(param);
        }

        public function getMoKpiHisByKpiId(user:IUser):AsyncToken
        {
            init();
            return rmtObj.getMoKpiHisByKpiId(user);
        }
		

        public function updateSceneTopnNum(param:Object):AsyncToken
        {
            init();
            return rmtObj.updateSceneTopnNum(param);
        }

        public function getSceneDetail(param:Object):AsyncToken
        {
            init();
            return rmtObj.getSceneDetail(param);
        }

        /**
         * 查询阈值指标
         */
        public function queryAllPerf(param:Object):AsyncToken
        {
            init();
            return rmtObj.queryAllPerf(param);
        }

        /**
         * 保存指标配置
         */
        public function kpiConfig(param:Object):AsyncToken
        {
            init();
            return rmtObj.kpiConfig(param);
        }

        /**
         * 阈值配置指标保存
         */
        public function thresholdConfig(param:Object):AsyncToken
        {
            init();
            return rmtObj.thresholdConfig(param);
        }

        /**
         * 区域、网元劣化趋势数据查询
         */
        public function queryBadHis(param:Object):AsyncToken
        {
            init();
            return rmtObj.queryBadHis(param);
        }

        /**
         * 查询阈值
         */
        public function queryThreshold(param:Object):AsyncToken
        {
            init();
            return rmtObj.queryThreshold(param);
        }

        /**
         * 查询场景信息
         */
        public function queryShareScene(param:Object):AsyncToken
        {
            init();
            return rmtObj.queryScene(param);
        }

        /**
         * 查询场景信息
         */
        public function saveShareScene(param:Object):AsyncToken
        {
            init();
            return rmtObj.saveShareScene(param);
        }

        public function topnKpiConfig(param:Object):AsyncToken
        {
            init();
            return rmtObj.topnKpiConfig(param);
        }

        public function getSceneConfigTopN(param:Object):AsyncToken
        {
            init();
            return rmtObj.getSceneConfigTopN(param);
        }


        public function queryTopnKpiConfig(param:Object):AsyncToken
        {
            init();
            return rmtObj.queryTopnKpiConfig(param);
        }

        public function getCameraList(param:Object):AsyncToken
        {
            init();
            return rmtObj.queryVideoTerminal(param);
        }

        public function queryCameraList(param:Object):AsyncToken
        {
            init();
            return rmtObj.queryVideoTerminal(param);
        }

        public function get endpoint():String
        {
            return _endpoint;
        }

        public function set endpoint(value:String):void
        {
            _endpoint = value;
        }

        public function get destination():String
        {
            return _destination;
        }

        public function set destination(value:String):void
        {
            _destination = value;
        }


    }
}

