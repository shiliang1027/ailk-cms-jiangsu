package com.linkage.module.cms.general.common
{
	import com.linkage.system.structure.map.IMap;
	import com.linkage.system.structure.map.Map;
	import com.linkage.system.utils.ImageUtil;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.IOErrorEvent;
	import flash.utils.setTimeout;
	
	import mx.controls.Image;
	import mx.logging.ILogger;
	import mx.logging.Log;

	/**
	 * 图标缓存器,凡是请求过的图标都会缓存,以供重复图标直接使用
	 * @author duangr
	 *
	 */
	public class ImageBuffer
	{
		// log
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.machroom.common.ImageBuffer");

		// 位图图像数据的缓存容器 (url -> bitmapData)
		private var _bitmapDataBuffer:IMap = new Map();
		// 正在加载中的图标名称容器(若存在正在加载中的图标,再次请求时请先等待,无需再次远程请求)
		private var _loadingUrlBuffer:IMap = new Map();

		// 单件实例
		private static var _instance:ImageBuffer = null;

		public function ImageBuffer(pvt:_PrivateClass)
		{
			if (pvt == null)
			{
				throw new ArgumentError("ImageBuffer构造时,参数[pvt:_PrivateClass]不能为null!");
			}
		}

		/**
		 * 获取单件实例
		 * @return
		 *
		 */
		public static function getInstance():ImageBuffer
		{
			if (_instance == null)
			{
				_instance = new ImageBuffer(new _PrivateClass());
			}
			return _instance;
		}

		/**
		 * 清理全部的URL缓存
		 *
		 */
		public function clearAllBuffer():void
		{
			_bitmapDataBuffer.clear();
		}

		/**
		 * 清理指定的URL缓存
		 * @param url
		 *
		 */
		public function clearBuffer(url:String):void
		{
			_bitmapDataBuffer.remove(url);
		}

		/**
		 * 装载远程图片,若装载过会先去缓存中取
		 * @param url 远程图片的url
		 * @param success  装载成功后回调方法<br/> 格式为:  function success(bitmapData:BitmapData, width:Number, height:Number):void{  ... }
		 * @param thisObject  用作函数的 this 的对象
		 *
		 */
		public function loadBitmapData(url:String, success:Function, thisObject:* = null):void
		{
			var cacheBitmapData:Object = _bitmapDataBuffer.get(url);
			if (cacheBitmapData == null)
			{
				if (_loadingUrlBuffer.get(url) != true)
				{
					// 首次加载
					_loadingUrlBuffer.put(url, true);
					ImageUtil.loadBitmapData(url, function(bitmapData:BitmapData, width:Number, height:Number):void
						{
							_bitmapDataBuffer.put(url, {data: bitmapData, width: width, height: height});
							_loadingUrlBuffer.remove(url);
							// 返回图片位图数据
							success.call(thisObject, bitmapData, width, height);
						}, function(event:IOErrorEvent):void
						{
							// 加载失败后使用默认的图标
							loadBitmapData(getUnknowUrl(url), function(bitmapData:BitmapData, width:Number, height:Number):void
								{
									_bitmapDataBuffer.put(url, {data: bitmapData, width: width, height: height});
									_loadingUrlBuffer.remove(url);

									success.call(thisObject, bitmapData, width, height);
								}, thisObject);
						}, thisObject);
				}
				else
				{
					// 正在加载中,请先稍候
					setTimeout(function():void
						{
							loadBitmapData(url, success, thisObject);
						}, 200);
					return;
				}
			}
			else
			{
				try
				{
					success.call(thisObject, cacheBitmapData.data, cacheBitmapData.width, cacheBitmapData.height);
				}
				catch (e:Error)
				{
					log.error("ImageBuffer.loadImage Success Callback Error:{0},\n StackTrace:{1}", e.name, e.getStackTrace());
					throw e;
				}
			}

		}
		
		/**
		 * 获取GIS图标名称
		 * 
		 * @param moType　网元类型，取值为bts\cell
		 * @param alarmLevel　告警等级，取值为1\2\3\4\0
		 * @param netType　网络类型，取值为2g/3g
		 * @param subType　子类型。如果是基站，取值为vip/vvip/super/edu/dang；如果是小区，取值为bad/worst
		 *           
		 * @return 图标对象
		 */
		public function getImageName(moType:String,alarmLevel:String,netType:String,subType:String):String
		{
			//网元类型必须有，否则返回默认
			if (moType == null || moType == "")
			{
				return "bts_0";
			}
			
			var key:String = moType;
			//加上告警等级
			if (alarmLevel != null && alarmLevel != "")
			{
				key = key + "_" + alarmLevel;
			}
			else
			{
				key = key + "_0";
			}
			//加上网络类型 2g/3g
			if (netType != null && netType != "")
			{
				key = key + "_" + netType;
			}
			//加上附加类型：VIP类型（基站）、劣化（小区）
			if (subType != null && subType != "")
			{
				key = key + "_" + subType;
			}
			
			return key;
		}
		
		/**
		 * 获取未知的图标url
		 * @param url
		 * @return
		 *
		 */
		private function getUnknowUrl(url:String):String
		{
			var index:int = url.lastIndexOf("/");
			return url.substring(0, index + 1) + "unknow.png";
		}
	}
}

class _PrivateClass
{
	public function _PrivateClass()
	{

	}
}