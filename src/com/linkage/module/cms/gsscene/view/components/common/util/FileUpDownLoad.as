package com.linkage.module.cms.gsscene.view.components.common.util
{
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
	 * 该as的描述信息
	 * @author shiliang(66614) Tel:13770527121
	 * @version 1.0
	 * @since 2012-6-6 下午2:53:46
	 * @category
	 * @copyright 南京联创科技 网管开发部
	 */
	public class FileUpDownLoad
	{
		private var _upLoadURLRequest:URLRequest;
		private var _downLoadURLRequest:URLRequest;

		public var fileFilters:Array;

		private var _fileRefer:FileReference;

		[Bindable]
		public var sessionId:String = "";

		public function FileUpDownLoad(upLoadUrl:String = null, downLoadUrl:String = null)
		{
			if (upLoadUrl)
			{
				this.upLoadURLRequest = new URLRequest(upLoadUrl);
				this.upLoadURLRequest.method = "POST";
				this.upLoadURLRequest.contentType = "multipart/form-data";
			}

			if (downLoadUrl)
			{
				this.downLoadURLRequest = new URLRequest(downLoadUrl);
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
				this.upLoadURLRequest.data.fileName = fileRefer.name;
			}
			else
			{
				var data:URLVariables = new URLVariables();
				data.fileName = fileRefer.name;
				this.upLoadURLRequest.data = data;
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
			_downLoadURLRequest = value;
		}

		public function get upLoadURLRequest():URLRequest
		{
			return _upLoadURLRequest;
		}

		private function showMessage(event:DataEvent):void
		{
			Alert.show(event.data);
		}

		public function set upLoadURLRequest(value:URLRequest):void
		{
			_upLoadURLRequest = value;
			fileRefer = new FileReference();
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
			_fileRefer = value;
		}



	}
}