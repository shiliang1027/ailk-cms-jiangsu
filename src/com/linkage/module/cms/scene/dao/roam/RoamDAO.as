package com.linkage.module.cms.scene.dao.roam
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class RoamDAO implements IRoamDAO
	{
		private var log:ILogger = Log.getLoggerByClass(RoamDAO);
		private var _destination:String;
		private var _endpoint:String;

		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		private function init():void
		{
			if(rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
			}
		}

		public function loadLegendData(param:Object):AsyncToken
		{
			init();
			return rmtObj.loadLegendDataByCity(user, param);
		}

		public function getSceneRoamList(param:Object):AsyncToken
		{
			init();
			return rmtObj.getSceneRoamList(user, param);
		}

		public function getSceneTrains(param:Object):AsyncToken
		{
			init();
			return rmtObj.getSceneTrains(user, param);
		}

		public function saveLegendData(param:Object):AsyncToken
		{
			init();
			return rmtObj.saveLegendData(user, param);
		}

		public function set destination(value:String):void
		{
			_destination = value;
		}

		public function set endpoint(value:String):void
		{
			_endpoint = value;
		}
	}
}

