package com.linkage.module.cms.utils
{

	import flash.net.URLVariables;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	/**
	 * HTTP 工具类

	 * @author duangr
	 *
	 */
	public class HttpUtil
	{

		/**
		 * HTTP请求方法
		 * @param sessionId 会话id(若不需要会话请传 null 或者 空字符串)
		 * @param url URL
		 * @param success 成功后的回调函数
		 * @param params 参数
		 * @param error 失败后的回调函数
		 * @param resultFormat 结果的格式(对应 HTTPService.RESULT_FORMAT_XX,默认为 RESULT_FORMAT_TEXT)
		 * @param method 发送请求的 HTTP 方法。允许的值有 GET、POST、HEAD、OPTIONS、PUT、TRACE 和 DELETE。将小写字母转换为大写字母。默认值为 GET
		 *
		 */
		public static function httpService(sessionId:String, url:String, success:Function, params:URLVariables = null, error:Function = null, resultFormat:String = "text", method:String = "GET"):void
		{
			if (resultFormat == null)
			{
				resultFormat = HTTPService.RESULT_FORMAT_TEXT;
			}
			if (method == null)
			{
				method = "GET";
			}
			var httpService:HTTPService = new HTTPService();
			httpService.url = url;
			if (sessionId != null && sessionId != "")
			{
				httpService.url += ";jsessionid=" + sessionId;
			}
			httpService.addEventListener(ResultEvent.RESULT, resultCallback);
			httpService.addEventListener(FaultEvent.FAULT, faultCallback);
			httpService.resultFormat = resultFormat;
			httpService.method = method;
			if (params == null)
			{
				params = new URLVariables();
			}
			params.refreshDate = new Date().getTime();

			httpService.send(params);

			function resultCallback(event:ResultEvent):void
			{
				try
				{
					success.call(null, event.result);
				}
				catch (e:Error)
				{
					trace("HttpUtil success callback Error:" + e.name, e);
					throw e;
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
					trace("HTTPService Error source:" + event.fault.faultCode + " nmessage:" + event.fault.faultString + " detail:" + event.fault.faultDetail);
					if (error != null)
					{
						error.call(null, event)
					}
				}
				catch (e:Error)
				{
					trace("HttpUtil fault callback Error:" + e.name, e);
					throw e;
				}
				finally
				{
					release();
				}
			}

			function release():void
			{
				httpService.removeEventListener(ResultEvent.RESULT, resultCallback);
				httpService.removeEventListener(FaultEvent.FAULT, faultCallback);
				httpService = null;
			}

		}

		/**
		 * 给http请求的参数加密(传输汉字需要加密)
		 * @param param
		 * @return
		 *
		 */
		public static function httpEncoding(param:String):String
		{
			return encodeURIComponent(param);
		}

		/**
		 * 给http请求的参数解密

		 * @param param
		 * @return
		 *
		 */
		public static function httpDecoding(param:String):String
		{
			return decodeURIComponent(param);
		}

	}
}