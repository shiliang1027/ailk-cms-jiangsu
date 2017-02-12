package com.linkage.module.cms.gsscene.view.components.scenethumbnail.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.scenethumbnail.SceneThumbnailDM;
	import com.linkage.module.cms.gsscene.view.components.scenethumbnail.dao.ISceneThumbnailDAO;
	import com.linkage.module.cms.gsscene.view.components.scenethumbnail.event.SceneThumbnailEvent;
	import com.linkage.module.cms.gsscene.view.util.ImageFactory;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneThumbnailCMD
	{

		private var log:ILogger = Log.getLoggerByClass(SceneThumbnailCMD);

		[Inject("sceneThumbnailDAO")]
		public var dao:ISceneThumbnailDAO;

		[Inject]
		public var dm:SceneThumbnailDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SceneThumbnailEvent):AsyncToken
		{
			log.info("[缩略图]cmd调用接口");
			return dao.getSceneAreaThumb();
		}

		public function result(data:Object):void
		{
			log.info("[缩略图]调用接口获取数据结果" + data.length);
			dm.data.removeAll();
			dm.data.addAll(data as IList);
			dm.data.refresh();
			dispatchMsg(new SceneThumbnailEvent(SceneThumbnailEvent.THUMBNAIL_CREATEHANDLER));
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.error("加载[滚动缩略图]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

