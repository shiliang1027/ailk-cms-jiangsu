package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
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

	public class LoadOpticInfoCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadOpticInfoCmd);

		[Inject("lineInfoDao")]
		public var lineInfoDao:ILineInfoDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("获取 光路 数据~! " + e.param);
			return lineInfoDao.loadOpticInfo(e.param.toString());
		}

		public function result(data:Object):void
		{
			log.info("获取 光路 数据~ success!");
			log.debug(data);

			mapViewDM.opticInfos.removeAll();
			mapViewDM.opticInfos.addAll(data as IList);
			mapViewDM.opticInfos.refresh();

			if(mapViewDM.opticInfos.length > 0)
				msgDispatcher(new SceneEvent(SceneEvent.SHOW_OPTIC_INFO));
			else
				Alert.show("没有光路信息~");
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载 光路 数据~ error:" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

