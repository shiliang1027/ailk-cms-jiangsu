package com.linkage.module.cms.scene.domain
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import mx.collections.ArrayCollection;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	public class SceneConfigDM
	{
		private var log:ILogger = Log.getLoggerByClass(SceneConfigDM);
		//配置的面板信息 
		private var _panelList:ArrayCollection = new ArrayCollection();

		//面板的id和组件的对象 映射
		private var _panelIdUIMap:Object;
		
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function SceneConfigDM()
		{
//			_panelList.addEventListener(CollectionEvent.COLLECTION_CHANGE,onCollectionChange);
		}
		
//		private function onCollectionChange(event:CollectionEvent):void{
//			log.info("配置面板变化:{0},item:{1}",event.kind,event.items[0]);
//			var e:SceneEvent;
//			switch (event.kind)
//			{
//				case CollectionEventKind.ADD:
//					e = new SceneEvent(SceneEvent.PANEL_ADD);
//					event.items[0]
//					e.param = event.items[0];
//					msgDispatcher(e);
//					break;
//				case CollectionEventKind.REMOVE:
//					e = new SceneEvent(SceneEvent.PANEL_REMOVE);
//					e.param = event.location;
//					msgDispatcher(e);
//					break;
//				case CollectionEventKind.REFRESH:
//					break;
//				case CollectionEventKind.RESET:
//					break;
//			}
//		}

		public function get panelList():ArrayCollection
		{
			return _panelList;
		}

		public function set panelList(value:ArrayCollection):void
		{
			_panelList = value;
		}

		public function get panelIdUIMap():Object
		{
			return _panelIdUIMap;
		}

		public function set panelIdUIMap(value:Object):void
		{
			_panelIdUIMap = value;
		}


	}
}