package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.ISceneViewDao;
	import com.linkage.module.cms.scene.domain.SceneConfigDM;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class SceneViewCfgCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneViewCfgCmd);

		[Inject("sceneConfigDM")]
		public var dm:SceneConfigDM;

		[Inject("sceneViewDao")]
		public var dao:ISceneViewDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		private var systime:Number = 0;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("调用远程方法，加载场景配置数据！");
			systime = (new Date()).getTime();
			return dao.getSceneCfgData();
		}

		public function result(data:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info("加载场景配置数据成功！" + data.length);
			dm.panelList.removeAll();
			dm.panelList.addAll(data as IList);

			msgDispatcher(new SceneEvent(SceneEvent.DEAL_SCENE_CFG));
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载场景配置数据错误faultString：[{0}],faultDetail:[{1}]", f.faultString, f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}
