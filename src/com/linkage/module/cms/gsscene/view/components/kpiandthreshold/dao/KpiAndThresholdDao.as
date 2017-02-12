package com.linkage.module.cms.gsscene.view.components.kpiandthreshold.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class KpiAndThresholdDao implements IKpiAndThresholdDao
	{
		private var _destination:String;
		private var _endpoint:String;

		private var log:ILogger=Log.getLoggerByClass(KpiAndThresholdDao);

		[Inject("user")]
		public var user:IUser;

		private var rmtObj:RemoteObject;

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
		
		public function queryThresholdByCon(p:Object):AsyncToken
		{
			log.info("Kpi And Threshold call remote method!");
			init(p);
			log.debug("queryThresholdByCon 参数");
			log.info(p);
			return rmtObj.queryThresholdByCon(p);
		}

		public function set destination(value:String):void
		{
			_destination=value;
		}

		public function set endpoint(value:String):void
		{
			_endpoint=value;
		}

	}
}
