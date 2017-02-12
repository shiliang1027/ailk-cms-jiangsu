package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.IMapViewDao;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.MapViewDao;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
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
	public class LoadSourceByMoCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadSourceByMoCmd);

		[Inject("mapViewDao")]
		public var dao:MapViewDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("mapViewDM")]
		public var dm:MapViewDM;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.debug("检索查询信息cmd...");
			log.info(e.param);
			return dao.queryMoByCon(e.param);
		}

		public function result(data:Object):void
		{
			log.info("检索查询信息cmd返回...");
			log.info(data);
			dm.selectMoList.removeAll();
			dm.selectMoList.addAll(data as IList);
			dm.selectMoList.refresh();
//			log.debug("数据集...");
//			log.debug(dm.selectMoList);
			msgDispatcher(new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_SHOW_MOLIST));
			msgDispatcher(new Event("REQUEST_COMPLETE"));

		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("获检索查询信息cmd error:" + f.faultString + "\n" + f.faultDetail);
		}
	}
}