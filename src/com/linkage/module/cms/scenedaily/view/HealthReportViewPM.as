package com.linkage.module.cms.scenedaily.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.domain.health.HealthReportDM;
	import com.linkage.module.cms.scenedaily.event.health.HealthReportEvent;

	import mx.controls.Alert;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HealthReportViewPM
	{
		private var log:ILogger = Log.getLoggerByClass(HealthReportViewPM);

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("healthReportDM")]
		[Bindable]
		public var dm:HealthReportDM;

		//发送时间的参数
		private var _params:Object = new Object();

		public function loadDataMap():void
		{
			log.info("begin to loadData");
			var evt:HealthReportEvent = new HealthReportEvent(HealthReportEvent.LOAD_HEALTHREPORT_DATA);
			evt.param = params;
			dispatchMsg(evt);
		}

		public function get params():Object
		{
			return _params;
		}

		public function set params(value:Object):void
		{
			_params = value;
		}

	}
}