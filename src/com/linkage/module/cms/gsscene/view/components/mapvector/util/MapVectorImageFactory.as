package com.linkage.module.cms.gsscene.view.components.mapvector.util
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import flash.utils.Dictionary;

	public class MapVectorImageFactory
	{
		//日志
		public static var log:ILogger = Log.getLoggerByClass(MapVectorImageFactory);
		
		[Embed(source="../../../../img/gsscene/red_1.png")]
		public static var red_1:Class;
		[Embed(source="../../../../img/gsscene/red_2.png")]
		public static var red_2:Class;
		[Embed(source="../../../../img/gsscene/blue_1.png")]
		public static var blue_1:Class;
		[Embed(source="../../../../img/gsscene/blue_2.png")]
		public static var blue_2:Class;
		[Embed(source="../../../../img/gsscene/org_1.png")]
		public static var org_1:Class;
		[Embed(source="../../../../img/gsscene/org_2.png")]
		public static var org_2:Class;
		[Embed(source="../../../../img/gsscene/yel_1.png")]
		public static var yel_1:Class;
		[Embed(source="../../../../img/gsscene/yel_2.png")]
		public static var yel_2:Class;
		[Embed(source="../../../../img/gsscene/green_1.png")]
		public static var green_1:Class;
		[Embed(source="../../../../img/gsscene/green_2.png")]
		public static var green_2:Class;
		[Embed(source="../../../../img/gsscene/sample_tip.png")]
		public static var sample_tip:Class;
		
		
		[Embed(source="../../../../img/gsscene/eq.png")]
		public static var eq:Class;
		[Embed(source="../../../../img/gsscene/perf.png")]
		public static var perf:Class;
		private static var imgMap:Dictionary;

		private static function init():void
		{
			imgMap = new Dictionary();
			imgMap['red_1'] = red_1;
			imgMap['red_2'] = red_2;
			imgMap['org_1'] = org_1;
			imgMap['org_2'] = org_2;
			imgMap['yel_1'] = yel_1;
			imgMap['yel_2'] = yel_2;
			imgMap['green_1'] = green_1;
			imgMap['green_2'] = green_2;
		}
	}
}

