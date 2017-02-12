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
	

	public class UpdateRemarkWindowCMD
	{
		public function UpdateRemarkWindowCMD()
		{
		}
		
		private var log:ILogger=Log.getLoggerByClass(UpdateRemarkWindowCMD);
		
		[Inject("eventWindowDao")]
		public var dao:EventWindowDAO;
		
		[Inject("eventWindowDM")]
		public var dm:EventWindowDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function execute(event:Event):AsyncToken
		{
			log.debug("[开始更新事件备注:...~]"+dm.parameters.id);
			log.debug(dm.parameters);
			return dao.updateRemarkById(dm.parameters);
		}
		public function result(result:Object):void
		{
			log.info(result);
			//-1 异常, 0 失败,1 成功
			switch(result)
			{
				case -1:
				{
					Alert.show("设置事件备注异常！");
					break;
				}
				case 0:
				{	
					Alert.show("设置事件备注失败！");
				}
				case 1:
				{
					Alert.show("设置事件备注成功！");
					dispatchMsg(new Event("CLOSE_EVENTWINDOW"));
					dispatchMsg(new Event("LOAD_EVENTWINDOW_DATA"));
				}
			}

		}
		
		public function error(f:Fault):void
		{
			log.error("设置事件备注数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}