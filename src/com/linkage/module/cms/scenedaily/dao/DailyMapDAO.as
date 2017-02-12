package com.linkage.module.cms.scenedaily.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DailyMapDAO implements IDailyMapDAO
	{
		private var log:ILogger = Log.getLoggerByClass(DailyMapDAO);

		private var _destination:String;
		private var _endpoint:String;
		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		[Init]
		public function init():void
		{
			log.debug("[DailyMapDAO]:开始初始化...");
			rmtObj = new RemoteObject(this._destination);
			rmtObj.endpoint = this._endpoint;
			log.debug("[DailyMapDAO]:初始化成功");
		}

		/**
		 * 获取地图giskpi
		 */
		public function getGisKpi(param:Object):AsyncToken
		{
			log.info("[地图参数]调用接口getGisKpi获取gis指标参数如下");
			log.info(param);
			if (param.timeGranular == "0")
			{
				return rmtObj.getGisKpiMinu(param);
			}
			else
			{
				return rmtObj.getGisKpi(param);
			}
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