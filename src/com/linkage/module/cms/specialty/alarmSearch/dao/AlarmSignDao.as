package com.linkage.module.cms.specialty.alarmSearch.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2013-2-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class AlarmSignDao implements IAlarmSignDao
	{
		private var _destination:String;
		private var _endpoint:String;

		private var log:ILogger = Log.getLoggerByClass(AlarmSignDao);


		private var rmtObj:RemoteObject;

		[Init]
		public function init():void
		{
			rmtObj = new RemoteObject(_destination);
			rmtObj.endpoint = _endpoint;
		}

		public function queryAlarmSignList(param:Object):AsyncToken
		{
			log.debug("传入参数：");
			log.debug(param);
			return rmtObj.queryAlarmList(param);
		}

		public function remove(param:Object):AsyncToken
		{
			log.debug("传入参数：");
			log.debug(param);
			return rmtObj.remove(param);
		}

		public function clearAlarm(param:Object):AsyncToken
		{
			log.debug("传入参数：");
			log.debug(param);
			return rmtObj.deleteAlarmList(param);
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