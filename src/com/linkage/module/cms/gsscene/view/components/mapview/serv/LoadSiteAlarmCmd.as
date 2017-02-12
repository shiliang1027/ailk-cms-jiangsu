package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.ILineInfoDao;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.IMapViewDao;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.ISiteAlarmDao;
	
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

	public class LoadSiteAlarmCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadSiteAlarmCmd);

		[Inject("siteAlarmDao")]
		public var siteAlarmDao:ISiteAlarmDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("获取 机楼告警 数据~! " + e.param);
			return siteAlarmDao.loadSiteAlarmInfo(e.param.toString());
		}

		public function result(data:Object):void
		{
			log.info("获取 机楼告警 数据~ success!");
			log.debug(data);

			mapViewDM.siteAlarmInfos.removeAll();
			mapViewDM.siteAlarmInfos.addAll(data as IList);
			mapViewDM.siteAlarmInfos.refresh();

			if(mapViewDM.siteAlarmInfos.length > 0)
				msgDispatcher(new SceneEvent(SceneEvent.SHOW_SITE_ALARM));
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("加载 机楼告警 数据~ error:" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

