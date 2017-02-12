package com.linkage.module.cms.gsscene.view.components.worstcellpanel.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.worstcellpanel.WorstCellPanelDM;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    public class WorstCellPanelDao implements IWorstCellPanelDao
    {
        private var log:ILogger = Log.getLoggerByClass(WorstCellPanelDao);

        private var _destination:String;
        private var _endpoint:String;

        private var rmtObj:RemoteObject;

        [Inject("user")]
        public var user:IUser;
		
		[Inject("worstCellPanelDM")]
		public var dm:WorstCellPanelDM;
		
		public function init(param:Object=null):void
		{
			if (rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
				rmtObj.showBusyCursor = false;
			}
			if(param!=null){
				user.getImportParamsForRemoteObject(param);
			}
		}

        public function getWorstCellData(param:Object):AsyncToken
        {
            log.info("调用远程方法 加载小区信息!");
            init(param);
            return rmtObj.getWorstCellData(param);
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