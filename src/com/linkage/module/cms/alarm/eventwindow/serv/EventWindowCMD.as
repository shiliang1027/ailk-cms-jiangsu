package com.linkage.module.cms.alarm.eventwindow.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.alarm.eventwindow.dao.EventWindowDAO;
	import com.linkage.module.cms.alarm.eventwindow.domain.EventWindowDM;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class EventWindowCMD
	{
		public function EventWindowCMD()
		{
		}
		
		private var log:ILogger=Log.getLoggerByClass(EventWindowCMD);
		
		[Inject("eventWindowDao")]
		public var dao:EventWindowDAO;
		
		[Inject("eventWindowDM")]
		[Bindable]
		public var dm:EventWindowDM;
		
		
		public function execute(event:Event):AsyncToken
		{
			log.debug("[开始查询事件数据:...~]");
			log.debug(dm.parameters);
			return dao.queryEventData(dm.parameters);
		}
		public function result(result:Object):void
		{
			log.info(result);
			dm.datas.removeAll();
			dm.datas.addAll(result as IList);
//			dm.datas.refresh();
		}
		
		public function error(f:Fault):void
		{
			log.error("查询事件数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}