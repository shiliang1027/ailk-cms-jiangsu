package com.linkage.module.cms.utils
{

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * BlazeDS工具类
	 * @author duangr
	 *
	 */
	public class BlazeDSUtil
	{

		
		private var log:ILogger = Log.getLoggerByClass(BlazeDSUtil);
		/**
		 * 构造新的Blazeds远程对象
		 *
		 * @param destination 远程目的服务名称
		 * @param source 远程服务路径
		 * @param endpoint 终端
		 * @param success 成功后回调方法,参数为:result:Object
		 * @param error 失败后回调方法,参数为:event:FaultEvent
		 * @return
		 *
		 */
		public static function newService(destination:String, source:String, endpoint:String, success:Function, error:Function = null):RemoteObject
		{
			var removeService:RemoteObject = new RemoteObject(destination);
			removeService.source = source;
			removeService.endpoint = endpoint;
			removeService.addEventListener(ResultEvent.RESULT, resultCallback);
			removeService.addEventListener(FaultEvent.FAULT, faultCallback);
			return removeService;


			function resultCallback(event:ResultEvent):void
			{
				log.info(event.result);
				try
				{
					success.call(null, event.result);
				}
				catch (e:Error)
				{
					log.error(e);
					trace("BlazeDSUtil success callback Error:" + e.name, e);
				}
				finally
				{
					release();
				}
			}

			function faultCallback(event:FaultEvent):void
			{
				try
				{
					trace("BlazeDSUtil Error \n  [SOURCE]  " + event.fault.faultCode + " \n  [MESSAGE] " + event.fault.faultString + " \n  [DETAIL]  " + event.fault.faultDetail);
					if (error != null)
					{
						error.call(null, event)
					}
				}
				catch (e:Error)
				{
					trace("BlazeDSUtil fault callback Error:" + e.name, e);
				}
				finally
				{
					release();
				}
			}

			function release():void
			{
				removeService.removeEventListener(ResultEvent.RESULT, resultCallback);
				removeService.removeEventListener(FaultEvent.FAULT, faultCallback);
				removeService = null;
			}
		}
	}
}