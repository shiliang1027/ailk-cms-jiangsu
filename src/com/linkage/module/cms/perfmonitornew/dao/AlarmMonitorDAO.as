package com.linkage.module.cms.perfmonitornew.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.system.rpc.remoting.BlazeDSUtil;
    import com.linkage.module.cms.components.loadmanager.LoadManager;

    import mx.rpc.events.FaultEvent;
    import mx.rpc.remoting.RemoteObject;

    public class AlarmMonitorDAO
    {
        private static var instance:AlarmMonitorDAO;
        //日志
        private var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitornew.dao.AlarmMonitorDAO");

        public static var context:String = "/cms/";
        private var endpoint:String = "messagebroker/amf";
        private var remoteDestination:String = "flexdestination_cms_perfmonitornew_alarm_dataService";
        private var remoteSource:String = "com.linkage.module.cms.perfmonitornew.kpi.serv.AlarmServImp";

        public var lm:LoadManager;

        public static function getInstance():AlarmMonitorDAO
        {
            if (instance == null)
                instance = new AlarmMonitorDAO;

            return instance;
        }

        public function getKpiAlarm(param:Object, success:Function, error:Function = null):void
        {
            lm.showLoading();

            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("pmdao-getKpiAlarm-调用java接口查询[网元矩阵]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-getKpiAlarm-调用java接口查询[网元矩阵]成功返回,但是结果集为空");

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getKpiAlarm-调用java接口查询[网元矩阵]异常。" + event.fault.faultString);

                    lm.hideLoading();

                    if (error != null)
                        error.call(null, event);
                });

            log.info("pmdao-getKpiAlarm-开始调用java接口查询[网元矩阵]。[" + context + "]");
            log.debug(param);

            remote.getKpiAlarm(param);
            remote = null;
        }
		
        public function getBadNeList(param:Object, success:Function, error:Function = null):void
        {
            lm.showLoading();

            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("pmdao-getBadNeList-调用java接口查询[网元矩阵]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-getBadNeList-调用java接口查询[网元矩阵]成功返回,但是结果集为空");

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getBadNeList-调用java接口查询[网元矩阵]异常。" + event.fault.faultString);

                    lm.hideLoading();

                    if (error != null)
                        error.call(null, event);
                });

            log.info("pmdao-getBadNeList-开始调用java接口查询[网元矩阵]。[" + context + "]");
            log.debug(param);

            remote.getBadNeList(param);
            remote = null;
        }
		
        public function getAllPfList(param:Object, success:Function, error:Function = null):void
        {
            lm.showLoading();

            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("pmdao-getAllPfList-调用java接口查询[网元矩阵]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-getAllPfList-调用java接口查询[网元矩阵]成功返回,但是结果集为空");

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getAllPfList-调用java接口查询[网元矩阵]异常。" + event.fault.faultString);

                    lm.hideLoading();

                    if (error != null)
                        error.call(null, event);
                });

            log.info("pmdao-getAllPfList-开始调用java接口查询[网元矩阵]。[" + context + "]");
            log.debug(param);

            remote.getAllPfList(param);
            remote = null;
        }
    }
}
