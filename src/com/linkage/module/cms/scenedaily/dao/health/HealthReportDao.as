package com.linkage.module.cms.scenedaily.dao.health
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
	 * @date 2012-8-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HealthReportDao implements IHealthReportDao
	{
		private var log:ILogger = Log.getLoggerByClass(HealthReportDao);
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

		public function getHealthReport(param:Object):AsyncToken
		{
			param.type = "1";
			param.resType = user.resType;
			param.isLeaderPef = user.viewType;
			log.info("getHealthReport  参数");
			log.info(param);
			return rmtObj.getHealthReport(param);
		}

		public function getCaseCard(param:Object):AsyncToken
		{
			param.type = "1";
			if (param.flag && param.flag == "1")
			{
				param.resType = "1";
			}
			else
			{
				param.resType = "3";
				param.stateTime=user.gatherTime;
				param.timeGranular=user.interval;
			}

			param.cityId = user.cityId;
			param.perfTypeId = user.kpiId;
			param.moTypeId = user.moTypeId;
//			if (!param.stateTime)
//				param.stateTime=user.gatherTime;
//
//			if (!param.timeGranular)
//				param.timeGranular=user.interval;
//
//			if (!param.resId)
//				param.resId=user.resId;

			log.info("getCaseCard  参数");
			log.info(param);
			return rmtObj.getCaseCard(param);
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

