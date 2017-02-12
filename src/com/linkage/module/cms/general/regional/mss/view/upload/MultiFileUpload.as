package com.linkage.module.cms.general.regional.mss.view.upload
{
	import flash.events.*;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	import mx.collections.ArrayCollection;
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Alert;
	import mx.controls.ProgressBar;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.controls.dataGridClasses.*;
	import mx.events.CollectionEvent;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import spark.components.Button;

	public class MultiFileUpload
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.mss.view.upload.MultiFileUpload");
		private var _datagrid:AdvancedDataGrid;
		private var _browsebutton:Button;
		private var _remselbutton:Button;
		private var _remallbutton:Button;
		private var _uploadbutton:Button;
		private var _progressbar:ProgressBar;
		private var _testButton:Button;

		private var _nameColumn:AdvancedDataGridColumn;
		private var _sizeColumn:AdvancedDataGridColumn;
		private var _columns:Array;

		[Bindable]
		private var _files:ArrayCollection;
		private var _fileref:FileReferenceList
		private var _file:FileReference;
		private var _uploadURL:URLRequest;
		private var _totalbytes:Number;
		private var _url:String="/cms/";
		private var _monitorId:String;
		private var _msgTempId:String;
		private var _msgTempType:String;

		private var _filefilter:Array;

		private var _maxFileSize:Number;
		private var _variables:URLVariables;
		private var _fileNameArray:Array;

		public function MultiFileUpload(dataGrid:AdvancedDataGrid, browseButton:Button, removeAllButton:Button, removeSelectedButton:Button, uploadButton:Button, progressBar:ProgressBar, maxFileSize:Number, filter:Array)
		{
			_datagrid=dataGrid;
			_browsebutton=browseButton;
			_remallbutton=removeAllButton;
			_remselbutton=removeSelectedButton;
			_uploadbutton=uploadButton;
			_progressbar=progressBar;
			_maxFileSize=maxFileSize * 1000000;
			_filefilter=filter;
			_fileNameArray=new Array();
			init();
		}

		private function init():void
		{
			_variables=new URLVariables;
			_files=new ArrayCollection();
			_fileref=new FileReferenceList;
			_file=new FileReference;

			_totalbytes=0;

			_browsebutton.addEventListener(MouseEvent.CLICK, browseFiles);
			_uploadbutton.addEventListener(MouseEvent.CLICK, uploadFiles);
			_remallbutton.addEventListener(MouseEvent.CLICK, clearFileCue);
			_remselbutton.addEventListener(MouseEvent.CLICK, removeSelectedFileFromCue);
			_fileref.addEventListener(Event.SELECT, selectHandler);
			_files.addEventListener(CollectionEvent.COLLECTION_CHANGE, popDataGrid);

			_progressbar.mode="manual";
			_progressbar.label="";

			_uploadbutton.enabled=false;
			_remselbutton.enabled=false;
			_remallbutton.enabled=false;


			_nameColumn=new AdvancedDataGridColumn;
			_sizeColumn=new AdvancedDataGridColumn;

			_nameColumn.dataField="name";
			_nameColumn.headerText="照片名称";

			_sizeColumn.dataField="size";
			_sizeColumn.headerText="照片大小";
			_sizeColumn.labelFunction=bytesToKilobytes as Function;
			_sizeColumn.width=150;

			_columns=new Array(_nameColumn, _sizeColumn);
			_datagrid.columns=_columns
			_datagrid.sortableColumns=false;
			_datagrid.dataProvider=_files;
			_datagrid.dragEnabled=true;
			_datagrid.dragMoveEnabled=true;
			_datagrid.dropEnabled=true;

			_uploadURL=new URLRequest;
			_uploadURL.url=_url;
			_uploadURL.method="POST";

			_uploadURL.data=_variables;
			_uploadURL.contentType="multipart/form-data";

		}

		private function browseFiles(event:Event):void
		{
			_fileref.browse(_filefilter);
		}

		private function uploadFiles(event:Event):void
		{
			if (event != null)
			{
				_fileNameArray.length=0;
			}
			if (_files.length > 0)
			{
				_file=FileReference(_files.getItemAt(0));
				_file.addEventListener(Event.OPEN, openHandler);
				_file.addEventListener(ProgressEvent.PROGRESS, progressHandler);
				_file.addEventListener(Event.COMPLETE, completeHandler);
				_file.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
				_file.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
				_file.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				_variables.fileFileName=_file.name;
				_variables.monitorId=_monitorId;
				_variables.msgTempId=_msgTempId;
				_variables.msgTempType=_msgTempType;
				_fileNameArray.push(_file.name);

				log.info(_variables.fileFileName + "/" + _variables.monitorId + "/" + _variables.msgTempId + "/" + _variables.msgTempType + "/" + _uploadURL.url);
				_file.upload(_uploadURL);
				setupCancelButton(true);
			}
		}

		private function removeSelectedFileFromCue(event:Event):void
		{
			if (_datagrid.selectedIndex >= 0)
			{
				_files.removeItemAt(_datagrid.selectedIndex);
			}
		}


		private function clearFileCue(event:Event):void
		{
			_files.removeAll();
		}

		private function cancelFileIO(event:Event):void
		{
			_file.cancel();
			setupCancelButton(false);
			checkCue();
		}

		private function bytesToKilobytes(data:Object, blank:Object):String
		{
			var kilobytes:String;
			kilobytes=String(Math.round(data.size / 1024)) + ' kb';
			return kilobytes
		}

		private function getByteCount():void
		{
			var i:int;
			_totalbytes=0;
			for (i=0; i < _files.length; i++)
			{
				_totalbytes+=_files[i].size;
			}
			_progressbar.label="总图片数: " + _files.length + " 总大小: " + Math.round(_totalbytes / 1024) + " kb"
		}

		private function checkFileSize(filesize:Number):Boolean
		{
			var r:Boolean=false;
			if (filesize > _maxFileSize)
			{
				r=false;
			}
			else if (filesize <= _maxFileSize)
			{
				r=true;
			}

			if (_maxFileSize == 0)
			{
				r=true;
			}

			return r;
		}

		private function resetProgressBar():void
		{
			_progressbar.label="";
			_progressbar.maximum=0;
			_progressbar.minimum=0;
		}

		private function resetForm():void
		{
			_uploadbutton.enabled=false;
			_uploadbutton.addEventListener(MouseEvent.CLICK, uploadFiles);
			_uploadbutton.label="开始上传";
			_progressbar.maximum=0;
			_totalbytes=0;
			_progressbar.label="";
			_remselbutton.enabled=false;
			_remallbutton.enabled=false;
			_browsebutton.enabled=true;
		}

		private function popDataGrid(event:CollectionEvent):void
		{
			getByteCount();
			checkCue();
		}

		private function checkCue():void
		{
			if (_files.length > 0)
			{
				_uploadbutton.enabled=true;
				_remselbutton.enabled=true;
				_remallbutton.enabled=true;
			}
			else
			{
				resetProgressBar();
				_uploadbutton.enabled=false;
			}
		}

		private function setupCancelButton(x:Boolean):void
		{
			if (x == true)
			{
				_uploadbutton.addEventListener(MouseEvent.CLICK, cancelFileIO);
				_uploadbutton.label="取消上传";
				_browsebutton.enabled=false;
				_remselbutton.enabled=false;
				_remallbutton.enabled=false;
			}
			else if (x == false)
			{
				_uploadbutton.removeEventListener(MouseEvent.CLICK, cancelFileIO);
				resetForm();
			}
		}

		private function selectHandler(event:Event):void
		{
			var i:int;
			var msg:String="";
			var dl:Array=[];
			for (i=0; i < event.currentTarget.fileList.length; i++)
			{
				if (checkFileSize(event.currentTarget.fileList[i].size))
				{
					_files.addItem(event.currentTarget.fileList[i]);
				}
				else
				{
					dl.push(event.currentTarget.fileList[i]);
				}
			}
			if (dl.length > 0)
			{
				for (i=0; i < dl.length; i++)
				{
					msg+=String(dl[i].name + " 大小太大. \n");
				}
				mx.controls.Alert.show(msg + "最大文件大小: " + Math.round(_maxFileSize / 1024) + " kb", "文件", 4, null).clipContent;
			}
		}

		private function openHandler(event:Event):void
		{
			_files;
		}

		private function progressHandler(event:ProgressEvent):void
		{
			_progressbar.setProgress(event.bytesLoaded, event.bytesTotal);
			_progressbar.label=Math.round(event.bytesLoaded / 1024) + " kb /" + Math.round(event.bytesTotal / 1024) + " kb (" + (_files.length - 1) + ")";
		}

		private function completeHandler(event:Event):void
		{
			_files.removeItemAt(0);
			if (_files.length > 0)
			{
				_totalbytes=0;
				uploadFiles(null);
			}
			else
			{
				setupCancelButton(false);
				_progressbar.label="上传完成";
				var uploadCompleted:Event=new Event(Event.COMPLETE);
				dispatchEvent(uploadCompleted);
			}
		}

		private function ioErrorHandler(event:IOErrorEvent):void
		{
			mx.controls.Alert.show(String(event), "ioError", 0);
		}

		private function securityErrorHandler(event:SecurityErrorEvent):void
		{
			mx.controls.Alert.show(String(event), "Security Error", 0);
		}

		private function cancelHandler(event:Event):void
		{
			trace('已取消上传');
		}

		private function httpStatusHandler(event:HTTPStatusEvent):void
		{
			if (event.status != 200)
			{
				mx.controls.Alert.show(String(event), "Error", 0);
			}
		}

		public function set url(url:String):void
		{
			_url=url;
			if (_uploadURL)
			{
				_uploadURL.url=url;
			}
		}

		public function set msgTempType(msgTempType:String):void
		{
			_msgTempType=msgTempType;
			if (_variables)
			{
				_variables.msgTempType=msgTempType;
			}
		}

		public function set monitorId(monitorId:String):void
		{

			_monitorId=monitorId;
			if (_variables)
			{
				_variables.monitorId=monitorId;
			}
		}

		public function set msgTempId(msgTempId:String):void
		{
			_msgTempId=msgTempId;
			if (_variables)
			{
				_variables.msgTempId=msgTempId;
			}
		}

		public function get fileNameArray():Array
		{
			return _fileNameArray;
		}
	}
}