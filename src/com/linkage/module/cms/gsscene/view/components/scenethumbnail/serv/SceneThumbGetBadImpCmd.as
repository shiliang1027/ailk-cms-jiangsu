package com.linkage.module.cms.gsscene.view.components.scenethumbnail.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.scenethumbnail.SceneThumbnailDM;
	import com.linkage.module.cms.gsscene.view.components.scenethumbnail.dao.ISceneThumbnailDAO;
	import com.linkage.module.cms.gsscene.view.components.scenethumbnail.event.SceneThumbnailEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-17
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneThumbGetBadImpCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneThumbGetBadImpCmd);

		[Inject("sceneThumbnailDAO")]
		public var dao:ISceneThumbnailDAO;

		[Inject("sceneThumbnailDM")]
		public var dm:SceneThumbnailDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SceneThumbnailEvent):AsyncToken
		{
			log.info("[缩略图tip窗口]cmd调用接口");
			return dao.getAreaBadAndImpPerf(e.data);
		}

		public function result(data:Object):void
		{
			log.info("[缩略图tip窗口]调用接口获取数据结果");
			dm.badList.removeAll();
			log.info(data);
			dm.badList.addAll(data as IList);
			dm.badList.refresh();
			dispatchMsg(new SceneThumbnailEvent(SceneThumbnailEvent.SCENE_AREABAD_IMPPERF_INIT));
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.error("加载[滚动缩略图tip窗口]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

