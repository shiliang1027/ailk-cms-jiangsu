package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.ISceneTreeDAO;
	import com.linkage.module.cms.scene.domain.SceneThumbnailDM;
	import com.linkage.module.cms.scene.event.SceneEvent;
	import com.linkage.module.cms.scene.event.SceneThumbnailEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-4-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneThumbnailImgDeleteCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneThumbnailImgDeleteCmd);

		[Inject("sceneTreeDAO")]
		public var dao:ISceneTreeDAO;

		[Inject]
		public var dm:SceneThumbnailDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		private var _param:Object;

		public function execute(e:SceneThumbnailEvent):AsyncToken
		{
			log.info("[缩略图-删除区域]cmd调用接口");
			param = e.data;

			return dao.deleteImgData(e.data);
		}

		public function result(data:Object):void
		{
			log.info("[缩略图-删除区域]调用接口获取数据结果");
			if (data.hasOwnProperty("flag") && data["flag"] == "1")
			{
				//删除成功，重新加载
				Alert.show("删除成功，重新加载页面！", "提示");
				dispatchMsg(new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_BACKTOPFLOOR));
			}
			else if (data.hasOwnProperty("flag") && data["flag"] == "2")
			{
				log.info("只有一个区域！！");
				log.info(param);
				var evt:SceneThumbnailEvent = new SceneThumbnailEvent(SceneThumbnailEvent.CMS_SCENE_SCENETHUMBNAIL_DELETEIMGSCENEDATA);
				evt.data = new Object();
				evt.data = param;
				dispatchMsg(evt);
			}
			else if (data.hasOwnProperty("flag") && data["flag"] == "3")
			{
				log.info("该场景已经被删除！");
				Alert.show("场景删除成功！", "提示");
			}
			else
			{
				if (data.hasOwnProperty("flag") && data["flag"] == "0")
				{
					Alert.show(data["message"], "提示");
				}
				else
				{
					Alert.show("删除失败！", "提示");
				}
			}
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[缩略图-删除区域]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function get param():Object
		{
			return _param;
		}

		public function set param(value:Object):void
		{
			_param = value;
		}


	}
}