package com.linkage.module.cms.roamtopic.utils
{
	import com.linkage.module.cms.gsscene.view.components.mapvector.util.XinJiangMapDictionary;
	
	import flash.utils.Dictionary;

	public class JiangSuVectorMapFactory extends VectorMapFactory
	{
		public function JiangSuVectorMapFactory(factoryId:String)
		{
			super(factoryId);
			mapDic = new Dictionary;
			
			//地图矢量图集合
			var VcetorArr:Array;
			//地区id和名称对应关系
			var cityMapping:Array;
			var XML_URL:String;
			VcetorArr= [];
			VcetorArr["0100_a"] = new nanjin();
			VcetorArr["0200_a"] = new suzhou();
			VcetorArr["0300_a"] = new wuxi();
			VcetorArr["0400_a"] = new changzhou();
			VcetorArr["0500_a"] = new zhenjiang();
			VcetorArr["0600_a"] = new yangzhou();
			VcetorArr["0700_a"] = new nantong();
			VcetorArr["0800_a"] = new taizhou();
			VcetorArr["0900_a"] = new xuzhou();
			VcetorArr["1000_a"] = new huaian();
			VcetorArr["1100_a"] = new yanchen();
			VcetorArr["1200_a"] = new lianyungang();
			VcetorArr["1300_a"] = new shuqian();
			
			cityMapping = [];
			cityMapping["0100"] = "南京";
			cityMapping["0200"] = "苏州";
			cityMapping["0300"] = "无锡";
			cityMapping["0400"] = "常州";
			cityMapping["0500"] = "镇江";
			cityMapping["0600"] = "扬州";
			cityMapping["0700"] = "南通";
			cityMapping["0800"] = "泰州";
			cityMapping["0900"] = "徐州";
			cityMapping["1000"] = "淮安";
			cityMapping["1100"] = "盐城";
			cityMapping["1200"] = "连云港";
			cityMapping["1300"] = "宿迁";
			
			XML_URL = "xml/map_jiangsu_roam.xml";
			addMapBean(VcetorArr,cityMapping,XML_URL,"10");
			
//			/****************新疆****************/
//			VcetorArr["0100_a"] = new wulumuq();
//			VcetorArr["0200_a"] = new hami();
//			VcetorArr["0300_a"] = new kelamayi();
//			VcetorArr["0400_a"] = new shihezi();
//			VcetorArr["0500_a"] = new changji();
//			VcetorArr["0600_a"] = new bazhou();
//			VcetorArr["0700_a"] = new tulufan();
//			VcetorArr["0800_a"] = new akesu();
//			VcetorArr["0900_a"] = new hashi();
//			VcetorArr["1000_a"] = new bozhou();
//			VcetorArr["1100_a"] = new kezhou();
//			VcetorArr["1200_a"] = new yili();
//			VcetorArr["1300_a"] = new kuitun_q();//缺少，需补齐
//			VcetorArr["1400_a"] = new aletai();
//			VcetorArr["1500_a"] = new tachen();
//			VcetorArr["1600_a"] = new hetian();
//			
//			cityMapping = [];
//			cityMapping["0100"] = "乌鲁木齐";
//			cityMapping["0200"] = "哈密";
//			cityMapping["0300"] = "克拉玛依";
//			cityMapping["0400"] = "石河子";
//			cityMapping["0500"] = "昌吉";
//			cityMapping["0600"] = "巴州";
//			cityMapping["0700"] = "吐鲁番";
//			cityMapping["0800"] = "阿克苏";
//			cityMapping["0900"] = "喀什";
//			cityMapping["1000"] = "博州";
//			cityMapping["1100"] = "克州";
//			cityMapping["1200"] = "伊犁";
//			cityMapping["1300"] = "奎屯";
//			cityMapping["1400"] = "阿勒泰";
//			cityMapping["1500"] = "塔城";
//			cityMapping["1600"] = "和田";
//			XML_URL = "xml/map_xinjiang_roam.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"31");
			
			/**中国地图**/
			/*VcetorArr= [];
			VcetorArr["00_b"] = new zhongguo_b();
			VcetorArr["08_a"] = new heilongjiang();
			VcetorArr["05_a"] = new neimenggu();
			VcetorArr["07_a"] = new jilin();
			VcetorArr["06_a"] = new liaolin();
			VcetorArr["03_a"] = new hebei();
			VcetorArr["02_a"] = new tianjin_q();
			VcetorArr["01_a"] = new beijin_q();
			VcetorArr["15_a"] = new shandong_q();
			VcetorArr["04_a"] = new shanxi();
			VcetorArr["16_a"] = new henan();
			VcetorArr["12_a"] = new anhui();
			VcetorArr["10_a"] = new jiangsu();
			VcetorArr["11_a"] = new zhejiang_q();
			VcetorArr["09_a"] = new shanghai();
			VcetorArr["13_a"] = new fujian();
			VcetorArr["14_a"] = new jiangxi();
			VcetorArr["17_a"] = new hubei();
			VcetorArr["18_a"] = new hunan();
			VcetorArr["23_a"] = new chongqin();
			VcetorArr["22_a"] = new sichuan();//
			VcetorArr["28_a"] = new gansu_q();
			VcetorArr["29_a"] = new qinhai();
			VcetorArr["26_a"] = new xizhang();
			VcetorArr["31_a"] = new xinjiang();
			VcetorArr["30_a"] = new ningxia();
			VcetorArr["25_a"] = new yunnan();
			VcetorArr["24_a"] = new guizhou();
			VcetorArr["20_a"] = new guangxi();
			VcetorArr["19_a"] = new guangdong();
			VcetorArr["21_a"] = new hainan();
			VcetorArr["27_a"] = new shanxi2();*/
			VcetorArr= [];
			VcetorArr["00_b"] = new zhongguo();
			VcetorArr["08_a"] = new heilongjiang();
			VcetorArr["05_a"] = new neimenggu();
			VcetorArr["07_a"] = new jilin();
			VcetorArr["06_a"] = new liaoning();
			VcetorArr["03_a"] = new hebei();
			VcetorArr["02_a"] = new tianjin();
			VcetorArr["01_a"] = new beijing();
			VcetorArr["15_a"] = new shandong();
			VcetorArr["04_a"] = new shanxi();
			VcetorArr["16_a"] = new henan();
			VcetorArr["12_a"] = new anhui();
			VcetorArr["10_a"] = new jiangsu();
			VcetorArr["11_a"] = new zhejiang();
			VcetorArr["09_a"] = new shanghai();
			VcetorArr["13_a"] = new fujian();
			VcetorArr["14_a"] = new jiangxi();
			VcetorArr["17_a"] = new hubei();
			VcetorArr["18_a"] = new hunan();
			VcetorArr["23_a"] = new chongqing();
			VcetorArr["22_a"] = new sichuan();//
			VcetorArr["28_a"] = new gansu();
			VcetorArr["29_a"] = new qinghai();
			VcetorArr["26_a"] = new xizang();
			VcetorArr["31_a"] = new xinjiang();
			VcetorArr["30_a"] = new ningxia();
			VcetorArr["25_a"] = new yunnan();
			VcetorArr["24_a"] = new guizhou();
			VcetorArr["20_a"] = new guangxi();
			VcetorArr["19_a"] = new guangdong();
			VcetorArr["21_a"] = new hainan();
			VcetorArr["27_a"] = new shanxi2();
			VcetorArr["40_a"] = new taiwan();
			
			cityMapping = [];
			cityMapping["00"] = "中国";
			cityMapping["08"] = "黑龙江";
			cityMapping["05"] = "内蒙古";
			cityMapping["07"] = "吉林";
			cityMapping["06"] = "辽宁";
			cityMapping["03"] = "河北";
			cityMapping["02"] = "天津";
			cityMapping["01"] = "北京";
			cityMapping["15"] = "山东";
			cityMapping["04"] = "山西";
			cityMapping["16"] = "河南";
			cityMapping["12"] = "安徽";
			cityMapping["10"] = "江苏";
			cityMapping["11"] = "浙江";
			cityMapping["09"] = "上海";
			cityMapping["13"] = "福建";
			cityMapping["14"] = "江西";
			cityMapping["17"] = "湖北";
			cityMapping["18"] = "湖南";
			cityMapping["23"] = "重庆";
			cityMapping["22"] = "四川";
			cityMapping["28"] = "甘肃";
			cityMapping["29"] = "青海";
			cityMapping["26"] = "西藏";
			cityMapping["31"] = "新疆";
			cityMapping["30"] = "宁夏";
			cityMapping["25"] = "云南";
			cityMapping["24"] = "贵州";
			cityMapping["20"] = "广西";
			cityMapping["19"] = "广东";
			cityMapping["21"] = "海南";
			cityMapping["27"] = "陕西";
			cityMapping["40"] = "台湾";
			XML_URL = "xml/map_china_roam.xml";
			addMapBean(VcetorArr,cityMapping,XML_URL,"0");
		}
	}
}