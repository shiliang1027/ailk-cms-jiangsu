package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.gis.core.metry.GisPoint;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class TyphoonCoverCityLoadCmd
	{
		private var log:ILogger = Log.getLoggerByClass(TyphoonCoverCityLoadCmd);

		[Inject("scenePanelDao")]
		public var panelDao:IScenePanelDao;

		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("typhoon cover city cmd load data!");
			return panelDao.getCoverCityMsg();
		}

		public function result(data:Object):void
		{
			log.info("typhoon cover city cmd load data success!" + data.length);
			mapViewDM.typhoonCityMsgList.removeAll();
			mapViewDM.typhoonCityMsgList.addAll(data as IList);

			log.info("typhoon cover city cmd dispatch show event SHOW_TYPHOON_COVER_CITY!");
			msgDispatcher(new SceneEvent(SceneEvent.SHOW_TYPHOON_COVER_CITY));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("typhoon cover city cmd load data error:" + f.faultString + "\n" + f.faultDetail);
		}
	}
}