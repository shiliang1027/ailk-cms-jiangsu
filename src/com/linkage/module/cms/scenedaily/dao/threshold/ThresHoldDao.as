package com.linkage.module.cms.scenedaily.dao.threshold
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
	 * @date 2012-9-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ThresHoldDao implements IThresHoldDao
	{
		private var log:ILogger = Log.getLoggerByClass(ThresHoldDao);
		private var _destination:String;
		private var _endpoint:String;

		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		[Init]
		public function init():void
		{
			rmtObj = new RemoteObject(_destination);
			rmtObj.endpoint = _endpoint;
		}

		public function getPerfGroup(param:Object):AsyncToken
		{
			return rmtObj.getPerfGroup(param);
		}

		public function getThreshold(param:Object):AsyncToken
		{
			return rmtObj.getThreshold(param);
		}

		public function selectCitys():AsyncToken
		{
			return rmtObj.selectCitys();
		}

		public function getMoTypeNames(param:Object):AsyncToken
		{
			return rmtObj.getMoTypeNames(param);
		}

		public function saveThreshold(param:Object):AsyncToken
		{
			param.user = user;
			return rmtObj.saveThreshold(param);
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