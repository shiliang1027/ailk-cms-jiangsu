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
	 * @date 2013-3-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneViewSourceByDrawCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneViewSourceByDrawCmd);

		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;


		[Inject("mapViewDao")]
		public var dao:IMapViewDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;


		public function execute(e:SceneEvent):AsyncToken
		{
			log.debug("加载MO参数");
			log.info(e.param);
			return dao.queryMoContains(e.param);
		}

		public function result(data:Object):void
		{
			log.info("画图加载mo返回");
			log.debug(data);
			mapViewDM.selectMoList.removeAll();
			mapViewDM.selectMoList.addAll(data as IList);
			mapViewDM.selectMoList.refresh();
			log.debug("框圈返回数据集...");
			log.debug(mapViewDM.selectMoList);
			msgDispatcher(new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_SHOW_MOLIST));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}


		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
		}
	}
}