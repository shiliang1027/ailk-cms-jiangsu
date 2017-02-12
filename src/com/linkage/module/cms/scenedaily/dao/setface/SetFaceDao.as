package com.linkage.module.cms.scenedaily.dao.setface
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-3
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SetFaceDao implements ISetFaceDao
	{
		private var log:ILogger = Log.getLoggerByClass(SetFaceDao);
		public var _destination:String;
		public var _endpoint:String;

		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		[Init]
		public function init():void
		{
			rmtObj = new RemoteObject(_destination);
			rmtObj.endpoint = _endpoint;
		}

		public function saveBaseSetData(param:Object):AsyncToken
		{
			return rmtObj.saveBaseSetData(param);
		}

		public function loadBaseSetData():AsyncToken
		{
			return rmtObj.loadBaseSetData();
		}

		public function loadHealthSetData():AsyncToken
		{
			return rmtObj.loadHealthSetData();
		}

		public function saveHealthSetData(param:Object):AsyncToken
		{
			return rmtObj.saveHealthSetData(param);
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