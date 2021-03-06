package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.gis.core.metry.GisPoint;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.IMapViewDao;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class MapViewLoadRoadPerfMsgCmd
	{
		private var log:ILogger = Log.getLoggerByClass(MapViewLoadRoadPerfMsgCmd);

		[Inject("mapViewDao")]
		public var mapViewDao:IMapViewDao;

		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("加载道路性能数据~!");
			return mapViewDao.getCityRoadIndicatorLight();
		}

		public function result(data:Object):void
		{
			log.info("加载道路性能数据~ success!" + data.length);
			mapViewDM.roadPerfList.removeAll();
			mapViewDM.roadPerfList.addAll(data as IList);

			log.info("抛出处理 道路性能数据事件~DEAL_ROAD_PERF_MSG!");
			msgDispatcher(new SceneEvent(SceneEvent.DEAL_ROAD_PERF_MSG));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("加载道路性能数据~ error:" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

