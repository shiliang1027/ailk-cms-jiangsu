package com.linkage.module.cms.gsscene.view.components.sceneview.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    public class SceneViewDao implements ISceneViewDao
    {
        private var log:ILogger = Log.getLoggerByClass(SceneViewDao);

        private var _destination:String;
        private var _endpoint:String;
		private var _newdestination:String;
		
        private var rmtObj:RemoteObject;

        [Inject("user")]
        public var user:IUser;

		private var useNewInit:Boolean = true;
		
        public function init():void
        {
            if (rmtObj == null||useNewInit)
            {
                rmtObj = new RemoteObject(_destination);
                rmtObj.endpoint = _endpoint;
                rmtObj.showBusyCursor = false;
				useNewInit = false;
            }
        }
		
		public function initNew():void
		{
			if (rmtObj == null||!useNewInit)
			{
				rmtObj = new RemoteObject(_newdestination);
				rmtObj.endpoint = _endpoint;
				rmtObj.showBusyCursor = false;
				useNewInit = true;
			}
		}
		
        public function getSceneCfgData():AsyncToken
        {
            log.info("调用远程方法 加载面板配置信息initNew()!");
			initNew();
            return rmtObj.getSceneCfg(user);
        }

        public function getSceneImg():AsyncToken
        {
            log.info("调用远程方法 加载区域缩略图信息!");
            init();
            return rmtObj.getSceneImg(user);
        }

        public function getSceneImgBySceneId(param:Object):AsyncToken
        {
            log.info("调用远程方法 加载场景下所有区域缩略图信息!");
            init();
            return rmtObj.getSceneImg(param);
        }

        public function queryAreaCount():AsyncToken
        {
            log.info("@@@调用远程方法 加载场景用户数信息!");
            init();
            return rmtObj.queryAreaCount({sceneId: user.initSceneId});
        }

        public function savePanelsAccountCfg(param:Object):AsyncToken
        {
            log.info("调用远程方法 保存用户配置的面板!");
            init();
            return rmtObj.savePanelsCfg(param);
        }

        public function get destination():String
        {
            return _destination;
        }

        public function set destination(value:String):void
        {
            _destination = value;
        }
		
		public function get newdestination():String
		{
			return _newdestination;
		}
		
		public function set newdestination(value:String):void
		{
			_newdestination = value;
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

