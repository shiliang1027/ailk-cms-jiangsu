package com.linkage.module.cms.utils
{
	import flash.geom.Point;

	/**
	 * 字符串工具类
	 * @author duangr
	 *
	 */
	public class StringUtils
	{
		/**
		 * 判断字符串是否为空串
		 * @param str
		 * @return
		 *
		 */
		public static function isEmpty(str:String):Boolean
		{
			return str == null || str.length == 0;
		}

		/**
		 * 获取字符串的字符个数
		 * @param str
		 * @return
		 *
		 */
		public static function getStrLen(str:String):int
		{
			if (str == null)
			{
				return 0;
			}
			var strlen:int = str.length;
			var len:int = 0;
			for (var i:int = 0; i < strlen; i++)
			{
				if (str.charCodeAt(i) > 256)
				{
					len += 2;
				}
				else
				{
					len++;
				}
			}
			return len;
		}

		/**
		 * 获取文本的宽度和高度的字符个数
		 * @param text
		 * @return
		 *
		 */
		public static function getTextWH(text:String):Array
		{
			var width:int = 0;
			var height:int = 0;
			if (text != null)
			{
				var arr:Array = text.split("\n");
				height = arr.length;
				for each (var str:String in arr)
				{
					width = Math.max(getStrLen(str), width);
				}
			}
			return [width, height];
		}

	}
}