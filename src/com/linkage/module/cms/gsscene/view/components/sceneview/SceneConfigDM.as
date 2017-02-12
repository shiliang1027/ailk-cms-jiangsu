package com.linkage.module.cms.gsscene.view.components.sceneview
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	
	import flash.utils.setTimeout;
	
	import mx.collections.ArrayCollection;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	public class SceneConfigDM
	{
		
		private var log:ILogger = Log.getLoggerByClass(SceneConfigDM);
		[MessageDispatcher]
		public var dispatchMsg:Function;
		//配置的面板信息 
		private var _panelList:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var leftPanelList:ArrayCollection=new ArrayCollection();
		[Bindable]
		public var rightPanelList:ArrayCollection=new ArrayCollection();

		//面板的id和组件的对象 映射
		private var _panelIdUIMap:Object;
		private var compsIndex:int=0;
		public var compsMax:int=0;
		public function SceneConfigDM(){
			_panelList.addEventListener(CollectionEvent.COLLECTION_CHANGE,onCollectionChange);
		}
		private function onCollectionChange(event:CollectionEvent):void{
			
			log.info("[onCollectionChange]{0}",event.kind);
			log.info(event.items);
			switch (event.kind)
			{
				case CollectionEventKind.ADD:
					if(event.items[0].isShow=="1"){
						switch(event.items[0].location){
							case "1":
								leftPanelList.addItem(event.items[0]);
								break;
							case "2":
								rightPanelList.addItem(event.items[0]);
								break;
						}
					}
					compsIndex++;
					log.info("compsIndex:{0}",compsIndex);
					if(compsIndex==compsMax){
						compsIndex=0;
						setTimeout(function():void{
							dispatchMsg(new SceneEvent("SCENENEW_REFRESH"));
						},3000);
					}
					break;
				case CollectionEventKind.REMOVE:
					break;
				case CollectionEventKind.REFRESH:
				case CollectionEventKind.RESET:
					leftPanelList.removeAll();
					rightPanelList.removeAll();
					break;
			}
		}
		[Bindable]
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