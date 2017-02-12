package com.linkage.module.cms.perfmonitor.subject.common
{
	import flash.utils.Dictionary;

	import mx.logging.ILogger;
	import mx.logging.Log;

	public class ImageFactory
	{

		[Embed(source="../img/bts_0.png")]
		private static var bts_0:Class;

		[Embed(source="../img/bts_0_2g.png")]
		private static var bts_0_2g:Class;

		[Embed(source="../img/bts_0_3g.png")]
		private static var bts_0_3g:Class;

		[Embed(source="../img/bts_1.png")]
		private static var bts_1:Class;

		[Embed(source="../img/bts_1_2g.png")]
		private static var bts_1_2g:Class;

		[Embed(source="../img/bts_1_3g.png")]
		private static var bts_1_3g:Class;

		[Embed(source="../img/cell_0.png")]
		private static var cell_0:Class;

		[Embed(source="../img/cell_0_2g.png")]
		private static var cell_0_2g:Class;

		[Embed(source="../img/cell_0_2g_bad.png")]
		private static var cell_0_2g_bad:Class;

		[Embed(source="../img/cell_0_2g_worst.png")]
		private static var cell_0_2g_worst:Class;

		[Embed(source="../img/cell_0_3g.png")]
		private static var cell_0_3g:Class;

		[Embed(source="../img/cell_0_3g_bad.png")]
		private static var cell_0_3g_bad:Class;

		[Embed(source="../img/cell_0_3g_worst.png")]
		private static var cell_0_3g_worst:Class;

		[Embed(source="../img/cell_1.png")]
		private static var cell_1:Class;

		[Embed(source="../img/cell_1_2g.png")]
		private static var cell_1_2g:Class;

		[Embed(source="../img/cell_1_2g_bad.png")]
		private static var cell_1_2g_bad:Class;

		[Embed(source="../img/cell_1_2g_worst.png")]
		private static var cell_1_2g_worst:Class;

		[Embed(source="../img/cell_1_3g.png")]
		private static var cell_1_3g:Class;

		[Embed(source="../img/cell_1_3g_bad.png")]
		private static var cell_1_3g_bad:Class;

		[Embed(source="../img/cell_1_3g_worst.png")]
		private static var cell_1_3g_worst:Class;

		[Embed(source="../img/bts_2.png")]
		private static var bts_2:Class;

		[Embed(source="../img/bts_2_2g.png")]
		private static var bts_2_2g:Class;

		[Embed(source="../img/bts_2_3g.png")]
		private static var bts_2_3g:Class;

		[Embed(source="../img/bts_3.png")]
		private static var bts_3:Class;

		[Embed(source="../img/bts_3_2g.png")]
		private static var bts_3_2g:Class;

		[Embed(source="../img/bts_3_3g.png")]
		private static var bts_3_3g:Class;

		[Embed(source="../img/bts_4.png")]
		private static var bts_4:Class;

		[Embed(source="../img/bts_4_2g.png")]
		private static var bts_4_2g:Class;

		[Embed(source="../img/bts_4_3g.png")]
		private static var bts_4_3g:Class;

		[Embed(source="../img/cell_2.png")]
		private static var cell_2:Class;

		[Embed(source="../img/cell_2_2g.png")]
		private static var cell_2_2g:Class;

		[Embed(source="../img/cell_2_3g.png")]
		private static var cell_2_3g:Class;

		[Embed(source="../img/cell_3.png")]
		private static var cell_3:Class;

		[Embed(source="../img/cell_3_2g.png")]
		private static var cell_3_2g:Class;

		[Embed(source="../img/cell_3_3g.png")]
		private static var cell_3_3g:Class;

		[Embed(source="../img/cell_4.png")]
		private static var cell_4:Class;

		[Embed(source="../img/cell_4_2g.png")]
		private static var cell_4_2g:Class;

		[Embed(source="../img/cell_4_3g.png")]
		private static var cell_4_3g:Class;

		//图片映射
		private var imgMap:Dictionary = new Dictionary();

		public function ImageFactory()
		{
			imgMap["bts_0"] = bts_0;
			imgMap["bts_0_2g"] = bts_0_2g;
			imgMap["bts_0_3g"] = bts_0_3g;
			imgMap["bts_1"] = bts_1;
			imgMap["bts_1_2g"] = bts_1_2g;
			imgMap["bts_1_3g"] = bts_1_3g;
			imgMap["cell_0"] = cell_0;
			imgMap["cell_0_2g"] = cell_0_2g;
			imgMap["cell_0_2g_bad"] = cell_0_2g_bad;
			imgMap["cell_0_2g_worst"] = cell_0_2g_worst;
			imgMap["cell_0_3g"] = cell_0_3g;
			imgMap["cell_0_3g_bad"] = cell_0_3g_bad;
			imgMap["cell_0_3g_worst"] = cell_0_3g_worst;
			imgMap["cell_1"] = cell_1;
			imgMap["cell_1_2g"] = cell_1_2g;
			imgMap["cell_1_2g_bad"] = cell_1_2g_bad;
			imgMap["cell_1_2g_worst"] = cell_1_2g_worst;
			imgMap["cell_1_3g"] = cell_1_3g;
			imgMap["cell_1_3g_bad"] = cell_1_3g_bad;
			imgMap["cell_1_3g_worst"] = cell_1_3g_worst;
			imgMap["bts_2"] = bts_2;
			imgMap["bts_2_2g"] = bts_2_2g;
			imgMap["bts_2_3g"] = bts_2_3g;
			imgMap["bts_3"] = bts_3;
			imgMap["bts_3_2g"] = bts_3_2g;
			imgMap["bts_3_3g"] = bts_3_3g;
			imgMap["bts_4"] = bts_4;
			imgMap["bts_4_2g"] = bts_4_2g;
			imgMap["bts_4_3g"] = bts_4_3g;
			imgMap["cell_2"] = cell_2;
			imgMap["cell_2_2g"] = cell_2_2g;
			imgMap["cell_2_3g"] = cell_2_3g;
			imgMap["cell_3"] = cell_3;
			imgMap["cell_3_2g"] = cell_3_2g;
			imgMap["cell_3_3g"] = cell_3_3g;
			imgMap["cell_4"] = cell_4;
			imgMap["cell_4_2g"] = cell_4_2g;
			imgMap["cell_4_3g"] = cell_4_3g;
		}

		/**
		 * 获取GIS图标
		 *
		 * @param moType　网元类型，取值为bts\cell
		 * @param alarmLevel　告警等级，取值为1\2\3\4\0
		 * @param netType　网络类型，取值为2g/3g
		 * @param subType　子类型。如果是基站，取值为vip/vvip/super/edu/dang；如果是小区，取值为bad/worst
		 *
		 * @return 图标对象
		 */
		public function getImage(moType:String, alarmLevel:String, netType:String, subType:String):Class
		{
			//网元类型必须有，否则返回默认
			if(moType == null || moType == "")
			{
				return cell_0;
			}

			var key:String = moType;
			//加上告警等级
			if(alarmLevel != null && alarmLevel != "")
			{
				key = key + "_" + alarmLevel;
			}
			else
			{
				key = key + "_0";
			}
			//加上网络类型 2g/3g
			if(netType != null && netType != "")
			{
				key = key + "_" + netType;
			}
			//加上附加类型：VIP类型（基站）、劣化（小区）

			if(subType != null && subType != "")
			{
				key = key + "_" + subType;
			}

			//取图标

			if(imgMap[key] != null)
			{
				return imgMap[key];
			}
			else
			{
				//找不到则按网元类型返回默认图标
				if(moType == "bts")
				{
					return bts_0;
				}
				else
				{
					return cell_0;
				}
			}
		}
	}
}