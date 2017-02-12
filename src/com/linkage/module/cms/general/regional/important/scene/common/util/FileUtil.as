package com.linkage.module.cms.general.regional.important.scene.common.util
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;

	public class FileUtil
	{
		public static function urlLoader(url:String, complete:Function, error:Function=null):void
		{
			//加载图片
			var imageLoader:Loader=new Loader();
			imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onloadComplete);
			imageLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, imgIOErrorHandler);
			imageLoader.load(new URLRequest(url));
			//完成加载图片处理
			function onloadComplete(event:Event):void
			{
				try
				{
					complete.call(null, event.target);
				}
				catch (e:Error)
				{
					trace("httpLoader complete callback Error:" + e.name, e);
					throw e;
				}
				finally
				{
					release();
				}
			}
			//加载图片出错处理
			function imgIOErrorHandler(event:IOErrorEvent):void
			{
				try
				{
					trace("httpLoader Error text:" + event.text);
					if (error != null)
					{
						error.call(null, event)
					}
				}
				catch (e:Error)
				{
					trace("httpLoader fault callback Error:" + e.name, e);
					throw e;
				}
				finally
				{
					release();
				}
			}
			//释放资源
			function release():void
			{
				imageLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onloadComplete);
				imageLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, imgIOErrorHandler);
				imageLoader=null;
			}
		}
	}
}