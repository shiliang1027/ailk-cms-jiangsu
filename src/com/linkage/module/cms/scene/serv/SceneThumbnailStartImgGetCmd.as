package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.ISceneTreeDAO;
	import com.linkage.module.cms.scene.domain.SceneThumbnailDM;
	import com.linkage.module.cms.scene.event.SceneThumbnailEvent;
	import com.linkage.module.cms.scene.event.SceneTreeEvent;
	import com.linkage.module.cms.scene.view.util.ImageFactory;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-4-12
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneThumbnailStartImgGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneThumbnailStartImgGetCmd);

		[Inject("sceneTreeDAO")]
		public var dao:ISceneTreeDAO;

		[Inject]
		public var dm:SceneThumbnailDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SceneThumbnailEvent):AsyncToken
		{
			log.info("[加载启停缩略图数据]cmd调用接口");
			return dao.queryUpdateAreaName(e.data);
		}

		public function result(data:Object):void
		{
			log.info("[加载启停缩略图数据]调用接口获取数据结果:" + data.length);
			var e:SceneThumbnailEvent = new SceneThumbnailEvent(SceneThumbnailEvent.CMS_SCENE_SCENETHUMBNAIL_STARTIMGSHOWDATA);
			e.data = new Object();
			e.data = data;
			dispatchMsg(e);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[加载启停缩略图数据]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}
	}
}