package com.linkage.module.cms.scenedaily.dao.mainchart
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class ChartDao implements IChartDao
	{
		private var _destination:String;
		private var _endpoint:String;

		private var log:ILogger = Log.getLoggerByClass(ChartDao);

		[Inject("user")]
		public var user:IUser;

		private var rmtObj:RemoteObject; //RemoteObject 类使您可以访问远程应用程序服务器上的类。

		[Init]
		public function init():void
		{
			rmtObj = new RemoteObject(_destination);
			rmtObj.endpoint = _endpoint;
		}

		public function loadTopNData(param:Object):AsyncToken
		{
			log.info("劣化排名、下一级钻取（地市和网元）！");
			return rmtObj.getTopNKpiCompare(param);
		}

		public function loadTrendData(param:Object):AsyncToken
		{
			log.info("指标趋势方法，历史趋势图！");
			return rmtObj.getTopNKpiTrend(param);
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

