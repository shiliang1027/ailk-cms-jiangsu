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

	public class DeleteWindowCMD
	{
		public function DeleteWindowCMD()
		{
		}
		
		private var log:ILogger=Log.getLoggerByClass(DeleteWindowCMD);
		
		[Inject("eventWindowDao")]
		public var dao:EventWindowDAO;
		
		[Inject("eventWindowDM")]
		public var dm:EventWindowDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var type:String = "";
		private var now:Number=0;
		
		public function execute(event:Event):AsyncToken
		{
			log.debug("[删除事件:...~]"+dm.parameters.id);
			log.debug(dm.parameters);
			return dao.deleteEvent(dm.parameters);
		}
		public function result(result:Object):void
		{
			log.info(result);
			//-1 异常, 0 失败,1 成功
			switch(result)
			{
				case -1:
				{
					Alert.show("删除事件异常！");
					break;
				}
				case 0:
				{	
					Alert.show("删除事件失败！");
				}
				case 1:
				{
					Alert.show("删除事件成功！");
					dispatchMsg(new Event("LOAD_EVENTWINDOW_DATA"));
				}
			}
			
		}
		
		public function error(f:Fault):void
		{
			log.error("删除事件数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}