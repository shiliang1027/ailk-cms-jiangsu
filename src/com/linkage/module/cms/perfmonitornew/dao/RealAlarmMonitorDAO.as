package com.linkage.module.cms.perfmonitornew.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.system.rpc.remoting.BlazeDSUtil;
    import com.linkage.module.cms.components.loadmanager.LoadManager;
    
    import mx.collections.ArrayCollection;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.remoting.RemoteObject;

    public class RealAlarmMonitorDAO
    {
        private static var instance:RealAlarmMonitorDAO;
        //日志
        private var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitornew.dao.RealAlarmMonitorDAO");

        public static var context:String = "/cms/";
        private var endpoint:String = "messagebroker/amf";
        private var remoteDestination:String = "flexdestination_cms_perfmonitornew_alarm_dataService";
        private var remoteSource:String = "com.linkage.module.cms.perfmonitornew.kpi.serv.AlarmServImp";

        public var lm:LoadManager;

        public static function getInstance():RealAlarmMonitorDAO
        {
            if (instance == null)
                instance = new RealAlarmMonitorDAO;

            return instance;
        }

        public function getData(param:Object, success:Function, error:Function = null):void
        {
            lm.showLoading();

            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("pmdao-getData-调用java接口查询[网元矩阵]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-getData-调用java接口查询[网元矩阵]成功返回,但是结果集为空");

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getData-调用java接口查询[网元矩阵]异常。" + event.fault.faultString);

                    lm.hideLoading();

                    if (error != null)
                        error.call(null, event);
                });

            log.info("pmdao-getData-开始调用java接口查询[网元矩阵]。[" + context + "]");
            log.debug(param);

            remote.getBadNeList(param);
            remote = null;
        }
		
        public function loadKpiByUser(param:Object, success:Function, error:Function = null):void
        {
            lm.showLoading();

            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("pmdao-loadKpiByUser-调用java接口查询[网元矩阵]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-loadKpiByUser-调用java接口查询[网元矩阵]成功返回,但是结果集为空");

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-loadKpiByUser-调用java接口查询[网元矩阵]异常。" + event.fault.faultString);

                    lm.hideLoading();

                    if (error != null)
                        error.call(null, event);
                });

            log.info("pmdao-loadKpiByUser-开始调用java接口查询[网元矩阵]。[" + context + "]");
            log.debug(param);

            remote.loadKpiByUser(param);
            remote = null;
        }
		
        public function saveKpi(param:ArrayCollection, success:Function, error:Function = null):void
        {
            lm.showLoading();

            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("pmdao-saveKpi-调用java接口查询[网元矩阵]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-saveKpi-调用java接口查询[网元矩阵]成功返回,但是结果集为空");

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-saveKpi-调用java接口查询[网元矩阵]异常。" + event.fault.faultString);

                    lm.hideLoading();

                    if (error != null)
                        error.call(null, event);
                });

            log.info("pmdao-saveKpi-开始调用java接口查询[网元矩阵]。[" + context + "]");
            log.debug(param);

            remote.saveKpi(param);
            remote = null;
        }
		
    }
}
