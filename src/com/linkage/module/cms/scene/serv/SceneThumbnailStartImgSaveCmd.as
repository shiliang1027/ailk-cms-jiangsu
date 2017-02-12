package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.ISceneTreeDAO;
	import com.linkage.module.cms.scene.domain.SceneThumbnailDM;
	import com.linkage.module.cms.scene.event.SceneThumbnailEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-4-15
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneThumbnailStartImgSaveCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneThumbGetBadImpCmd);

		[Inject("sceneTreeDAO")]
		public var dao:ISceneTreeDAO;
		[MessageDispatcher]
		public var dispatchMsg:Function;
		public function execute(e:SceneThumbnailEvent):AsyncToken
		{
			log.info("[缩略图-启停数据保存]cmd调用接口");
			return dao.updateListAreaStatus(e.data);
		}

		public function result(data:Object):void
		{
			log.info("[缩略图-启停数据保存]调用接口获取数据结果");
			if (data.hasOwnProperty("message"))
			{
				Alert.show(data["message"], "提示");
			}
			else
			{
				Alert.show("保存失败", "提示");
			}
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[滚动缩略图-启停数据保存]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}
	}
}