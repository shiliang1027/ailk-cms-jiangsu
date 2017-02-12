package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.ILineInfoDao;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.IMapViewDao;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/*
	 *说明：
	 *作者：panyin
	 *时间：2012-11-28上午10:21:30
	 **/

	public class LoadLineInfoCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadLineInfoCmd);

		[Inject("lineInfoDao")]
		public var lineInfoDao:ILineInfoDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("获取 传输管线 数据~! " + e.param);
			return lineInfoDao.loadLineInfo(e.param.toString());
		}

		public function result(data:Object):void
		{
			log.info("获取 传输管线 数据~ success!");
			log.debug(data);

			mapViewDM.lineInfos.removeAll();
			mapViewDM.lineInfos.addAll(data as IList);
			mapViewDM.lineInfos.refresh();

			if(mapViewDM.lineInfos.length > 0)
				msgDispatcher(new SceneEvent(SceneEvent.SHOW_LINE_INFO));
			else
				Alert.show("没有管线信息~");
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("加载 传输管线 数据~ error:" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

