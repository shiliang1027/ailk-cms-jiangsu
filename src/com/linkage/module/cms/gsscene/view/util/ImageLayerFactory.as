package com.linkage.module.cms.gsscene.view.util
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	public class ImageLayerFactory
	{//小图标 20*20
		//日志
		public static var log:ILogger = Log.getLoggerByClass(ImageLayerFactory);

		[Embed(source="../../img/smallMo/BTS_0.png")]
		private static var BTS_0:Class;
		[Embed(source="../../img/smallMo/BTS_1.png")]
		private static var BTS_1:Class;
		[Embed(source="../../img/smallMo/BTS_2.png")]
		private static var BTS_2:Class;
		[Embed(source="../../img/smallMo/BTS_3.png")]
		private static var BTS_3:Class;
		[Embed(source="../../img/smallMo/BTS_4.png")]
		private static var BTS_4:Class;

		[Embed(source="../../img/smallMo/NodeB_0.png")]
		private static var NodeB_0:Class;
		[Embed(source="../../img/smallMo/NodeB_1.png")]
		private static var NodeB_1:Class;
		[Embed(source="../../img/smallMo/NodeB_2.png")]
		private static var NodeB_2:Class;
		[Embed(source="../../img/smallMo/NodeB_3.png")]
		private static var NodeB_3:Class;
		[Embed(source="../../img/smallMo/NodeB_4.png")]
		private static var NodeB_4:Class;

		[Embed(source="../../img/smallMo/eNodeB_0.png")]
		private static var eNodeB_0:Class;
		[Embed(source="../../img/smallMo/eNodeB_1.png")]
		private static var eNodeB_1:Class;
		[Embed(source="../../img/smallMo/eNodeB_2.png")]
		private static var eNodeB_2:Class;
		[Embed(source="../../img/smallMo/eNodeB_3.png")]
		private static var eNodeB_3:Class;
		[Embed(source="../../img/smallMo/eNodeB_4.png")]
		private static var eNodeB_4:Class;

		private static var imgMap:Object;

		private static function init():void
		{
			imgMap = {};

			imgMap['BTS_0'] = BTS_0;
			imgMap['BTS_5'] = BTS_0;
			imgMap['BTS_1'] = BTS_1;
			imgMap['BTS_2'] = BTS_2;
			imgMap['BTS_3'] = BTS_3;
			imgMap['BTS_4'] = BTS_4;

			imgMap['NodeB_0'] = NodeB_0;
			imgMap['NodeB_5'] = NodeB_0;
			imgMap['NodeB_1'] = NodeB_1;
			imgMap['NodeB_2'] = NodeB_2;
			imgMap['NodeB_3'] = NodeB_3;
			imgMap['NodeB_4'] = NodeB_4;

			imgMap['eNodeB_0'] = eNodeB_0;
			imgMap['eNodeB_5'] = eNodeB_0;
			imgMap['eNodeB_1'] = eNodeB_1;
			imgMap['eNodeB_2'] = eNodeB_2;
			imgMap['eNodeB_3'] = eNodeB_3;
			imgMap['eNodeB_4'] = eNodeB_4;
		}

		/**
		 * 获取GIS图标
		 *
		 * @param moTypeName　网元类型，取值为BTS\CELL等
		 * @param alarmLevel　告警等级，取值为1\2\3\4\0
		 * @return 图标对象
		 */
		public static function getImage(moTypeName:String, alarmLevel:String = null):Class
		{
			if (imgMap == null)
				init();
			if (moTypeName == "wtstyc" || moTypeName == "olympic")
				log.error(moTypeName + '_' + alarmLevel);
			if (alarmLevel != null && "null" != alarmLevel && "" != alarmLevel)
				return imgMap[moTypeName + '_' + alarmLevel];
			else
				return imgMap[moTypeName + "_0"];
		}
	}
}

