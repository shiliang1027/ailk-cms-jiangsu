package com.linkage.module.cms.scene.serv
{

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.IMapViewDao;
	import com.linkage.module.cms.scene.domain.MapViewDM;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	public class SceneCityLayerCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneCityLayerCmd);

		[Inject("mapViewDao")]
		public var dao:IMapViewDao;

		[Inject("mapViewDM")]
		public var dm:MapViewDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("SceneCityLayerCmd execute");
			return dao.getCityGisId();
		}

		public function result(data:Object):void
		{
			log.info("SceneCityLayerCmd result!");
			log.debug(data);
			dm.cityLayer.removeAll();
			dm.cityLayer.addAll(data as IList);

			log.info("SceneCityLayerCmd result 发送显示地市图层的事件：SHOW_CITY_LAYER！");
			dispatchMsg(new SceneEvent(SceneEvent.SHOW_CITY_LAYER));
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("SceneCityLayerCmd 数据错误：" + f.faultDetail + "\n" + f.faultString);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}
	}
}
