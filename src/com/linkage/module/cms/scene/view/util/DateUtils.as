package com.linkage.module.cms.scene.view.util
{
	import mx.formatters.DateFormatter;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-6
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DateUtils
	{
		public static const df:DateFormatter = new DateFormatter();

		private static const defaultFormat:String = "YYYY-MM-DD JJ:NN:SS";



		/**
		 * 格式化
		 * @date 需要格式化的日期
		 * @pattern 需要格式化的样式
		 * return  返回指定样式格式化的日期
		 * */
		public static function parseDate(date:Date, pattern:String):String
		{
			df.formatString = pattern;
			return df.format(date);
		}

		/**
		 *
		 * @date 需要格式化的日期
		 * return  返回默认格式化格式的结果
		 * */
		public static function formatDate(date:Date):String
		{
			df.formatString = defaultFormat;
			return df.format(date);
		}

		/**
		 * 字符串转换日期
		 * @dateStr  格式字符串 YYYY-MM-DD JJ:NN:SS
		 * return 返回对应的日期
		 * */
		public static function stringToDate(dateStr:String):Date
		{
			if (dateStr)
			{
				if (dateStr.length == 10)
				{
					dateStr = dateStr.concat(" 00:00:00");
				}
				if (dateStr.length == 19)
					return DateFormatter.parseDateString(dateStr);
			}
			return null;
		}
	}
}