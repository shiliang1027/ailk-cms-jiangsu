package com.linkage.module.cms.gsscene.view.components.sceneresume
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.sceneresume.SceneResumeDM;
	import com.linkage.module.cms.gsscene.view.components.sceneresume.event.SceneResumeEvent;

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
	public class SceneResumeCompPM
	{
		
		private var log:ILogger = Log.getLoggerByClass(SceneResumeCompPM);
		
		[Inject("sceneResumeDM")]
		[Bindable]
		public var dm:SceneResumeDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function getSceneGeneralInfo():void
		{
			log.info("SceneResumeCompPM   getSceneGeneralInfo");
//			dispatchMsg(new SceneResumeEvent(SceneResumeEvent.LOAD_SCENERESUME_DATA));
			requestServerUtil.addRequest(new SceneResumeEvent(SceneResumeEvent.LOAD_SCENERESUME_DATA));
		}
		
	}
}