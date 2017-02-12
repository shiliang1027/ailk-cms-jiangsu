package com.linkage.module.cms.gsscene.view.components.sceneintro.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.SceneIntroDM;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.dao.ISceneIntroDao;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.dao.ISceneToolTipDao;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.dao.SceneToolTipDao;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.event.SceneIntroEvent;
	import com.linkage.module.cms.gsscene.view.components.scenetree.SceneTreeDM;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class SceneInfoEditCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneInfoEditCmd);

		[Inject("sceneToolTipDao")]
		public var dao:ISceneToolTipDao;

//		[Inject("sceneIntro1DM")]
//		[Bindable]
//		public var sceneIntroDM:SceneIntroDM;

		[Inject("user")]
		public var user:IUser;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SceneIntroEvent):AsyncToken
		{
			log.info("修改场景详情 cmd 加载数据！");
			log.info(e.params);
			return dao.updateSceneInfo(e.params);
		}

		public function result(data:String):void
		{
			log.info("修改场景详情 cmd 加载数据成功！");
			log.info(data);
			if (user.initSceneId == "1003")
			{
				if (String(data) == "success")
				{
					Alert.show("修改成功！", "提示");
				}
				else
				{
					Alert.show("修改失败！", "提示");
				}
				return;
			}
			var evt:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.SHOW_SCENE_GAME_ACTIVE_SUC);
			evt.params.isSaveSceneInfo = data;
			dispatchMsg(evt);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.error("修改场景详情 cmd 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}