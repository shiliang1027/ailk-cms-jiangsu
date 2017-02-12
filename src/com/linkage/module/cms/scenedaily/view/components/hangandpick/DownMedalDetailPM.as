package com.linkage.module.cms.scenedaily.view.components.hangandpick
{
	import com.linkage.module.cms.scenedaily.domain.hangandpick.MedalDetailDM;
	import com.linkage.module.cms.scenedaily.event.hangandpick.GedalDetailEvent;
	import com.linkage.module.cms.scenedaily.view.components.util.FileUpDownLoad;

	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DownMedalDetailPM
	{
		[Inject("medalDetailDM")]
		[Bindable]
		public var hangMedalDetailDM:MedalDetailDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;
		private var fileRefer:FileReference = new FileReference();
		private var fileUpDownLoad:FileUpDownLoad;

		/**
		 * 摘牌网元信息
		 */
		public function getDownMedalnfo(id:String):void
		{
			var e:GedalDetailEvent = new GedalDetailEvent(GedalDetailEvent.GET_DOWN_DETAIL_INFO);
			e.id = id;
			msgDispatcher(e);
		}

		//导出
		public function export(id:String, type:int):void
		{
			var fileType:FileFilter = new FileFilter("Excel", "*.xls");
			var fileTypes:Array = new Array(fileType);
			fileUpDownLoad = new FileUpDownLoad();
			var downLoadUrl:URLRequest = new URLRequest("/cms/scenedaily/listed/listedAction!export.action");
			var downLoadData:URLVariables = new URLVariables();
			downLoadData.id = id;
			downLoadData.type = type;
			downLoadUrl.data = downLoadData;
			fileUpDownLoad.downLoadURLRequest = downLoadUrl;
			fileUpDownLoad.fileFilters = fileTypes;
			fileUpDownLoad.downLoad();
		}
	}
}