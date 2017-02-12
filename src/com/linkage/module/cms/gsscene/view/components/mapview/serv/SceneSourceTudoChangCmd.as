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

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2013-3-12
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneSourceTudoChangCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneSourceTudoChangCmd);

		[Inject("mapViewDao")]
		public var mapViewDao:IMapViewDao;

		[Inject("mapViewDM")]
		public var dm:MapViewDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("转换坐标CMD...!");
			log.debug(e.param.dataList);
			return mapViewDao.getMultiMoLatitudeByMoId(e.param.dataList);
		}

		public function result(data:Object):void
		{
			log.info("转换坐标CMD...success!");
			log.info(data);
			var evt:SceneEvent = new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_SOURCETUDOCHANGE_COMP);
			evt.param = data;
			msgDispatcher(evt);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("转换坐标CMD... error:" + f.faultString + "\n" + f.faultDetail);
		}
	}
}