package com.linkage.module.cms.scenedaily.dao.functionchain
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class FunctionChainDao implements IFunctionChainDao
	{
		private var _destination:String;
		private var _endpoint:String;

		private var log:ILogger = Log.getLoggerByClass(FunctionChainDao);

		[Inject("user")]
		public var user:IUser;

		private var rmtObj:RemoteObject; //RemoteObject 类使您可以访问远程应用程序服务器上的类。

		[Init]
		public function init():void
		{
			rmtObj = new RemoteObject(_destination);
			rmtObj.endpoint = _endpoint;
		}

		public function loadData(param:Object):AsyncToken
		{
			log.info("功能链接方法！" + FunctionChainDao);
			log.info(param);
			return rmtObj.getFunctionChain(param); //这个方法有待于需求
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