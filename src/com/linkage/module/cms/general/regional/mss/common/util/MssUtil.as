package com.linkage.module.cms.general.regional.mss.common.util
{

	/**
	 *信息发布util
	 * @author mengqiang
	 *
	 */
	public class MssUtil
	{
		//验证是否是数值
		public static function checkNum(value:String):Boolean
		{
			if (value == null || value == "")
			{
				return false;
			}
			var result:Boolean=true;
			var str:String="0123456789,";
			var len:int=value.length;
			for (var i:int; i < len; i++)
			{
				var ch:String=value.charAt(i);
				if (str.indexOf(ch) < 0)
				{
					result=false;
					break;
				}
			}
			return result;
		}

		//转换空字符
		public static function checkNullStr(str:String):String
		{
			return (str == null || str == "" || str == "undefined") ? "" : str;
		}
	}
}