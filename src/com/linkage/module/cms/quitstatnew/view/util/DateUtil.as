package com.linkage.module.cms.quitstatnew.view.util
{
	import mx.formatters.DateFormatter;

	/**
	 * 
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-28
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DateUtil
	{
		public static const df:DateFormatter = new DateFormatter();
		df.formatString = "YYYY-MM-DD JJ:NN:SS";
		
		public static function formatDate(date:Date):String
		{
			return df.format(date);
		}
		
	}
}