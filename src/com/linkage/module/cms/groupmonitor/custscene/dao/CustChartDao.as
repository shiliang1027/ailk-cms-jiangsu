package com.linkage.module.cms.groupmonitor.custscene.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.domain.common.IUser;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class CustChartDao implements ICustChartDao
	{
		private var _destination:String;
		private var _endpoint:String;
		
		private var log:ILogger=Log.getLoggerByClass(CustChartDao);
		
		private var rmtObj:RemoteObject;
		
		[Inject]
		public var user:IUser;
		
		[Init]
		public function init():void
		{
			rmtObj=new RemoteObject(_destination);
			rmtObj.endpoint=_endpoint;
		}
		
		
		
		public function querySpecLineFault(param:Object):AsyncToken
		{
			return rmtObj.querySpecLineFault(param);
		}
		
		public function querySpecLineComplaint(param:Object):AsyncToken
		{
			return rmtObj.querySpecLineComplaint(param);
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