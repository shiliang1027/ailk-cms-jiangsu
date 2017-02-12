package com.linkage.module.cms.perfmonitornew.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.system.rpc.remoting.BlazeDSUtil;
    import com.linkage.module.cms.components.loadmanager.LoadManager;
    
    import mx.rpc.events.FaultEvent;
    import mx.rpc.remoting.RemoteObject;

    public class PerfMonitorDAO
    {
        private static var instance:PerfMonitorDAO;
        //日志
        private var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitornew.dao.PerfMonitorDAO");

        public static var context:String;
        private var endpoint:String = "/messagebroker/amf";
        private var remoteDestination:String = "flexdestination_cms_perfmonitornew_kpi_dataService";
        private var remoteSource:String = "com.linkage.module.cms.perfmonitornew.kpi.serv.KpiServImp";
		
        public var lm:LoadManager;

        public static function getInstance(_context:String="/cms/"):PerfMonitorDAO
        {
            if (instance == null)
                instance = new PerfMonitorDAO;
			context=_context;
            return instance;
        }

        public function getAllSpec(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-speclist-调用java接口查询[专业]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-speclist-调用java接口查询[专业]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-speclist-调用java接口查询[专业]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

//            log.info("pmdao-speclist-开始调用java接口查询[专业]列表。[" + context + "]");
            remote.getAllSpec({});
            remote = null;
        }

        public function getAllCity(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-citylist-调用java接口查询[属地]列表成功返回。");
//                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-citylist-调用java接口查询[属地]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-citylist-调用java接口查询[属地]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call();
                });

//            log.info("pmdao-citylist-开始调用java接口查询[属地]列表。");
//            log.debug(param);

            remote.getAllCity(param);
            remote = null;
        }
        public function getAreas(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-citylist-调用java接口查询[属地]列表成功返回。");
//                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-getAreas-调用java接口查询[属地]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getAreas-调用java接口查询[属地]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call();
                });

            remote.getAreas(param);
            remote = null;
        }

        public function getAllVendor(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-vendorlist-调用java接口查询[厂家]列表成功返回。");
//                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-vendorlist-调用java接口查询[厂家]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-vendorlist-调用java接口查询[厂家]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

//            log.info("pmdao-vendorlist-开始调用java接口查询[厂家]列表。");
            remote.getAllVendor({});
            remote = null;
        }

        public function getAllMotype(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-motypelist-调用java接口查询[网元类型]表成功返回。");
//                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-motypelist-调用java接口查询[网元类型]表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-motypelist-调用java接口查询[网元类型]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

//            log.info("pmdao-motypelist-开始调用java接口查询[网元类型]列表。");
            remote.getAllMotype(param);
            remote = null;
        }

        public function getKpiInfo(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-kpilist-调用java接口查询[指标树]成功返回。");
//                    log.debug(result);

                    if (result != null)
                        success.call(null, result);
                    else
                        log.error("pmdao-kpilist-调用java接口查询[指标树]成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-kpilist-调用java接口查询[指标树]异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

//            log.info("pmdao-kpilist-开始调用java接口查询[指标树]。");
//            log.debug(param);

            remote.getKpiInfo(param);
            remote = null;
        }

        public function getKpiList(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-kpilist-调用java接口查询[指标]表成功返回。");
//                    log.debug(result);

                    if (result != null)
                        success.call(null, result);
                    else
                        log.error("pmdao-kpilist-调用java接口查询[指标]表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-kpilist-调用java接口查询[指标]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

//            log.info("pmdao-kpilist-开始调用java接口查询[指标]列表。");
//            log.debug(param);

            remote.getKpiList(param);
            remote = null;
        }

        public function getAllMoinfo(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-moTree-调用java接口查询[网元]表成功返回。");
//                    log.debug(result);

                    if (result != null)
                        success.call(null, result);
                    else
                        log.error("pmdao-moTree-调用java接口查询[网元]表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-moTree-调用java接口查询[网元]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

//            log.info("pmdao-moTree-开始调用java接口查询[网元]列表。");
//            log.debug(param);

            remote.getAllMoinfo(param);
            remote = null;
        }

        public function insertScheme(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-saveScheme-调用java接口保存[方案]成功返回。");
//                    log.debug(result);

                    if (result != null)
                        success.call(null, result);
                    else
                        log.error("pmdao-saveScheme-调用java接口保存[方案]成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-saveScheme-调用java接口保存[方案]异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

//            log.info("pmdao-saveScheme-开始调用java接口保存[方案]。");
//            log.debug(param);

            remote.insertScheme(param);
            remote = null;
        }

        public function deleteScheme(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-deleteScheme-调用java接口删除[方案]成功返回。");
//                    log.debug(result);

                    if (result != null)
                        success.call(null, result);
                    else
                        log.error("pmdao-deleteScheme-调用java接口删除[方案]成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-deleteScheme-调用java接口删除[方案]异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

//            log.info("pmdao-deleteScheme-开始调用java接口删除[方案]。");
//            log.debug(param);

            remote.deleteScheme(param);
            remote = null;
        }


        public function getSchemeByUser(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
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

        public function getMoAndKpiByScheme(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-getSchemeDetail-调用java接口查询[监控方案详情]成功返回。");
//                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("pmdao-getSchemeDetail-调用java接口查询[监控方案详情]成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getSchemeDetail-调用java接口查询[监控方案详情]异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

//            log.info("pmdao-getSchemeDetail-开始调用java接口查询[监控方案详情]。");
//            log.debug(param);

            remote.getMoAndKpiByScheme(param);
            remote = null;
        }

        public function getPerfomanceByKpi(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("pmdao-getPerfomanceByKpi-调用java接口查询[指标数据]成功返回。");
                    log.debug(result);

                    if (result == null || result.length < 1)
                        log.error("pmdao-getPerfomanceByKpi-调用java接口查询[指标数据]成功返回,但是结果集为空");

                    success.call(null, result);

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getPerfomanceByKpi-调用java接口查询[指标数据]异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);

                    lm.hideLoading();
                });

//            log.info("pmdao-getkpivalues-开始调用java接口查询[指标数据]。");
//            log.debug(param);

            remote.getPerfomanceByKpi(param);
            remote = null;
        }

        public function getPerTopnByKpi(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
//                    log.info("pmdao-gettopn-调用java接口查询[TOPN]成功返回。");
//                    log.debug(result);

                    if (result == null || result.length < 1)
                        log.error("pmdao-gettopn-调用java接口查询[TOPN]成功返回,但是结果集为空");

                    success.call(null, result);

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-gettopn-调用java接口查询[TOPN]异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);

                    lm.hideLoading();
                });

//            log.info("pmdao-gettopn-开始调用java接口查询[TOPN]。");
//            log.debug(param);

            remote.getPerTopnByKpi(param);
            remote = null;
        }
		
        public function getPerfHisKpi(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    if (result == null || result.length < 1)
                        log.error("pmdao-getPerfHisKpi-调用java接口查询[TOPN]成功返回,但是结果集为空");

                    success.call(null, result);
                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getPerfHisKpi-调用java接口查询[TOPN]异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                    lm.hideLoading();
                });

            remote.getPerfHisKpi(param);
            remote = null;
        }
        public function getMulPerfTopnByKpi(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    if (result == null || result.length < 1)
                        log.error("pmdao-getMulPerfTopnByKpi-调用java接口查询[TOPN]成功返回,但是结果集为空");

                    success.call(null, result);

                    lm.hideLoading();
                },
                function(event:FaultEvent):void
                {
                    log.error("pmdao-getMulPerfTopnByKpi-调用java接口查询[TOPN]异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);

                    lm.hideLoading();
                });

            remote.getMulPerfTopnByKpi(param);
            remote = null;
        }

		public function queryPerConf(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(
				remoteDestination, remoteSource, context + endpoint,
				function(result:Object):void
				{
					if (result == null || result.length < 1)
						log.error("pmdao-queryPerConf-调用java接口查询成功返回,但是结果集为空");
					
					success.call(null, result);
					
					lm.hideLoading();
				},
				function(event:FaultEvent):void
				{
					log.error("pmdao-queryPerConf-调用java接口查询异常。" + event.fault.faultString);
					
					if (error!=null)
						error.call(null, event);
					
					lm.hideLoading();
				});
			
			remote.queryPerConf(param);
			remote = null;
		}
		
    }
}
