package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.IMapViewDao;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class PolygonCmd
	{
		private var log:ILogger = Log.getLoggerByClass(PolygonCmd);

		[Inject("mapViewDM")]
		public var dm:MapViewDM;

		[Inject("mapViewDao")]
		public var dao:IMapViewDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneEvent):AsyncToken
		{
			//跌路场景等 可能直接加载图层.//Todo

			log.info("调用远程方法，加载场景/区域泰森多边形数据！");
			return dao.getScenePolygonData();
		}

		public function result(data:Object):void
		{
			log.info("加载场景/区域泰森多边形数据成功！");
			log.info(data);
			dm.polygonListSize=data.length;
			dm.polygonList.removeAll();
			dm.polygonList.addAll(data as IList);

//			msgDispatcher(new SceneEvent(SceneEvent.DEAL_SCENE_POLYGON));
//			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("加载场景/区域泰森多边形数据错误：" + f.faultString + "###" + f.faultDetail);
		}
	}
}

