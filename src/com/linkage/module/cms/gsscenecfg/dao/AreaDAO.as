package com.linkage.module.cms.gsscenecfg.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.system.rpc.remoting.BlazeDSUtil;

    import mx.rpc.events.FaultEvent;
    import mx.rpc.remoting.RemoteObject;

    public class AreaDAO
    {
        private static var instance:AreaDAO;

        //日志
        private var log:ILogger = Log.getLogger("com.linkage.module.cms.gsscenecfg.dao.AreaDAO");

        public static var context:String;
        private var endpoint:String = "messagebroker/amf";
        private var remoteDestination:String = "flexdestination_cms_gsscenecfg_areaconf_dataService";
        private var remoteSource:String = "com.linkage.module.cms.gsscenecfg.areaconf.serv.AreaconfServImpl";

        public static function getInstance():AreaDAO
        {
            if (instance == null)
                instance = new AreaDAO;

            return instance;
        }


        public function getSceneType(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("areadao-getSceneType-调用java接口查询[场景类型]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("areadao-getSceneType-调用java接口查询[场景类型]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("areadao-getSceneType-调用java接口查询[场景类型]列表异常。" + event.fault.faultString);

                    if (error != null)
                        error.call(null, event);
                });

            log.info("areadao-getSceneType-开始调用java接口查询[场景类型]列表。[" + context + "]");
            remote.getSceneType({});
            remote = null;
        }


        public function getAreaInfo(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("areadao-getAreaInfo-调用java接口查询[区域]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("areadao-getAreaInfo-调用java接口查询[区域]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("areadao-getAreaInfo-调用java接口查询[区域]列表异常。" + event.fault.faultString);

                    if (error != null)
                        error.call(null, event);
                });

            log.info("areadao-getAreaInfo-开始调用java接口查询[区域]列表。[" + context + "]");
            remote.getAreaInfo({});
            remote = null;
        }

        public function getCityInfo(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("areadao-getCityInfo-调用java接口查询[地市]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("areadao-getCityInfo-调用java接口查询[地市]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("areadao-getCityInfo-调用java接口查询[地市]列表异常。" + event.fault.faultString);

                    if (error != null)
                        error.call(null, event);
                });

            log.info("areadao-getCityInfo-开始调用java接口查询[地市]列表。[" + context + "]");
            remote.getCityInfo({});
            remote = null;
        }

        public function getMotypeInfo(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("areadao-getMotypeInfo-调用java接口查询[网元类型]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("areadao-getMotypeInfo-调用java接口查询[网元类型]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("areadao-getMotypeInfo-调用java接口查询[网元类型]列表异常。" + event.fault.faultString);

                    if (error != null)
                        error.call(null, event);
                });

            log.info("areadao-getMotypeInfo-开始调用java接口查询[网元类型]列表。[" + context + "]");
            remote.getMotypeInfo({});
            remote = null;
        }

        public function getMarqueeNeList(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("areadao-getMarqueeNeList-调用java接口查询[框选网元]列表成功返回。");
                    log.debug(result.xmlStr);

                    if (result != null)
                        success.call(null, result);
                    else
                        log.error("areadao-getMarqueeNeList-调用java接口查询[框选网元]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("areadao-getMarqueeNeList-调用java接口查询[框选网元]列表异常。" + event.fault.faultString);

                    if (error != null)
                        error.call(null, event);
                });

            log.info("areadao-getMarqueeNeList-开始调用java接口查询[框选网元]列表。[" + context + "]");
            remote.getMarqueeNeList(param);
            remote = null;
        }

        public function getTempImportNeList(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("areadao-getTempImportNeList-调用java接口查询[导入资源]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("areadao-getTempImportNeList-调用java接口查询[导入资源]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("areadao-getTempImportNeList-调用java接口查询[导入资源]列表异常。" + event.fault.faultString);

                    if (error != null)
                        error.call(null, event);
                });

            log.info("areadao-getTempImportNeList-开始调用java接口查询[导入资源]列表。[" + context + "]");
            log.debug(param);

            remote.getTempImportNeList(param);
            remote = null;
        }

        public function getMoInfo(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("areadao-getMoInfo-调用java接口查询[网元]列表成功返回。");
                    log.debug(result);

                    if (result == null)
                        log.error("areadao-getMoInfo-调用java接口查询[网元]列表成功返回,但是结果集为空");

                    success.call(null, result);
                },
                function(event:FaultEvent):void
                {
                    log.error("areadao-getMoInfo-调用java接口查询[网元]列表异常。" + event.fault.faultString);

                    if (error != null)
                        error.call(null, event);
                });

            log.info("areadao-getMoInfo-开始调用java接口查询[网元]列表。[" + context + "]");
            log.debug(param);

            remote.getMoInfo(param);
            remote = null;
        }

        public function insertAreaInfo(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("areadao-insertAreaInfo-调用java接口保存[区域配置]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("areadao-insertAreaInfo-调用java接口保存[区域配置]成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("areadao-insertAreaInfo-调用java接口保存[区域配置]异常。" + event.fault.faultString);

                    if (error != null)
                        error.call(null, event);
                });

            log.info("areadao-insertAreaInfo-开始调用java接口保存[区域配置]。[" + context + "]");
            log.debug(param);

            remote.insertAreaInfo(param);
            remote = null;
        }
		public function updateAreaInfo(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(
				remoteDestination, remoteSource, context + endpoint,
				function(result:Object):void
				{
					log.info("areadao-updateAreaInfo-调用java接口保存[区域配置]成功返回。");
					log.debug(result);
					
					if (result != null && result.length > 0)
						success.call(null, result);
					else
						log.error("areadao-updateAreaInfo-调用java接口保存[区域配置]成功返回,但是结果集为空");
				},
				function(event:FaultEvent):void
				{
					log.error("areadao-updateAreaInfo-调用java接口保存[区域配置]异常。" + event.fault.faultString);
					
					if (error != null)
						error.call(null, event);
				});
			
			log.info("areadao-updateAreaInfo-开始调用java接口保存[区域配置]。[" + context + "]");
			log.debug(param);
			
			remote.updateAreaInfo(param);
			remote = null;
		}
        public function deleteArea(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("areadao-deleteArea-调用java接口删除[区域配置]成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("areadao-deleteArea-调用java接口删除[区域配置]成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("areadao-deleteArea-调用java接口删除[区域配置]异常。" + event.fault.faultString);

                    if (error != null)
                        error.call(null, event);
                });

            log.info("areadao-deleteArea-开始调用java接口删除[区域配置]。[" + context + "]");
            log.debug(param);

            remote.deleteAreaInfo(param);
            remote = null;
        }

    }
}
