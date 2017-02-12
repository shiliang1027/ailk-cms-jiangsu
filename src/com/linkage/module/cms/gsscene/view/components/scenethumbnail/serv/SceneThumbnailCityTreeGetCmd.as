package com.linkage.module.cms.gsscene.view.components.scenethumbnail.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.scenethumbnail.SceneThumbnailDM;
	import com.linkage.module.cms.gsscene.view.components.scenethumbnail.event.SceneThumbnailEvent;
	import com.linkage.module.cms.gsscene.view.components.scenetree.dao.ISceneTreeDAO;
	
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-04-24
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneThumbnailCityTreeGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneThumbnailCityTreeGetCmd);

		[Inject("sceneThumbnailDAO")]
		public var dao:ISceneTreeDAO;

		[Inject("sceneThumbnailDM")]
		public var dm:SceneThumbnailDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SceneThumbnailEvent):AsyncToken
		{
			log.info("[启停窗口-地市tree]cmd调用接口");
			return dao.getSceneAreaList(e.data);
		}

		public function result(data:Object):void
		{
			log.info("[启停窗口-地市tree]调用接口获取数据结果");
			var evt:SceneThumbnailEvent = new SceneThumbnailEvent(SceneThumbnailEvent.CMS_SCENE_SCENETHUMBNAIL_CITYTREESHOWDATA);
			evt.data = new Object();
			evt.data = (ObjectUtil.copy(data.xml));

//			log.info("SceneTreeCMD result" + (ObjectUtil.copy(data.xml)));
			dispatchMsg(evt);
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.error("加载[启停窗口-地市tree]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
		}
	}
}