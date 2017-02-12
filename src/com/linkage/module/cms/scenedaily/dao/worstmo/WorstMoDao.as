package com.linkage.module.cms.scenedaily.dao.worstmo
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WorstMoDao implements IWorstMoDao
	{
		private var log:ILogger = Log.getLoggerByClass(WorstMoDao);
		private var _destination:String;
		private var _endpoint:String;
		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		[Init]
		public function init():void
		{
			rmtObj = new RemoteObject(this._destination);
			rmtObj.endpoint = this._endpoint;
		}

		/**
		 *根据网元类别查询最差网元信息
		 */
		public function getWorstType(worstType:String):AsyncToken
		{
			var param:Object = new Object;
			param.worstType = worstType;
			param.user = user;
			return rmtObj.getWorstType(param);
		}

		/**
		 *保存最差网元信息
		 */
		public function saveWorstMoSetList(worstInfo:Object):AsyncToken
		{
			var param:Object = new Object;
			param.worstInfo = worstInfo;
			param.user = user;
			return rmtObj.saveWorstMoSetList(param);
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