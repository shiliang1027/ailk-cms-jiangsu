package com.linkage.module.cms.scenedaily.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.medicalcard.MedicalCardDM;
	import com.linkage.module.cms.scenedaily.event.medicalcard.MedicalCardEvent;

	import mx.controls.Alert;
	import mx.formatters.DateFormatter;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MedicalCardViewPM
	{
		private var log:ILogger = Log.getLoggerByClass(MedicalCardViewPM);

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("medicalCardDM")]
		[Bindable]
		public var dm:MedicalCardDM;


		//参数
		private var _param:Object = new Object;


		//加载数据
		public function loadDataMap():void
		{
			if (param.startTime > param.endTime)
			{
				Alert.show("开始时间不能大于结束时间");
				return;
			}
			log.info("begin to loadData");
			var evt:MedicalCardEvent = new MedicalCardEvent(MedicalCardEvent.LOAD_MEDICALCARD_DATA);
			evt.param = param;
			dispatchMsg(evt);
		}

		//导出
		public function export():void
		{
			log.info("begin to exportdata");
			var evt:MedicalCardEvent = new MedicalCardEvent(MedicalCardEvent.EXPORT_MEDICALCARD_DATA);
			evt.param = param;
			dispatchMsg(evt);
		}

		public function get param():Object
		{
			return _param;
		}

		public function set param(value:Object):void
		{
			_param = value;
		}

	}
}