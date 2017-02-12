package com.linkage.module.cms.perfmonitornew.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.system.rpc.remoting.BlazeDSUtil;
    import com.linkage.module.cms.components.loadmanager.LoadManager;
    
    import mx.controls.Alert;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.remoting.RemoteObject;

    public class TOPNMonitorDAO
    {
        private static var instance:TOPNMonitorDAO;
        //日志
        private var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitornew.dao.TOPNMonitorDAO");

        public static var context:String = "/cms/";
        private var endpoint:String = "messagebroker/amf";
		private var treeRemoteDestination:String = "flexdestination_cms_perfmonitornew_kpi_dataService";
		private var treeRemoteSource:String = "com.linkage.module.cms.perfmonitornew.kpi.serv.KpiServImp";
		private var remoteDestination:String = "flexdestination_cms_perfmonitornew_kpi_dataService";
		private var remoteSource:String = "com.linkage.module.cms.perfmonitornew.kpi.serv.KpiServImp";

        public var lm:LoadManager;

        public static function getInstance():TOPNMonitorDAO
        {
            if (instance == null)
                instance = new TOPNMonitorDAO;

            return instance;
        }
		
		

		
		public function getSchemeByUser(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(
				remoteDestination, treeRemoteSource, context + endpoint,
				function(result:Object):void
				{
					//                    log.info("pmdao-getSchemeTree-调用java接口查询[监控方案树]成功返回。");
					//                    log.debug(result);
					if (result != null)
						success.call(null, result);
					else
						log.error("pmdao-getSchemeTree-调用java接口查询[监控方案树]成功返回,但是结果集为空");
					
				},
				function(event:FaultEvent):void
				{
					log.error("pmdao-getSchemeTree-调用java接口查询[监控方案树]异常。" + event.fault.faultString);
					
					if (error)
						error.call(null, event);
				});
			
			//            log.info("pmdao-getSchemeTree-开始调用java接口查询[监控方案树]。");
			
			
			remote.getSchemeByUser(param);
			remote = null;
		}

        public function getTopnKpiData(param:Object, success:Function, error:Function = null):void
        {
            lm.showLoading();

            var remote:RemoteObject = BlazeDSUtil.newService(
				treeRemoteDestination, treeRemoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("pmdao-getTopnKpiData-调用java接口查询[网元矩阵]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-getTopnKpiData-调用java接口查询[网元矩阵]成功返回,但是结果集为空");

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getTopnKpiData-调用java接口查询[网元矩阵]异常。" + event.fault.faultString);

                    lm.hideLoading();

                    if (error != null)
                        error.call(null, event);
                });

            log.info("pmdao-getTopnKpiData-开始调用java接口查询[网元矩阵]。[" + context + "]");
            log.debug(param);

            remote.getTopnKpiData(param);
            remote = null;
        }
		
        public function getPerTopnByKpi(param:Object, success:Function, error:Function = null):void
        {
            lm.showLoading();

            var remote:RemoteObject = BlazeDSUtil.newService(
				treeRemoteDestination, treeRemoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("pmdao-getPerTopnByKpi-调用java接口查询[网元矩阵]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-getPerTopnByKpi-调用java接口查询[网元矩阵]成功返回,但是结果集为空");

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getPerTopnByKpi-调用java接口查询[网元矩阵]异常。" + event.fault.faultString);

                    lm.hideLoading();

                    if (error != null)
                        error.call(null, event);
                });

            log.info("pmdao-getPerTopnByKpi-开始调用java接口查询[网元矩阵]。[" + context + "]");
            log.debug(param);

            remote.getPerTopnByKpi(param);
            remote = null;
        }
		
    }
}
