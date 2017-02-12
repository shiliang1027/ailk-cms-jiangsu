package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.ISceneIntroDao;
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.dao.ISceneToolTipDao;
	import com.linkage.module.cms.scene.dao.ISceneTreeDAO;
	import com.linkage.module.cms.scene.dao.SceneToolTipDao;
	import com.linkage.module.cms.scene.domain.SceneIntroDM;
	import com.linkage.module.cms.scene.domain.SceneTreeDM;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.SceneEvent;
	import com.linkage.module.cms.scene.event.compenent.SceneIntroEvent;
	
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
			log.error("修改场景详情 cmd 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}
	}
}