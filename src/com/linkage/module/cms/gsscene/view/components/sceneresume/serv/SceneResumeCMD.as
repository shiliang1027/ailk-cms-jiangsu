package com.linkage.module.cms.gsscene.view.components.sceneresume.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.sceneresume.SceneResumeDM;
	import com.linkage.module.cms.gsscene.view.components.sceneresume.dao.ISceneResumeDAO;
	import com.linkage.module.cms.gsscene.view.components.sceneresume.event.SceneResumeEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-8-1
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneResumeCMD
	{
		private var log:ILogger = Log.getLoggerByClass(SceneResumeCMD);

		[Inject("sceneResumeDAO")]
		public var dao:ISceneResumeDAO;

		[Inject("sceneResumeDM")]
		public var dm:SceneResumeDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SceneResumeEvent):AsyncToken
		{
			log.info("调用场景概要接口获取数据SceneResumeCMD：");
			return dao.getSceneGeneralInfo();
		}

		public function result(obj:Object):void
		{
			log.info("调用场景概要接口获取数据结果SceneResumeCMD：");
			dm.data = null;
			dm.sceneName = obj.sceneName;
			dm.data = obj;
			dispatchMsg(new SceneResumeEvent(SceneResumeEvent.CREATE_SCENERESUME_LAYOUT));
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.error("加载[场景概要图]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

