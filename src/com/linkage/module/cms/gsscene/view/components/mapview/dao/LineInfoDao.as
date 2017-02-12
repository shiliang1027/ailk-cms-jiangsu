package com.linkage.module.cms.gsscene.view.components.mapview.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;


	/*
	 *说明：
	 *作者：panyin
	 *时间：2012-11-28上午10:25:09
	 **/

	public class LineInfoDao implements ILineInfoDao
	{
		private var log:ILogger = Log.getLoggerByClass(LineInfoDao);

		private var _destination:String;
		private var _endpoint:String;

		private var rmtObj:RemoteObject;

		[Init]
		public function initDao():void
		{
			rmtObj = new RemoteObject(_destination);
			rmtObj.endpoint = _endpoint;
			rmtObj.showBusyCursor= false;
		}      

		public function loadLineInfo(moId:String):AsyncToken
		{
			log.info("加载管线信息：" +　moId);
            
			return rmtObj.getTransferInfo({'mo_id':moId});
		}

		public function loadOpticInfo(circName:String):AsyncToken
		{
			log.info("加载光路信息：" +　circName);
            
			return rmtObj.getOpticAlarmInfo(circName);
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

