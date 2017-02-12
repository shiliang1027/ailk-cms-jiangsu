package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
	import com.linkage.module.cms.gsscene.view.components.mapview.demo.DemoDatas;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class MapGisCollectInfoGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(MapGisCollectInfoGetCmd);

		[Inject("scenePanelDao")]
		public var dao:IScenePanelDao;
		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;


		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("gis视图下基站退服数据获取！");
			return dao.queryBtsAndQuitBtsNum();
		}

		public function result(data:Object):void
		{
			log.info("gis视图下基站退服数据获取成功");
			mapViewDM.gisQuitCollect = data;
			log.info(data);
			var evt:SceneEvent = new SceneEvent(SceneEvent.SHOW_GIS_QUIT_NUM);
			msgDispatcher(evt);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("gis视图下基站退服数据获取异常错误" + f.faultDetail + "\r\n" + f.faultString);
//			mapViewDM.gisQuitCollect = DemoDatas._initMapData;
//			var evt:SceneEvent = new SceneEvent(SceneEvent.SHOW_GIS_QUIT_NUM);
//			msgDispatcher(evt);
		}
	}
}