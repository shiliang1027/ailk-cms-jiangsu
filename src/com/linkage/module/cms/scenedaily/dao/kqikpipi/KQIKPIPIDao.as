package com.linkage.module.cms.scenedaily.dao.kqikpipi
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class KQIKPIPIDao implements IKQIKPIPIDao
	{
		private var _destination:String;
		private var _endpoint:String;

		private var log:ILogger = Log.getLoggerByClass(KQIKPIPIDao);

		[Inject("user")]
		public var user:IUser;

		private var rmtObj:RemoteObject;

		[Init]
		public function init():void
		{
			log.info("KQIKPIPIDao init!");
			rmtObj = new RemoteObject(_destination);
			rmtObj.endpoint = _endpoint;
		}

		public function getKqiKpiPiRelation(kpiId:String):AsyncToken
		{
			var param:Object = {"kpiId": kpiId, "moTypeId": user.moTypeId, "interval": user.interval, "time": user.gatherTime, "resId": user.resId, "resType": user.resType, "type": user.isHealthOrThreshold, "cityId": user.cityId};
			log.info("KQIKPIPIDao 加载指标关联关系!");
			log.debug(param);
			return rmtObj.getKpiRelation(param);
		}

		public function getKpiMoList(kpiId:String, moTypeId:String):AsyncToken
		{
			var param:Object = {"kpiId": kpiId, "moTypeId": moTypeId, "interval": user.interval, "time": user.gatherTime, "resId": user.resId, "resType": user.resType, "type": user.isHealthOrThreshold, "cityId": user.cityId};
			log.info("KQIKPIPIDao 加载指标网元列表!");
			log.debug(param);
			return rmtObj.getKpiMoList(param);
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

