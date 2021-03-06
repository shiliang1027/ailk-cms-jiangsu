package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-8-12
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class CameraInfoGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(CameraInfoGetCmd);

		[Inject("scenePanelDao")]
		public var dao:IScenePanelDao;
		[MessageDispatcher]
		public var msgDispatcher:Function;


		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("摄像头信息数据获取！");
			return dao.getCameraList(e.param);
		}

		public function result(data:Object):void
		{
			log.info("摄像头信息数据获取成功");

			var evt:SceneEvent = new SceneEvent(SceneEvent.CMS_SCENE_CAMERALISTSHOWWIN_CAMERALISTSHOWHANDLER);
			evt.param = new Object();
			evt.param = data;
			msgDispatcher(evt);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("摄像头信息数据获取异常错误" + f.faultDetail + "\r\n" + f.faultString);
		}
	}
}