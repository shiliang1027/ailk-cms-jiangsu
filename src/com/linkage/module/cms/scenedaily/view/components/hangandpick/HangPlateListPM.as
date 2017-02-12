package com.linkage.module.cms.scenedaily.view.components.hangandpick
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.hangandpick.HangPlateListDM;
	import com.linkage.module.cms.scenedaily.event.hangandpick.HangPlateListEvent;
	import com.linkage.module.cms.scenedaily.view.components.util.FileUpDownLoad;

	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	import mx.controls.Alert;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-11-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangPlateListPM
	{
		private var log:ILogger = Log.getLoggerByClass(HangPlateListPM);

		[Inject("hangPlateListDM")]
		[Bindable]
		public var dm:HangPlateListDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		private var fileRefer:FileReference = new FileReference();
		private var fileUpDownLoad:FileUpDownLoad;

		public function initHangPlateList(param:Object):void
		{
			log.info("[挂牌列表]加载挂牌数据，抛出事件LOAD_HANGPLATE_DATA。");
			var evt:HangPlateListEvent = new HangPlateListEvent(HangPlateListEvent.CMS_SCENEDAILY_HANGPLATELIST_INITHANGPLATELIST);
			evt.param = new Object();
			evt.param = param;
			msgDispatcher(evt);
		}


		//导出
		public function export(param:Object):void
		{
			log.info("export param");
			var fileType:FileFilter = new FileFilter("Excel", "*.xls");
			var fileTypes:Array = new Array(fileType);
			fileUpDownLoad = new FileUpDownLoad();
			//cms//scenedaily/listed/listedAction!exprotListingMoData.action
			var downLoadUrl:URLRequest = new URLRequest("/cms//scenedaily/listed/listedAction!exprotListingMoData.action");
			var downLoadData:URLVariables = new URLVariables();
			downLoadData.id = param.cityId;
			downLoadData.startTime = param.startTime;
			downLoadData.endTime = param.endTime;
			downLoadUrl.data = downLoadData;
			fileUpDownLoad.downLoadURLRequest = downLoadUrl;
			fileUpDownLoad.fileFilters = fileTypes;
			fileUpDownLoad.downLoad();
			log.info("export send");
		}
	}
}