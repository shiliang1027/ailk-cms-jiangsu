package com.linkage.module.cms.perfmonitornew.colorAlarm
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.perfmonitornew.colorAlarm.FileUpDownLoad;
	
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
	public class ColorAlarmSolvePlanServ
	{
		private var fileRefer:FileReference=new FileReference();
		private var fileUpDownLoad:FileUpDownLoad;
		private var progressBar:ProgressBar;

		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitor.colorAlarm.ColorAlarmSolvePlanServ");
		
		public function importDatas(moTypeId:String,onCompleteHandler:Function,onIOErrorHandler:Function):void
		{
			log.info("begin to import：moTypeId--->" + moTypeId);
			fileUpDownLoad=new FileUpDownLoad();
			var upLoadUrl:URLRequest=new URLRequest("/cms/performance/royb/emergencySysAction!importSolvePlans.action");
			var upLoadData:URLVariables=new URLVariables();
			upLoadData["moTypeId"] = moTypeId;
			upLoadUrl.method="POST";
			upLoadUrl.data=upLoadData;
			upLoadUrl.contentType="multipart/form-data";
			fileUpDownLoad.upLoadURLRequest=upLoadUrl;
//			fileUpDownLoad.fileRefer.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			fileUpDownLoad.upLoad();
			fileUpDownLoad.fileRefer.addEventListener(Event.COMPLETE, onCompleteHandler);
			fileUpDownLoad.fileRefer.addEventListener(IOErrorEvent.IO_ERROR, onIOErrorHandler);
			log.info("end  import");
		}

//		private function progressHandler(event:ProgressEvent):void
//		{
//			progressBar.setProgress(event.bytesLoaded, event.bytesTotal);
//		}

		public function exportData(moTypeId:String,onCompleteHandler:Function,onIOErrorHandler:Function):void
		{
			log.info("begin to export：moTypeId--->" + moTypeId);
			fileRefer=new FileReference();
			var fileType:FileFilter=new FileFilter("Excel", "*.xls");
			var fileTypes:Array=new Array(fileType);
			fileUpDownLoad=new FileUpDownLoad();
			var downLoadUrl:URLRequest=new URLRequest("/cms/performance/royb/emergencySysAction!exportSolvePlans.action");
			var downLoadData:URLVariables=new URLVariables();
			downLoadData["moTypeId"] = moTypeId;
			downLoadUrl.data=downLoadData;
			fileUpDownLoad.downLoadURLRequest=downLoadUrl;
			fileUpDownLoad.fileFilters=fileTypes;
			fileUpDownLoad.downLoad();
			fileUpDownLoad.fileRefer.addEventListener(Event.COMPLETE, onCompleteHandler);
			fileUpDownLoad.fileRefer.addEventListener(IOErrorEvent.IO_ERROR, onIOErrorHandler);
		}
	}
}