package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.ISceneIntroDao;
	import com.linkage.module.cms.scene.dao.ISceneToolTipDao;
	import com.linkage.module.cms.scene.domain.SceneIntroDM;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.SceneEvent;
	import com.linkage.module.cms.scene.event.compenent.SceneIntroEvent;
	
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	public class SceneInfoEditNextCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneInfoEditNextCmd);

		[Inject("sceneToolTipDao")]
		public var dao:ISceneToolTipDao;

		[Inject("user")]
		public var user:IUser;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Bindable]
		private var labelTypeId:String;

		private var systime:Number = 0;

		public function execute(e:SceneIntroEvent):AsyncToken
		{
			log.info("修改场景介绍zhong下一条 cmd 加载数据！");
			log.info(e.obj);
			labelTypeId = e.obj.labelId + "";
			systime = (new Date()).getTime();
			return dao.sceneIntroduction(e.obj);
		}

		public function result(data:String):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info(data);
			var evt:SceneEvent = new SceneEvent(SceneEvent.CMS_SCENE_SCENEINTRO_SHOWTISHI);
			evt.sceneIntroString = data;
			evt.labelTypeId = labelTypeId;
			log.info("sceneIntroString=" + evt.sceneIntroString);
			dispatchMsg(evt);

			//如果是场景介绍提示信息 放入滚动
			log.info(labelTypeId == "101");
			if (labelTypeId == "101")
			{
				var sievt:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.CMS_SCENE_SCENEINTRO_SCENEINTROSTRING);
				sievt.params = new Object();
				sievt.params.sceneIntroString = data;
				sievt.params.labelTypeId = labelTypeId;
				dispatchMsg(sievt);
			}
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("修改场景介绍zhong下一条数据错误：" + f.faultString + "\n" + f.faultDetail);
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}
	}
}