package com.linkage.module.cms.general.common
{
	import flash.utils.Dictionary;

	import mx.logging.ILogger;
	import mx.logging.Log;

	public class ImageFactory
	{
		//日志
		public var log:ILogger = Log.getLogger("com.linkage.module.cms.general.regional.common.ImageFactory");

		[Embed(source="../img/cell/bts_0.png")]
		private static var bts_0:Class;

		[Embed(source="../img/cell/bts_0_2g.png")]
		private static var bts_0_2g:Class;

		[Embed(source="../img/cell/bts_0_2g_dang.png")]
		private static var bts_0_2g_dang:Class;

		[Embed(source="../img/cell/bts_0_2g_edu.png")]
		private static var bts_0_2g_edu:Class;

		[Embed(source="../img/cell/bts_0_2g_super.png")]
		private static var bts_0_2g_super:Class;

		[Embed(source="../img/cell/bts_0_2g_vip.png")]
		private static var bts_0_2g_vip:Class;

		[Embed(source="../img/cell/bts_0_2g_vvip.png")]
		private static var bts_0_2g_vvip:Class;

		[Embed(source="../img/cell/bts_0_3g.png")]
		private static var bts_0_3g:Class;

		[Embed(source="../img/cell/bts_0_3g_dang.png")]
		private static var bts_0_3g_dang:Class;

		[Embed(source="../img/cell/bts_0_3g_edu.png")]
		private static var bts_0_3g_edu:Class;

		[Embed(source="../img/cell/bts_0_3g_super.png")]
		private static var bts_0_3g_super:Class;

		[Embed(source="../img/cell/bts_0_3g_vip.png")]
		private static var bts_0_3g_vip:Class;

		[Embed(source="../img/cell/bts_0_3g_vvip.png")]
		private static var bts_0_3g_vvip:Class;

		[Embed(source="../img/cell/bts_1.png")]
		private static var bts_1:Class;

		[Embed(source="../img/cell/bts_1_2g.png")]
		private static var bts_1_2g:Class;

		[Embed(source="../img/cell/bts_1_2g_dang.png")]
		private static var bts_1_2g_dang:Class;

		[Embed(source="../img/cell/bts_1_2g_dang_dev.png")]
		private static var bts_1_2g_dang_dev:Class;

		[Embed(source="../img/cell/bts_1_2g_dang_power.png")]
		private static var bts_1_2g_dang_power:Class;

		[Embed(source="../img/cell/bts_1_2g_dang_power_dis.png")]
		private static var bts_1_2g_dang_power_dis:Class;

		[Embed(source="../img/cell/bts_1_2g_dang_trans.png")]
		private static var bts_1_2g_dang_trans:Class;

		[Embed(source="../img/cell/bts_1_2g_dang_trans_dis.png")]
		private static var bts_1_2g_dang_trans_dis:Class;

		[Embed(source="../img/cell/bts_1_2g_edu.png")]
		private static var bts_1_2g_edu:Class;

		[Embed(source="../img/cell/bts_1_2g_edu_dev.png")]
		private static var bts_1_2g_edu_dev:Class;

		[Embed(source="../img/cell/bts_1_2g_edu_dev_dis.png")]
		private static var bts_1_2g_edu_dev_dis:Class;

		[Embed(source="../img/cell/bts_1_2g_edu_power.png")]
		private static var bts_1_2g_edu_power:Class;

		[Embed(source="../img/cell/bts_1_2g_edu_trans.png")]
		private static var bts_1_2g_edu_trans:Class;

		[Embed(source="../img/cell/bts_1_2g_edu_trans_dis.png")]
		private static var bts_1_2g_edu_trans_dis:Class;

		[Embed(source="../img/cell/bts_1_2g_super.png")]
		private static var bts_1_2g_super:Class;

		[Embed(source="../img/cell/bts_1_2g_super_dev.png")]
		private static var bts_1_2g_super_dev:Class;

		[Embed(source="../img/cell/bts_1_2g_super_dev_dis.png")]
		private static var bts_1_2g_super_dev_dis:Class;

		[Embed(source="../img/cell/bts_1_2g_super_power.png")]
		private static var bts_1_2g_super_power:Class;

		[Embed(source="../img/cell/bts_1_2g_super_trans.png")]
		private static var bts_1_2g_super_trans:Class;

		[Embed(source="../img/cell/bts_1_2g_super_trans_dis.png")]
		private static var bts_1_2g_super_trans_dis:Class;

		[Embed(source="../img/cell/bts_1_2g_vip.png")]
		private static var bts_1_2g_vip:Class;

		[Embed(source="../img/cell/bts_1_2g_vip_dev.png")]
		private static var bts_1_2g_vip_dev:Class;

		[Embed(source="../img/cell/bts_1_2g_vip_dev_dis.png")]
		private static var bts_1_2g_vip_dev_dis:Class;

		[Embed(source="../img/cell/bts_1_2g_vip_power.png")]
		private static var bts_1_2g_vip_power:Class;

		[Embed(source="../img/cell/bts_1_2g_vip_trans.png")]
		private static var bts_1_2g_vip_trans:Class;

		[Embed(source="../img/cell/bts_1_2g_vip_trans_dis.png")]
		private static var bts_1_2g_vip_trans_dis:Class;

		[Embed(source="../img/cell/bts_1_2g_vvip.png")]
		private static var bts_1_2g_vvip:Class;

		[Embed(source="../img/cell/bts_1_3g.png")]
		private static var bts_1_3g:Class;

		[Embed(source="../img/cell/bts_1_3g_dang.png")]
		private static var bts_1_3g_dang:Class;

		[Embed(source="../img/cell/bts_1_3g_dang_dev.png")]
		private static var bts_1_3g_dang_dev:Class;

		[Embed(source="../img/cell/bts_1_3g_dang_dev_dis.png")]
		private static var bts_1_3g_dang_dev_dis:Class;

		[Embed(source="../img/cell/bts_1_3g_dang_power.png")]
		private static var bts_1_3g_dang_power:Class;

		[Embed(source="../img/cell/bts_1_3g_dang_trans.png")]
		private static var bts_1_3g_dang_trans:Class;

		[Embed(source="../img/cell/bts_1_3g_dang_trans_dis.png")]
		private static var bts_1_3g_dang_trans_dis:Class;

		[Embed(source="../img/cell/bts_1_3g_edu.png")]
		private static var bts_1_3g_edu:Class;

		[Embed(source="../img/cell/bts_1_3g_edu_dev.png")]
		private static var bts_1_3g_edu_dev:Class;

		[Embed(source="../img/cell/bts_1_3g_edu_dev_dis.png")]
		private static var bts_1_3g_edu_dev_dis:Class;

		[Embed(source="../img/cell/bts_1_3g_edu_power.png")]
		private static var bts_1_3g_edu_power:Class;

		[Embed(source="../img/cell/bts_1_3g_edu_trans.png")]
		private static var bts_1_3g_edu_trans:Class;

		[Embed(source="../img/cell/bts_1_3g_edu_trans_dis.png")]
		private static var bts_1_3g_edu_trans_dis:Class;

		[Embed(source="../img/cell/bts_1_3g_super.png")]
		private static var bts_1_3g_super:Class;

		[Embed(source="../img/cell/bts_1_3g_super_dev.png")]
		private static var bts_1_3g_super_dev:Class;

		[Embed(source="../img/cell/bts_1_3g_super_dev_dis.png")]
		private static var bts_1_3g_super_dev_dis:Class;

		[Embed(source="../img/cell/bts_1_3g_super_power.png")]
		private static var bts_1_3g_super_power:Class;

		[Embed(source="../img/cell/bts_1_3g_super_power_dis.png")]
		private static var bts_1_3g_super_power_dis:Class;

		[Embed(source="../img/cell/bts_1_3g_super_trans.png")]
		private static var bts_1_3g_super_trans:Class;

		[Embed(source="../img/cell/bts_1_3g_vip.png")]
		private static var bts_1_3g_vip:Class;

		[Embed(source="../img/cell/bts_1_3g_vip_dev.png")]
		private static var bts_1_3g_vip_dev:Class;

		[Embed(source="../img/cell/bts_1_3g_vip_dev_dis.png")]
		private static var bts_1_3g_vip_dev_dis:Class;

		[Embed(source="../img/cell/bts_1_3g_vip_power.png")]
		private static var bts_1_3g_vip_power:Class;

		[Embed(source="../img/cell/bts_1_3g_vip_trans.png")]
		private static var bts_1_3g_vip_trans:Class;

		[Embed(source="../img/cell/bts_1_3g_vip_trans_dis.png")]
		private static var bts_1_3g_vip_trans_dis:Class;

		[Embed(source="../img/cell/bts_1_3g_vvip.png")]
		private static var bts_1_3g_vvip:Class;

		[Embed(source="../img/cell/bts_1_dang.png")]
		private static var bts_1_dang:Class;

		[Embed(source="../img/cell/bts_1_edu.png")]
		private static var bts_1_edu:Class;

		[Embed(source="../img/cell/bts_1_super.png")]
		private static var bts_1_super:Class;

		[Embed(source="../img/cell/bts_1_vip.png")]
		private static var bts_1_vip:Class;

		[Embed(source="../img/cell/bts_2.png")]
		private static var bts_2:Class;

		[Embed(source="../img/cell/bts_2_2g.png")]
		private static var bts_2_2g:Class;

		[Embed(source="../img/cell/bts_2_2g_dang.png")]
		private static var bts_2_2g_dang:Class;

		[Embed(source="../img/cell/bts_2_2g_edu.png")]
		private static var bts_2_2g_edu:Class;

		[Embed(source="../img/cell/bts_2_2g_super.png")]
		private static var bts_2_2g_super:Class;

		[Embed(source="../img/cell/bts_2_2g_vip.png")]
		private static var bts_2_2g_vip:Class;

		[Embed(source="../img/cell/bts_2_2g_vvip.png")]
		private static var bts_2_2g_vvip:Class;

		[Embed(source="../img/cell/bts_2_3g.png")]
		private static var bts_2_3g:Class;

		[Embed(source="../img/cell/bts_2_3g_dang.png")]
		private static var bts_2_3g_dang:Class;

		[Embed(source="../img/cell/bts_2_3g_edu.png")]
		private static var bts_2_3g_edu:Class;

		[Embed(source="../img/cell/bts_2_3g_super.png")]
		private static var bts_2_3g_super:Class;

		[Embed(source="../img/cell/bts_2_3g_vip.png")]
		private static var bts_2_3g_vip:Class;

		[Embed(source="../img/cell/bts_2_3g_vvip.png")]
		private static var bts_2_3g_vvip:Class;

		[Embed(source="../img/cell/bts_3.png")]
		private static var bts_3:Class;

		[Embed(source="../img/cell/bts_3_2g.png")]
		private static var bts_3_2g:Class;

		[Embed(source="../img/cell/bts_3_2g_dang.png")]
		private static var bts_3_2g_dang:Class;

		[Embed(source="../img/cell/bts_3_2g_edu.png")]
		private static var bts_3_2g_edu:Class;

		[Embed(source="../img/cell/bts_3_2g_super.png")]
		private static var bts_3_2g_super:Class;

		[Embed(source="../img/cell/bts_3_2g_vip.png")]
		private static var bts_3_2g_vip:Class;

		[Embed(source="../img/cell/bts_3_2g_vvip.png")]
		private static var bts_3_2g_vvip:Class;

		[Embed(source="../img/cell/bts_3_3g.png")]
		private static var bts_3_3g:Class;

		[Embed(source="../img/cell/bts_3_3g_dang.png")]
		private static var bts_3_3g_dang:Class;

		[Embed(source="../img/cell/bts_3_3g_edu.png")]
		private static var bts_3_3g_edu:Class;

		[Embed(source="../img/cell/bts_3_3g_super.png")]
		private static var bts_3_3g_super:Class;

		[Embed(source="../img/cell/bts_3_3g_vip.png")]
		private static var bts_3_3g_vip:Class;

		[Embed(source="../img/cell/bts_3_3g_vvip.png")]
		private static var bts_3_3g_vvip:Class;

		[Embed(source="../img/cell/bts_4.png")]
		private static var bts_4:Class;

		[Embed(source="../img/cell/bts_4_2g.png")]
		private static var bts_4_2g:Class;

		[Embed(source="../img/cell/bts_4_2g_dang.png")]
		private static var bts_4_2g_dang:Class;

		[Embed(source="../img/cell/bts_4_2g_edu.png")]
		private static var bts_4_2g_edu:Class;

		[Embed(source="../img/cell/bts_4_2g_super.png")]
		private static var bts_4_2g_super:Class;

		[Embed(source="../img/cell/bts_4_2g_vip.png")]
		private static var bts_4_2g_vip:Class;

		[Embed(source="../img/cell/bts_4_2g_vvip.png")]
		private static var bts_4_2g_vvip:Class;

		[Embed(source="../img/cell/bts_4_3g.png")]
		private static var bts_4_3g:Class;

		[Embed(source="../img/cell/bts_4_3g_dang.png")]
		private static var bts_4_3g_dang:Class;

		[Embed(source="../img/cell/bts_4_3g_edu.png")]
		private static var bts_4_3g_edu:Class;

		[Embed(source="../img/cell/bts_4_3g_super.png")]
		private static var bts_4_3g_super:Class;

		[Embed(source="../img/cell/bts_4_3g_vip.png")]
		private static var bts_4_3g_vip:Class;

		[Embed(source="../img/cell/bts_4_3g_vvip.png")]
		private static var bts_4_3g_vvip:Class;

		[Embed(source="../img/cell/cell_0.png")]
		private static var cell_0:Class;

		[Embed(source="../img/cell/cell_0_2g.png")]
		private static var cell_0_2g:Class;

		[Embed(source="../img/cell/cell_0_2g_bad.png")]
		private static var cell_0_2g_bad:Class;

		[Embed(source="../img/cell/cell_0_2g_worst.png")]
		private static var cell_0_2g_worst:Class;

		[Embed(source="../img/cell/cell_0_3g.png")]
		private static var cell_0_3g:Class;

		[Embed(source="../img/cell/cell_0_3g_bad.png")]
		private static var cell_0_3g_bad:Class;

		[Embed(source="../img/cell/cell_0_3g_worst.png")]
		private static var cell_0_3g_worst:Class;

		[Embed(source="../img/cell/cell_1.png")]
		private static var cell_1:Class;

		[Embed(source="../img/cell/cell_1_2g.png")]
		private static var cell_1_2g:Class;

		[Embed(source="../img/cell/cell_1_2g_bad.png")]
		private static var cell_1_2g_bad:Class;

		[Embed(source="../img/cell/cell_1_2g_worst.png")]
		private static var cell_1_2g_worst:Class;

		[Embed(source="../img/cell/cell_1_3g.png")]
		private static var cell_1_3g:Class;

		[Embed(source="../img/cell/cell_1_3g_bad.png")]
		private static var cell_1_3g_bad:Class;

		[Embed(source="../img/cell/cell_1_3g_worst.png")]
		private static var cell_1_3g_worst:Class;

		[Embed(source="../img/cell/cell_1_bad.png")]
		private static var cell_1_bad:Class;

		[Embed(source="../img/cell/cell_1_worst.png")]
		private static var cell_1_worst:Class;

		[Embed(source="../img/cell/cell_2.png")]
		private static var cell_2:Class;

		[Embed(source="../img/cell/cell_2_2g.png")]
		private static var cell_2_2g:Class;

		[Embed(source="../img/cell/cell_2_2g_bad.png")]
		private static var cell_2_2g_bad:Class;

		[Embed(source="../img/cell/cell_2_2g_worst.png")]
		private static var cell_2_2g_worst:Class;

		[Embed(source="../img/cell/cell_2_3g.png")]
		private static var cell_2_3g:Class;

		[Embed(source="../img/cell/cell_2_3g_bad.png")]
		private static var cell_2_3g_bad:Class;

		[Embed(source="../img/cell/cell_2_3g_worst.png")]
		private static var cell_2_3g_worst:Class;

		[Embed(source="../img/cell/cell_3.png")]
		private static var cell_3:Class;

		[Embed(source="../img/cell/cell_3_2g.png")]
		private static var cell_3_2g:Class;

		[Embed(source="../img/cell/cell_3_2g_bad.png")]
		private static var cell_3_2g_bad:Class;

		[Embed(source="../img/cell/cell_3_2g_worst.png")]
		private static var cell_3_2g_worst:Class;

		[Embed(source="../img/cell/cell_3_3g.png")]
		private static var cell_3_3g:Class;

		[Embed(source="../img/cell/cell_3_3g_bad.png")]
		private static var cell_3_3g_bad:Class;

		[Embed(source="../img/cell/cell_3_3g_worst.png")]
		private static var cell_3_3g_worst:Class;

		[Embed(source="../img/cell/cell_4.png")]
		private static var cell_4:Class;

		[Embed(source="../img/cell/cell_4_2g.png")]
		private static var cell_4_2g:Class;

		[Embed(source="../img/cell/cell_4_2g_bad.png")]
		private static var cell_4_2g_bad:Class;

		[Embed(source="../img/cell/cell_4_2g_worst.png")]
		private static var cell_4_2g_worst:Class;

		[Embed(source="../img/cell/cell_4_3g.png")]
		private static var cell_4_3g:Class;

		[Embed(source="../img/cell/cell_4_3g_bad.png")]
		private static var cell_4_3g_bad:Class;

		[Embed(source="../img/cell/cell_4_3g_worst.png")]
		private static var cell_4_3g_worst:Class;

		[Embed(source="../img/cell/wlan_0.png")]
		private static var wlan_0:Class;

		[Embed(source="../img/cell/wlan_1.png")]
		private static var wlan_1:Class;

		[Embed(source="../img/cell/wlan_2.png")]
		private static var wlan_2:Class;

		[Embed(source="../img/cell/wlan_3.png")]
		private static var wlan_3:Class;

		[Embed(source="../img/cell/wlan_4.png")]
		private static var wlan_4:Class;

		[Embed(source="../img/cell/site_0.png")]
		private static var site_0:Class;

		[Embed(source="../img/cell/site_1.png")]
		private static var site_1:Class;

		[Embed(source="../img/cell/site_2.png")]
		private static var site_2:Class;

		[Embed(source="../img/cell/site_3.png")]
		private static var site_3:Class;

		[Embed(source="../img/cell/site_4.png")]
		private static var site_4:Class;

		[Embed(source="../img/cell/bsc.png")]
		private static var bsc:Class;

		[Embed(source="../img/cell/rnc.png")]
		private static var rnc:Class;

		[Embed(source="../img/cell/EUtranCell.png")]
		private static var eucell_0:Class;
		[Embed(source="../img/cell/EUtranCell_1.png")]
		private static var eucell_1:Class;
		[Embed(source="../img/cell/EUtranCell_2.png")]
		private static var eucell_2:Class;
		[Embed(source="../img/cell/EUtranCell_3.png")]
		private static var eucell_3:Class;
		[Embed(source="../img/cell/EUtranCell_4.png")]
		private static var eucell_4:Class;

		[Embed(source="../img/cell/eNodeB_0.png")]
		private static var eNodeB_0:Class;
		[Embed(source="../img/cell/eNodeB_1.png")]
		private static var eNodeB_1:Class;
		[Embed(source="../img/cell/eNodeB_2.png")]
		private static var eNodeB_2:Class;
		[Embed(source="../img/cell/eNodeB_3.png")]
		private static var eNodeB_3:Class;
		[Embed(source="../img/cell/eNodeB_4.png")]
		private static var eNodeB_4:Class;

		//图片映射
		private var imgMap:Dictionary = new Dictionary();

		public function ImageFactory()
		{
			imgMap["bts_0"] = bts_0;
			imgMap["bts_0_2g"] = bts_0_2g;
			imgMap["bts_0_2g_dang"] = bts_0_2g_dang;
			imgMap["bts_0_2g_edu"] = bts_0_2g_edu;
			imgMap["bts_0_2g_super"] = bts_0_2g_super;
			imgMap["bts_0_2g_vip"] = bts_0_2g_vip;
			imgMap["bts_0_2g_vvip"] = bts_0_2g_vvip;
			imgMap["bts_0_3g"] = bts_0_3g;
			imgMap["bts_0_3g_dang"] = bts_0_3g_dang;
			imgMap["bts_0_3g_edu"] = bts_0_3g_edu;
			imgMap["bts_0_3g_super"] = bts_0_3g_super;
			imgMap["bts_0_3g_vip"] = bts_0_3g_vip;
			imgMap["bts_0_3g_vvip"] = bts_0_3g_vvip;
			imgMap["bts_1"] = bts_1;
			imgMap["bts_1_2g"] = bts_1_2g;
			imgMap["bts_1_2g_dang"] = bts_1_2g_dang;
			imgMap["bts_1_2g_dang_dev"] = bts_1_2g_dang_dev;
			imgMap["bts_1_2g_dang_power"] = bts_1_2g_dang_power;
			imgMap["bts_1_2g_dang_power_dis"] = bts_1_2g_dang_power_dis;
			imgMap["bts_1_2g_dang_trans"] = bts_1_2g_dang_trans;
			imgMap["bts_1_2g_dang_trans_dis"] = bts_1_2g_dang_trans_dis;
			imgMap["bts_1_2g_edu"] = bts_1_2g_edu;
			imgMap["bts_1_2g_edu_dev"] = bts_1_2g_edu_dev;
			imgMap["bts_1_2g_edu_dev_dis"] = bts_1_2g_edu_dev_dis;
			imgMap["bts_1_2g_edu_power"] = bts_1_2g_edu_power;
			imgMap["bts_1_2g_edu_trans"] = bts_1_2g_edu_trans;
			imgMap["bts_1_2g_edu_trans_dis"] = bts_1_2g_edu_trans_dis;
			imgMap["bts_1_2g_super"] = bts_1_2g_super;
			imgMap["bts_1_2g_super_dev"] = bts_1_2g_super_dev;
			imgMap["bts_1_2g_super_dev_dis"] = bts_1_2g_super_dev_dis;
			imgMap["bts_1_2g_super_power"] = bts_1_2g_super_power;
			imgMap["bts_1_2g_super_trans"] = bts_1_2g_super_trans;
			imgMap["bts_1_2g_super_trans_dis"] = bts_1_2g_super_trans_dis;
			imgMap["bts_1_2g_vip"] = bts_1_2g_vip;
			imgMap["bts_1_2g_vip_dev"] = bts_1_2g_vip_dev;
			imgMap["bts_1_2g_vip_dev_dis"] = bts_1_2g_vip_dev_dis;
			imgMap["bts_1_2g_vip_power"] = bts_1_2g_vip_power;
			imgMap["bts_1_2g_vip_trans"] = bts_1_2g_vip_trans;
			imgMap["bts_1_2g_vip_trans_dis"] = bts_1_2g_vip_trans_dis;
			imgMap["bts_1_2g_vvip"] = bts_1_2g_vvip;
			imgMap["bts_1_3g"] = bts_1_3g;
			imgMap["bts_1_3g_dang"] = bts_1_3g_dang;
			imgMap["bts_1_3g_dang_dev"] = bts_1_3g_dang_dev;
			imgMap["bts_1_3g_dang_dev_dis"] = bts_1_3g_dang_dev_dis;
			imgMap["bts_1_3g_dang_power"] = bts_1_3g_dang_power;
			imgMap["bts_1_3g_dang_trans"] = bts_1_3g_dang_trans;
			imgMap["bts_1_3g_dang_trans_dis"] = bts_1_3g_dang_trans_dis;
			imgMap["bts_1_3g_edu"] = bts_1_3g_edu;
			imgMap["bts_1_3g_edu_dev"] = bts_1_3g_edu_dev;
			imgMap["bts_1_3g_edu_dev_dis"] = bts_1_3g_edu_dev_dis;
			imgMap["bts_1_3g_edu_power"] = bts_1_3g_edu_power;
			imgMap["bts_1_3g_edu_trans"] = bts_1_3g_edu_trans;
			imgMap["bts_1_3g_edu_trans_dis"] = bts_1_3g_edu_trans_dis;
			imgMap["bts_1_3g_super"] = bts_1_3g_super;
			imgMap["bts_1_3g_super_dev"] = bts_1_3g_super_dev;
			imgMap["bts_1_3g_super_dev_dis"] = bts_1_3g_super_dev_dis;
			imgMap["bts_1_3g_super_power"] = bts_1_3g_super_power;
			imgMap["bts_1_3g_super_power_dis"] = bts_1_3g_super_power_dis;
			imgMap["bts_1_3g_super_trans"] = bts_1_3g_super_trans;
			imgMap["bts_1_3g_vip"] = bts_1_3g_vip;
			imgMap["bts_1_3g_vip_dev"] = bts_1_3g_vip_dev;
			imgMap["bts_1_3g_vip_dev_dis"] = bts_1_3g_vip_dev_dis;
			imgMap["bts_1_3g_vip_power"] = bts_1_3g_vip_power;
			imgMap["bts_1_3g_vip_trans"] = bts_1_3g_vip_trans;
			imgMap["bts_1_3g_vip_trans_dis"] = bts_1_3g_vip_trans_dis;
			imgMap["bts_1_3g_vvip"] = bts_1_3g_vvip;
			imgMap["bts_1_dang"] = bts_1_dang;
			imgMap["bts_1_edu"] = bts_1_edu;
			imgMap["bts_1_super"] = bts_1_super;
			imgMap["bts_1_vip"] = bts_1_vip;
			imgMap["bts_2"] = bts_2;
			imgMap["bts_2_2g"] = bts_2_2g;
			imgMap["bts_2_2g_dang"] = bts_2_2g_dang;
			imgMap["bts_2_2g_edu"] = bts_2_2g_edu;
			imgMap["bts_2_2g_super"] = bts_2_2g_super;
			imgMap["bts_2_2g_vip"] = bts_2_2g_vip;
			imgMap["bts_2_2g_vvip"] = bts_2_2g_vvip;
			imgMap["bts_2_3g"] = bts_2_3g;
			imgMap["bts_2_3g_dang"] = bts_2_3g_dang;
			imgMap["bts_2_3g_edu"] = bts_2_3g_edu;
			imgMap["bts_2_3g_super"] = bts_2_3g_super;
			imgMap["bts_2_3g_vip"] = bts_2_3g_vip;
			imgMap["bts_2_3g_vvip"] = bts_2_3g_vvip;
			imgMap["bts_3"] = bts_3;
			imgMap["bts_3_2g"] = bts_3_2g;
			imgMap["bts_3_2g_dang"] = bts_3_2g_dang;
			imgMap["bts_3_2g_edu"] = bts_3_2g_edu;
			imgMap["bts_3_2g_super"] = bts_3_2g_super;
			imgMap["bts_3_2g_vip"] = bts_3_2g_vip;
			imgMap["bts_3_2g_vvip"] = bts_3_2g_vvip;
			imgMap["bts_3_3g"] = bts_3_3g;
			imgMap["bts_3_3g_dang"] = bts_3_3g_dang;
			imgMap["bts_3_3g_edu"] = bts_3_3g_edu;
			imgMap["bts_3_3g_super"] = bts_3_3g_super;
			imgMap["bts_3_3g_vip"] = bts_3_3g_vip;
			imgMap["bts_3_3g_vvip"] = bts_3_3g_vvip;
			imgMap["bts_4"] = bts_4;
			imgMap["bts_4_2g"] = bts_4_2g;
			imgMap["bts_4_2g_dang"] = bts_4_2g_dang;
			imgMap["bts_4_2g_edu"] = bts_4_2g_edu;
			imgMap["bts_4_2g_super"] = bts_4_2g_super;
			imgMap["bts_4_2g_vip"] = bts_4_2g_vip;
			imgMap["bts_4_2g_vvip"] = bts_4_2g_vvip;
			imgMap["bts_4_3g"] = bts_4_3g;
			imgMap["bts_4_3g_dang"] = bts_4_3g_dang;
			imgMap["bts_4_3g_edu"] = bts_4_3g_edu;
			imgMap["bts_4_3g_super"] = bts_4_3g_super;
			imgMap["bts_4_3g_vip"] = bts_4_3g_vip;
			imgMap["bts_4_3g_vvip"] = bts_4_3g_vvip;


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
			imgMap["cell_1_bad"] = cell_1_bad;
			imgMap["cell_1_worst"] = cell_1_worst;
			imgMap["cell_2"] = cell_2;
			imgMap["cell_2_2g"] = cell_2_2g;
			imgMap["cell_2_2g_bad"] = cell_2_2g_bad;
			imgMap["cell_2_2g_worst"] = cell_2_2g_worst;
			imgMap["cell_2_3g"] = cell_2_3g;
			imgMap["cell_2_3g_bad"] = cell_2_3g_bad;
			imgMap["cell_2_3g_worst"] = cell_2_3g_worst;
			imgMap["cell_3"] = cell_3;
			imgMap["cell_3_2g"] = cell_3_2g;
			imgMap["cell_3_2g_bad"] = cell_3_2g_bad;
			imgMap["cell_3_2g_worst"] = cell_3_2g_worst;
			imgMap["cell_3_3g"] = cell_3_3g;
			imgMap["cell_3_3g_bad"] = cell_3_3g_bad;
			imgMap["cell_3_3g_worst"] = cell_3_3g_worst;
			imgMap["cell_4"] = cell_4;
			imgMap["cell_4_2g"] = cell_4_2g;
			imgMap["cell_4_2g_bad"] = cell_4_2g_bad;
			imgMap["cell_4_2g_worst"] = cell_4_2g_worst;
			imgMap["cell_4_3g"] = cell_4_3g;
			imgMap["cell_4_3g_bad"] = cell_4_3g_bad;
			imgMap["cell_4_3g_worst"] = cell_4_3g_worst;

			imgMap["wlan_0"] = wlan_0;
			imgMap["wlan_1"] = wlan_1;
			imgMap["wlan_2"] = wlan_2;
			imgMap["wlan_3"] = wlan_3;
			imgMap["wlan_4"] = wlan_4;

			imgMap["site_0"] = site_0;
			imgMap["site_1"] = site_1;
			imgMap["site_2"] = site_2;
			imgMap["site_3"] = site_3;
			imgMap["site_4"] = site_4;

			imgMap["bsc_0"] = bsc;
			imgMap["rnc_0"] = rnc;

			imgMap["cell_0_39g"] = eucell_0;
			imgMap["cell_1_39g"] = eucell_1;
			imgMap["cell_2_39g"] = eucell_2;
			imgMap["cell_3_39g"] = eucell_3;
			imgMap["cell_4_39g"] = eucell_4;

			imgMap["bts_0_39g"] = eNodeB_0;
			imgMap["bts_1_39g"] = eNodeB_1;
			imgMap["bts_2_39g"] = eNodeB_2;
			imgMap["bts_3_39g"] = eNodeB_3;
			imgMap["bts_4_39g"] = eNodeB_4;
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
				return bts_0;
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

