package com.linkage.module.cms.scene.view.components
{

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.event.AreaQuickConifgEvent;

	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;

	import mx.controls.Alert;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2013-1-15
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class FileUpDownAndLoad
	{
		private var _upLoadURLRequest:URLRequest;
		private var _downLoadURLRequest:URLRequest;

		public var fileFilters:Array;

		private var _fileRefer:FileReference;

		[Bindable]
		public var sessionId:String="";

		[MessageDispatcher]
		public var msgDispatcher:Function;

		private var log:ILogger=Log.getLoggerByClass(FileUpDownAndLoad);

		public function FileUpDownAndLoad(upLoadUrl:String=null, downLoadUrl:String=null)
		{
			if (upLoadUrl)
			{
				this.upLoadURLRequest=new URLRequest(upLoadUrl);
				this.upLoadURLRequest.method="POST";
				this.upLoadURLRequest.contentType="multipart/form-data";
			}

			if (downLoadUrl)
			{
				this.downLoadURLRequest=new URLRequest(downLoadUrl);
			}

		}

		public function upLoad():void
		{
			if (fileRefer)
			{
				fileRefer.browse(fileFilters);
			}
		}

		public function downLoad():void
		{
			if (downLoadURLRequest)
			{
				navigateToURL(downLoadURLRequest, "_top");
			}
		}


		//		private function fileSelect(event:Event):void{
		//			var data:URLVariables = new URLVariables();
		//			data.fileName = fileRefer.name;
		//			this.upLoadURLRequest.data = data;
		//			fileRefer.upload(upLoadURLRequest);
		//		}

		private function fileSelect(event:Event):void
		{
			if (this.upLoadURLRequest.data)
			{
				this.upLoadURLRequest.data.fileName=fileRefer.name;
			}
			else
			{
				var data:URLVariables=new URLVariables();
				data.fileName=fileRefer.name;
				this.upLoadURLRequest.data=data;
			}
			fileRefer.upload(upLoadURLRequest);
		}


		private function progressHandler(event:ProgressEvent):void
		{

		}

		private function completeHandler(event:Event):void
		{
			//			Alert.show("上传成功","提示");
		}

		private function securityErrorHandler(event:SecurityErrorEvent):void
		{
			//			Alert.show("安全问题:"+event.type,"错误");
		}

		private function httpStatusHandler(event:HTTPStatusEvent):void
		{
			//			Alert.show("HTTP状态:"+event.status,"提示");
		}

		private function ioErrorHandler(event:IOErrorEvent):void
		{
			//			Alert.show("IO ERROR:"+event.toString(),"错误");
		}

		public function get downLoadURLRequest():URLRequest
		{
			return _downLoadURLRequest;
		}

		public function set downLoadURLRequest(value:URLRequest):void
		{
			_downLoadURLRequest=value;
		}

		public function get upLoadURLRequest():URLRequest
		{
			return _upLoadURLRequest;
		}

		private function showMessage(event:DataEvent):void
		{
			log.info("导入返回" + String(event.data));
			var temp:Array=String(event.data).split("_");
			if ("failure" == temp[0])
			{
				Alert.show(String(temp[1]));
			}
			else if ("success" == temp[0])
			{
				sessionId=temp[1];
				Alert.show("上传成功");
				var evt:AreaQuickConifgEvent=new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_IMPORT_DATAS);
				evt.param=new Object();
				evt.param.key=sessionId;
				msgDispatcher(evt);
			}
		}

		public function set upLoadURLRequest(value:URLRequest):void
		{
			_upLoadURLRequest=value;
			fileRefer=new FileReference();
			fileRefer.addEventListener(Event.SELECT, fileSelect);

			fileRefer.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			fileRefer.addEventListener(Event.COMPLETE, completeHandler);
			fileRefer.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, showMessage);
			fileRefer.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			fileRefer.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			fileRefer.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}

		public function get fileRefer():FileReference
		{
			return _fileRefer;
		}

		public function set fileRefer(value:FileReference):void
		{
			_fileRefer=value;
		}
	}
}