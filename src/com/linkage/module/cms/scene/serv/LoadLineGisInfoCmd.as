package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.ILineGisInfoDao;
	import com.linkage.module.cms.scene.dao.ILineInfoDao;
	import com.linkage.module.cms.scene.dao.IMapViewDao;
	import com.linkage.module.cms.scene.domain.MapViewDM;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
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

	public class LoadLineGisInfoCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadLineGisInfoCmd);

		[Inject("lineGisInfoDao")]
		public var lineGisInfoDao:ILineGisInfoDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;

		private var lastCircName:String;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("获取 传输管线 GIS撒点 数据~! " + e.param);
			lastCircName = e.param.toString();
			return lineGisInfoDao.loadLineGisInfo(e.param.toString());
		}

		public function result(data:Object):void
		{
			log.info("获取 传输管线 GIS撒点 数据~ success!");
			log.debug(data);

			mapViewDM.lineGisInfos.removeAll();
			mapViewDM.lineGisInfos.addAll(data as IList);
			mapViewDM.lineGisInfos.refresh();

			if(mapViewDM.lineGisInfos.length > 0)
			{
				var event:SceneEvent = new SceneEvent(SceneEvent.SHOW_LINE_GIS_INFO);
				event.param = lastCircName;
				msgDispatcher(event);
			}
			else
				Alert.show("没有管线GIS撒点信息~");
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载 传输管线 GIS 撒点 数据~ error:" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

