package com.linkage.module.cms.scenedaily.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.domain.delisting.DelistingDM;
	import com.linkage.module.cms.scenedaily.event.delisting.DelistingEvent;
	import com.linkage.module.cms.scenedaily.view.components.util.FileUpDownLoad;

	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DelistingMoViewPM
	{
		private var log:ILogger = Log.getLoggerByClass(DelistingMoViewPM);

		[Inject("delistingDM")]
		[Bindable]
		public var dm:DelistingDM;

		[Inject("user")]
		public var user:IUser;

		//存放传递传参
		public var param:Object = new Object();

		[MessageDispatcher]
		public var dispatchMsg:Function;

		private var fileRefer:FileReference = new FileReference();
		private var fileUpDownLoad:FileUpDownLoad;

		//加载摘牌网元列表数据
		public function loadDelistingMoData():void
		{
			var evt:DelistingEvent = new DelistingEvent(DelistingEvent.LOAD_DELISTING_MO_DATA);
			evt.param = param;
			dispatchMsg(evt);
		}

		//导出
		public function export():void
		{
			log.info("export param");
			var fileType:FileFilter = new FileFilter("Excel", "*.xls");
			var fileTypes:Array = new Array(fileType);
			fileUpDownLoad = new FileUpDownLoad();
			var downLoadUrl:URLRequest = new URLRequest("/cms/scenedaily/delist/delistAction!reportExcel.action");
			var downLoadData:URLVariables = new URLVariables();
			downLoadData.startTime = param.startTime;
			downLoadData.endTime = param.endTime;
			downLoadData.cityId = param.cityId;
			downLoadUrl.data = downLoadData;

			fileUpDownLoad.downLoadURLRequest = downLoadUrl;
			fileUpDownLoad.fileFilters = fileTypes;
			fileUpDownLoad.downLoad();
			log.info("export send");
		}
	}
}

