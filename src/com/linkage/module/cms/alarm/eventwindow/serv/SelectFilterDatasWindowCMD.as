package com.linkage.module.cms.alarm.eventwindow.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.alarm.eventwindow.dao.EventWindowDAO;
	import com.linkage.module.cms.alarm.eventwindow.domain.EventWindowDM;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class SelectFilterDatasWindowCMD
	{
		public function SelectFilterDatasWindowCMD()
		{
		}
		
		private var log:ILogger=Log.getLoggerByClass(SelectFilterDatasWindowCMD);
		
		[Inject("eventWindowDao")]
		public var dao:EventWindowDAO;
		
		[Inject("eventWindowDM")]
		public var dm:EventWindowDM;
		
		
		public function execute(event:Event):AsyncToken
		{
			log.debug("[开始查询条件结果集:...~]");
			return dao.selectFilterDatas();
		}
		public function result(result:Object):void
		{
			log.info(result["citys"]);
			for each(var data:Object in result["citys"])
			{
				dm.cityProvider.addItem({'id': data.city, 'label': data.city});
			}
			for each(var data:Object in result["operators"])
			{
				dm.operatorProvider.addItem({'id': data.operatorName, 'label': data.operatorName});
			}
			for each(var data:Object in result["specs"])
			{
				dm.specProvider.addItem({'id': data.specName, 'label': data.specName});
			}

		}
		
		public function error(f:Fault):void
		{
			log.error("查询条件结果集错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}