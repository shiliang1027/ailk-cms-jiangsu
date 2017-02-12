package com.linkage.module.cms.scene.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.domain.KPISituationDM;
	import com.linkage.module.cms.scene.domain.SceneConfigDM;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class SceneViewPM
	{
		private var log:ILogger = Log.getLoggerByClass(SceneViewPM);
		[Inject("sceneConfigDM")]
		public var sceneConfigDM:SceneConfigDM;
		[Inject("kPISituationDM")]
		public var kpiSituationDM:KPISituationDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		
		[Bindable]
		public var refreshTime:Number = 2 * 60;
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
		}
		
		[MessageHandler(selector="REFRESH_STOP")]
		public function refreshStop(e:SceneEvent):void
		{
			refreshCount=refreshTime;
			if(refreshCountTimer.running){
				refreshCountTimer.stop();
			}
		}
		[MessageHandler(selector="REFRESH_START")]
		public function refreshStart(e:SceneEvent):void
		{
			refreshCount=refreshTime;
			if(!refreshCountTimer.running){
				refreshCountTimer.start();
			}
		}
		
		[MessageHandler(selector="REFRESH")]
		public function refresh(e:SceneEvent):void
		{
			refreshCount=refreshTime;
//			if(!refreshCountTimer.running){
//				refreshCountTimer.start();
//			}
			msgDispatcher(new Event("REQUEST_CLEAR"));
			msgDispatcher(new SceneEvent(SceneEvent.COMPONENT_REFRESH_DATA));
		}
		
		public function initViewPanel():void
		{
			log.info("派发加载场景配置面板信息事件！");
//			msgDispatcher(new SceneEvent(SceneEvent.LOAD_SCENE_CFG));
			requestServerUtil.addRequest(new SceneEvent(SceneEvent.LOAD_SCENE_CFG));
		}
	}
}