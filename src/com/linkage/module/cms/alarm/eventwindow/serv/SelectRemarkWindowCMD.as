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

	public class SelectRemarkWindowCMD
	{
		public function SelectRemarkWindowCMD()
		{
		}
		
		private var log:ILogger=Log.getLoggerByClass(SelectRemarkWindowCMD);
		
		[Inject("eventWindowDao")]
		public var dao:EventWindowDAO;
		
		[Inject("eventWindowDM")]
		public var dm:EventWindowDM;
		
		
		public function execute(event:Event):AsyncToken
		{
			log.debug("[开始查询事件备注:...~]"+dm.parameters.id);
			log.debug(dm.parameters);
			return dao.selectRemarkById(dm.parameters);
		}
		public function result(result:Object):void
		{
			log.info(result["remark"]);
			
			dm.remark = result["remark"];

		}
		
		public function error(f:Fault):void
		{
			log.error("编辑事件数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}