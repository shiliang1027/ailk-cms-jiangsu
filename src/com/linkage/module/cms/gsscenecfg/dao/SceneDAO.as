package com.linkage.module.cms.gsscenecfg.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.system.rpc.remoting.BlazeDSUtil;
    import com.ailk.common.ui.components.loadmanager.LoadManager;

    import mx.rpc.events.FaultEvent;
    import mx.rpc.remoting.RemoteObject;

    public class SceneDAO
    {
        private static var instance:SceneDAO;

        //日志
        private var log:ILogger = Log.getLogger("com.linkage.module.cms.gsscenecfg.dao.SceneDAO");

        public static var context:String;
        private var endpoint:String = "messagebroker/amf";
        private var remoteDestination:String = "flexdestination_cms_gsscenecfg_sceneconf_dataService";
        private var remoteSource:String = "com.linkage.module.cms.gsscenecfg.sceneconf.serv.SceneconfServImpl";

        public static function getInstance():SceneDAO
        {
            if (instance == null)
                instance = new SceneDAO;

            return instance;
        }


        public function getSceneType(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getSceneType-调用java接口查询[场景类型]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-getSceneType-调用java接口查询[场景类型]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getSceneType-调用java接口查询[场景类型]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getSceneType-开始调用java接口查询[场景类型]列表。[" + context + "]");
            remote.getSceneType({});
            remote = null;
        }

        public function getSceneGeneralInfo(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getSceneGeneral-调用java接口查询[场景概要信息]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-getSceneGeneral-调用java接口查询[场景概要信息]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getSceneGeneral-调用java接口查询[场景概要信息]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getSceneGeneral-开始调用java接口查询[场景概要信息]列表。[" + context + "]");
            remote.getSceneGeneral({});
            remote = null;
        }

        public function getGsSceneType(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getGsSceneType-调用java接口查询[场景大类型]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-gegetGsSceneTypetGsLayer-调用java接口查询[场景大类型]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getGsSceneType-调用java接口查询[场景大类型]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getGsSceneType-开始调用java接口查询[场景大类型]列表。[" + context + "]");
            remote.getGsSceneType({});
            remote = null;
        }

        public function getGsSceneLogicalType(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getGsSceneLogicalType-调用java接口查询[场景小类型]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-getGsSceneLogicalType-调用java接口查询[场景小类型]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getGsSceneLogicalType-调用java接口查询[场景小类型]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getGsSceneLogicalType-开始调用java接口查询[场景小类型]列表。[" + context + "]");
            remote.getGsSceneLogicalType({});
            remote = null;
        }

        public function getGsLayer(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getGsLayer-调用java接口查询[图层]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-getGsLayer-调用java接口查询[图层]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getGsLayer-调用java接口查询[图层]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getGsLayer-开始调用java接口查询[图层]列表。[" + context + "]");
            remote.getGsLayer({});
            remote = null;
        }

        public function getCustomRule(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getCustomRule-调用java接口查询[过滤器]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-getCustomRule-调用java接口查询[过滤器]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getCustomRule-调用java接口查询[过滤器]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getCustomRule-开始调用java接口查询[过滤器]列表。[" + context + "]");
            remote.getCustomRule({});
            remote = null;
        }

        public function getScenePic(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getScenePic-调用java接口查询[场景图片]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-getScenePic-调用java接口查询[场景图片]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getScenePic-调用java接口查询[场景图片]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getScenePic-开始调用java接口查询[场景图片]列表。[" + context + "]");
            remote.getScenePic({});
            remote = null;
        }
		
		public function loadSceneKPIBySceneId(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(
				remoteDestination, remoteSource, context + endpoint,
				function(result:Object):void
				{
					log.info("scenedao-loadSceneKPIBySceneId-调用java接口查询[场景指标]列表成功返回。");
					log.debug(result);
					
					if (result != null && result.length > 0)
						success.call(null, result);
					else
						log.error("scenedao-loadSceneKPIBySceneId-调用java接口查询[场景指标]列表成功返回,但是结果集为空");
				},
				function(event:FaultEvent):void
				{
					log.error("scenedao-loadSceneKPIBySceneId-调用java接口查询[场景指标]列表异常。" + event.fault.faultString);
					
					if (error)
						error.call(null, event);
				});
			
			log.info("scenedao-loadSceneKPIBySceneId-开始调用java接口查询[场景指标]列表。[" + context + "]");
			log.debug(param);
			
			remote.loadSceneKPIBySceneId(param);
			remote = null;
		}
		
        public function getPerftypeByScenetyeid(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getPerftypeByScenetyeid-调用java接口查询[场景指标]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-getPerftypeByScenetyeid-调用java接口查询[场景指标]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getPerftypeByScenetyeid-调用java接口查询[场景指标]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getPerftypeByScenetyeid-开始调用java接口查询[场景指标]列表。[" + context + "]");
            log.debug(param);

            remote.getPerftypeByScenetyeid(param);
            remote = null;
        }

        public function getAllSpec(success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getAllSpec-调用java接口查询[专业]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-getAllSpec-调用java接口查询[专业]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getAllSpec-调用java接口查询[专业]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getAllSpec-开始调用java接口查询[专业]列表。[" + context + "]");

            remote.getAllSpec({});
            remote = null;
        }

        public function getSceneTypePanel(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-getSceneTypePanel-调用java接口查询[面板]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-getSceneTypePanel-调用java接口查询[面板]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-getSceneTypePanel-调用java接口查询[面板]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-getSceneTypePanel-开始调用java接口查询[面板]列表。[" + context + "]");
            log.debug(param);

            remote.getSceneTypePanel(param);
            remote = null;
        }

        public function insertSceneInfo(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-insertSceneInfo-调用java接口保存[场景配置]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-insertSceneInfo-调用java接口保存[场景配置]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-insertSceneInfo-调用java接口保存[场景配置]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-insertSceneInfo-开始调用java接口保存[场景配置]列表。[" + context + "]");
            log.debug(param);

            remote.insertSceneInfo(param);
            remote = null;
        }
		public function updateSceneInfo(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(
				remoteDestination, remoteSource, context + endpoint,
				function(result:Object):void
				{
					log.info("scenedao-updateSceneInfo-调用java接口保存[场景配置]列表成功返回。");
					log.debug(result);
					
					if (result != null && result.length > 0)
						success.call(null, result);
					else
						log.error("scenedao-updateSceneInfo-调用java接口保存[场景配置]列表成功返回,但是结果集为空");
				},
				function(event:FaultEvent):void
				{
					log.error("scenedao-updateSceneInfo-调用java接口保存[场景配置]列表异常。" + event.fault.faultString);
					
					if (error)
						error.call(null, event);
				});
			
			log.info("scenedao-updateSceneInfo-开始调用java接口保存[场景配置]列表。[" + context + "]");
			log.debug(param);
			
			remote.updateSceneInfo(param);
			remote = null;
		}
        public function deleteSceneInfo(param:Object, success:Function, error:Function = null):void
        {
            var remote:RemoteObject = BlazeDSUtil.newService(
                remoteDestination, remoteSource, context + endpoint,
                function(result:Object):void
                {
                    log.info("scenedao-deleteSceneInfo-调用java接口删除[场景配置]列表成功返回。");
                    log.debug(result);

                    if (result != null && result.length > 0)
                        success.call(null, result);
                    else
                        log.error("scenedao-deleteSceneInfo-调用java接口删除[场景配置]列表成功返回,但是结果集为空");
                },
                function(event:FaultEvent):void
                {
                    log.error("scenedao-deleteSceneInfo-调用java接口删除[场景配置]列表异常。" + event.fault.faultString);

                    if (error)
                        error.call(null, event);
                });

            log.info("scenedao-deleteSceneInfo-开始调用java接口删除[场景配置]列表。[" + context + "]");
            log.debug(param);

            remote.deleteSceneInfo(param);
            remote = null;
        }
    }
}
