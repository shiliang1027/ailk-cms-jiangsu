package com.linkage.module.cms.scene.dao.sportsvenuesview
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class SportsVenuesDAO implements ISportsVenuesDAO
	{
		private var log:ILogger=Log.getLoggerByClass(SportsVenuesDAO);
		private var _destination:String;
		private var _endpoint:String;

		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		public function init():void
		{
			if(rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
			}
		}

		public function loadDataList():AsyncToken
		{
			init();
			return rmtObj.getSceneGymInfo(user);
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

