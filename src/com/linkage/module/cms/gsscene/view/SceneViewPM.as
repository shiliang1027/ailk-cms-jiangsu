package com.linkage.module.cms.gsscene.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	public class SceneViewPM
	{
		private var log:ILogger = Log.getLoggerByClass(SceneViewPM);
		
		[MessageDispatcher]
		public var msgDispatcher:Function;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		
		[Bindable]
		public var refreshTime:Number = 5*60 * 60;
		[Bindable]
		public var refreshCount:Number=refreshTime;
		private var refreshCountTimer:Timer = new Timer(1000);

		public function SceneViewPM(){
			refreshCountTimer.addEventListener(TimerEvent.TIMER,function(event:TimerEvent):void{
				refreshCount--;
				if(refreshCount==0){
					msgDispatcher(new SceneEvent("REFRESH"));
				}
			});
			refreshCountTimer.start();
		}
		
		[MessageHandler(selector="STOPTIMER")]
		public function stoptimer(e:SceneEvent):void
		{
			log.info("停止刷新！");
			if(refreshCountTimer.running){
				refreshCountTimer.stop();
			}
		}
		[MessageHandler(selector="STARTTIMER")]
		public function starttimer(e:SceneEvent):void
		{
			log.info("启动刷新！");
			refreshCount=refreshTime;
			if(!refreshCountTimer.running){
				refreshCountTimer.start();
			}
		}
		
		[MessageHandler(selector="CHANGE_REFRESHTIME")]
		public function change_refreshtime(evt:SceneEvent=null):void
		{
			log.info("change改变时间事件！");
			if(null!=evt){
				log.info(evt.param);
				refreshTime = Number(evt.param.refreshTime) * 60;
				refreshCount=refreshTime;
			}
		}
		
		public function initViewPanel():void
		{
			log.info("派发加载场景配置面板信息事件！");
			requestServerUtil.addRequest(new SceneEvent(SceneEvent.LOAD_SCENE_CFG));
		}
		
		[MessageHandler(selector="REFRESH")]
		public function refreshDatas(e:SceneEvent):void
		{
			refreshCount=refreshTime;
//			if(!refreshCountTimer.running){
//				refreshCountTimer.start();
//			}
			msgDispatcher(new Event("REQUEST_CLEAR"));
			log.info("刷新面板数据！");
			var refreshEvt:SceneEvent = new SceneEvent(SceneEvent.COMPONENT_REFRESH_DATA);
			refreshEvt.param = new Object();
			refreshEvt.param = "COMPONENT_REFRESH_DATA";
			msgDispatcher(refreshEvt);
		}
	}
}