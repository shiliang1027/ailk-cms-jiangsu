package com.linkage.module.cms.scenedaily.serv.threshold
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.view.components.util.FileUpDownLoad;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	import mx.controls.Alert;
	import mx.controls.ProgressBar;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-24
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ThresHoldServ
	{
		private var fileRefer:FileReference=new FileReference();
		private var fileUpDownLoad:FileUpDownLoad;
		private var progressBar:ProgressBar;

		private var log:ILogger=Log.getLoggerByClass(ThresHoldServ);

		[MessageHandler(selector="importThresHoldDatas")]
		public function importDatas():void
		{
			log.info("begin to import");
			fileUpDownLoad=new FileUpDownLoad();
			var upLoadUrl:URLRequest=new URLRequest("/cms/scenedaily/delist/delistAction!importThreshold.action");
			var upLoadData:URLVariables=new URLVariables();
			upLoadUrl.method="POST";
			upLoadUrl.data=upLoadData;
			upLoadUrl.contentType="multipart/form-data";
			fileUpDownLoad.upLoadURLRequest=upLoadUrl;
			//fileUpDownLoad.fileRefer.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			fileUpDownLoad.upLoad();
			//fileUpDownLoad.fileRefer.addEventListener(Event.COMPLETE, onCompleteHandler);
			fileUpDownLoad.fileRefer.addEventListener(IOErrorEvent.IO_ERROR, onIOErrorHandler);
			log.info("end  import");
		}

		private function onCompleteHandler(event:Event):void
		{
			Alert.show("导入成功", "成功");
		}

		private function onIOErrorHandler(event:IOErrorEvent):void
		{
			Alert.show("导入失败", "失败");
		}

//		private function progressHandler(event:ProgressEvent):void
//		{
//			progressBar.setProgress(event.bytesLoaded, event.bytesTotal);
//		}

		[MessageHandler(selector="exportThresHoldDatas")]
		public function exportData():void
		{
			fileRefer=new FileReference();
			var fileType:FileFilter=new FileFilter("Excel", "*.xls");
			var fileTypes:Array=new Array(fileType);
			fileUpDownLoad=new FileUpDownLoad();
			var downLoadUrl:URLRequest=new URLRequest("/cms/scenedaily/delist/delistAction!exportThreshold.action");
			var downLoadData:URLVariables=new URLVariables();
			downLoadUrl.data=downLoadData;
			fileUpDownLoad.downLoadURLRequest=downLoadUrl;
			fileUpDownLoad.fileFilters=fileTypes;
			fileUpDownLoad.downLoad();
		}
	}
}