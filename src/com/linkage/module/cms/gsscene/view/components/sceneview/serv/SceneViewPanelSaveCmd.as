package com.linkage.module.cms.gsscene.view.components.sceneview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.sceneview.SceneConfigDM;
	import com.linkage.module.cms.gsscene.view.components.sceneview.dao.ISceneViewDao;
	
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
	 * @date 2013-2-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneViewPanelSaveCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneViewCfgCmd);

		[Inject("sceneConfigDM")]
		public var dm:SceneConfigDM;

		[Inject("sceneViewDao")]
		public var dao:ISceneViewDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("调用远程方法，保存场景配置数据！");
			return dao.savePanelsAccountCfg(e.param);
		}

		public function result(data:Object):void
		{
			log.info("保存场景配置数据成功！");
			if (String(data) == "success")
			{
				Alert.show("保存成功", "成功");
				msgDispatcher(new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_CONFIGENABLE)); //配置生效
			}
			else
			{
				Alert.show("保存失败", "错误");
			}
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));

		}

		public function error(f:Fault):void
		{
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("保存场景配置数据错误faultString：[{0}],faultDetail:[{1}]", f.faultString, f.faultDetail);
		}
	}
}