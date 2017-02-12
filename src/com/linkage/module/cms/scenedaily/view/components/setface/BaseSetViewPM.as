package com.linkage.module.cms.scenedaily.view.components.setface
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.setface.SetFaceDM;
	import com.linkage.module.cms.scenedaily.event.setface.SetFaceEvent;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-3
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class BaseSetViewPM
	{
		private var log:ILogger = Log.getLoggerByClass(BaseSetViewPM);

		//参数
		public var param:Object = new Object();

		[Inject("setFaceDM")]
		public var dm:SetFaceDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		//保存
		public function saveSetData():void
		{
			var evt:SetFaceEvent = new SetFaceEvent(SetFaceEvent.SAVE_BASESET_DATA);
			evt.param = param;
			dispatchMsg(evt);
		}

		public function loadData():void
		{
			dispatchMsg(new SetFaceEvent(SetFaceEvent.LOAD_BASESET_DATA));
		}

	}
}