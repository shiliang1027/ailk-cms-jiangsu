package com.linkage.module.cms.gsscene.view.components.complaintsheet.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    public class ComplaintSheetStatDao implements IComplaintSheetStatDao
    {
        private var log:ILogger = Log.getLoggerByClass(ComplaintSheetStatDao);

        private var _destination:String;
        private var _endpoint:String;

        private var rmtObj:RemoteObject;

        [Inject("user")]
        public var user:IUser;

		public function init(param:Object = null):void
		{
			if (rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
				rmtObj.showBusyCursor = false;
			}
			if (param != null)
			{
				user.getImportParamsForRemoteObject(param);
			}
		}
		
        public function loadComplaintSheetData():AsyncToken
        {
            log.info("调用远程方法 加载投诉工单信息!");

            log.info(user);
            init();
            return rmtObj.querySceneComplaintSheetWithCity(user);
        }

        public function loadComplaintSheetAlarmsData(param:Object):AsyncToken
        {
            init(param);
			log.info("调用远程方法 加载投诉工单告警信息!");
			log.info(param);
            return rmtObj.queryComplaintSheetStatInfoDetail(param);
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
