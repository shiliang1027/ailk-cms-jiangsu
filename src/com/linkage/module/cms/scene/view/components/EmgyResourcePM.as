package com.linkage.module.cms.scene.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.domain.EmgyResourceDM;
	import com.linkage.module.cms.scene.event.EmpyEvent;
	import com.linkage.module.cms.scene.event.ResMatrixEvent;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-1
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class EmgyResourcePM
	{
		private var log:ILogger = Log.getLoggerByClass(EmgyResourcePM);

		[Inject("emgyResourceDM")]
		[Bindable]
		public var emgyResourceDM:EmgyResourceDM;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		/**
		 * 应急资源概况事件派发
		 */
		public function getSceneEmgyInfo():void
		{
			//TODO
			log.debug("[应急资源]:派发应急概况事件" + EmpyEvent.SHOW_EMPY_SITUATION);
			var empyEvent:EmpyEvent = new EmpyEvent(EmpyEvent.SHOW_EMPY_SITUATION);
//			msgDispatcher(empyEvent);
//			msgDispatcher(new ResMatrixEvent(ResMatrixEvent.LOAD_RESMATRIX_DATA));

			requestServerUtil.addRequest(empyEvent);
			requestServerUtil.addRequest(new ResMatrixEvent(ResMatrixEvent.LOAD_RESMATRIX_DATA));
		}

		/**
		 * 应急资源详情事件派发
		 */
		public function getSceneEmgyDetail(param:Object):void
		{
			log.debug("[应急资源]:应急详情事件" + EmpyEvent.SHOW_EMPY_DETAIL);
			var empyDetailEvent:EmpyEvent = new EmpyEvent(EmpyEvent.SHOW_EMPY_DETAIL);
			empyDetailEvent.param = param;
//			msgDispatcher(empyDetailEvent);
			requestServerUtil.addRequest(empyDetailEvent);
		}

		/**
		 * 保存
		 */
		public function saveEmgyDetail(param:Object):void
		{
			log.debug("[应急资源]:保存" + EmpyEvent.SAVE_EMGY_DETAIL);
			var saveEmgy:EmpyEvent = new EmpyEvent(EmpyEvent.SAVE_EMGY_DETAIL);
			saveEmgy.param = param;
//			msgDispatcher(saveEmgy);
			requestServerUtil.addRequest(saveEmgy);
		}


	}
}