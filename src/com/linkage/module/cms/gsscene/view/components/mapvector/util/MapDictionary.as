package com.linkage.module.cms.gsscene.view.components.mapvector.util
{
	import com.linkage.module.cms.gsscene.view.components.mapvector.util.MapBean;
	
	import flash.utils.Dictionary;
	
	public class MapDictionary
	{
		private static var mapDic:Dictionary;
		/**
		 * 
		 * 默认加载的矢量图，全省名称
		 * */
		private static var provinceName:String = "江苏";
		private static var provinceId:String = "00";
		
		public static function getInitMapVector():MapBean{
			init();
			var mapbean:MapBean = mapDic[provinceId] as MapBean;
			return mapbean;
		}
		public static function getMapVector(cityId:String):MapBean{
			init();
			var mapbean:MapBean = mapDic[cityId] as MapBean;
			return mapbean;
		}
		
		
		private static function init():void{
			if(null==mapDic){
				mapDic = new Dictionary();
				//南京
				//地图矢量图集合
				var VcetorArr:Array;
				//地区id和名称对应关系
				var cityMapping:Array;
				var XML_URL:String;
				
				VcetorArr= [];
				VcetorArr["0100_a"] = new nanjing_a();
				VcetorArr["0100_b"] = new nanjing_b();
				VcetorArr["0200_a"] = new suzhou_a();
				VcetorArr["0200_b"] = new suzhou_b();
				VcetorArr["0300_a"] = new wuxi_a();
				VcetorArr["0300_b"] = new wuxi_b();
				VcetorArr["0400_a"] = new changzhou_a();
				VcetorArr["0400_b"] = new changzhou_b();
				VcetorArr["0500_a"] = new zhenjiang_a();
				VcetorArr["0500_b"] = new zhenjiang_b();
				VcetorArr["0600_a"] = new yangzhou_a();
				VcetorArr["0600_b"] = new yangzhou_b();
				VcetorArr["0700_a"] = new nantong_a();
				VcetorArr["0700_b"] = new nantong_b();
				VcetorArr["0800_a"] = new taizhou_a();
				VcetorArr["0800_b"] = new taizhou_b();
				VcetorArr["0900_a"] = new xuzhou_a();
				VcetorArr["0900_b"] = new xuzhou_b();
				VcetorArr["1000_a"] = new huaian_a();
				VcetorArr["1000_b"] = new huaian_b();
				VcetorArr["1100_a"] = new yancheng_a();
				VcetorArr["1100_b"] = new yancheng_b();
				VcetorArr["1200_a"] = new lianyungang_a();
				VcetorArr["1200_b"] = new lianyungang_b();
				VcetorArr["1300_a"] = new suqian_a();
				VcetorArr["1300_b"] = new suqian_b();
				
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
				
				XML_URL = "xml/map_gs_jiangsu.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,MapDictionary.provinceId);
				
				/*-----------------南京------------------*/
				VcetorArr["0001_a"] = new nanjin();
				VcetorArr["000101_a"] = new jiangnin();
				VcetorArr["000102_a"] = new gaochun();
				VcetorArr["000103_a"] = new pukou();
				VcetorArr["000104_a"] = new liuhe();
				VcetorArr["000105_a"] = new lishu();
				
				cityMapping["0001"] = "市区";
				cityMapping["000101"] = "江宁";
				cityMapping["000102"] = "高淳";
				cityMapping["000103"] = "浦口";
				cityMapping["000104"] = "六合";
				cityMapping["000105"] = "溧水";
				
				XML_URL = "xml/jiangsu/map_nanjing.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"0100"); 
				
				/*-----苏州---------*/
				VcetorArr["0002_a"] = new shuzhou();
				VcetorArr["000201_a"] = new changshu();
				VcetorArr["000206_a"] = new zhangjiagang();
				VcetorArr["000203_a"] = new taichang();
				VcetorArr["000202_a"] = new kunshan();
				VcetorArr["000211_a"] = new wuzhong();
				VcetorArr["000204_a"] = new wujiang();
				
				cityMapping["0002"] = "市区";
				cityMapping["000201"] = "常熟";
				cityMapping["000206"] = "张家港";
				cityMapping["000203"] = "太仓";
				cityMapping["000202"] = "昆山";
				cityMapping["000211"] = "吴中";
				cityMapping["000204"] = "吴江中";
				
				XML_URL = "xml/jiangsu/map_suzhou.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"0200");
				
				/*-----无锡---------*/
				VcetorArr["0003_a"] = new wuxi();
				VcetorArr["000302_a"] = new yixin();
				VcetorArr["000304_a"] = new xishan();
				VcetorArr["000301_a"] = new jiangying();
				
				cityMapping["0003"] = "市区";
				cityMapping["000302"] = "宜兴";
				cityMapping["000304"] = "锡山";
				cityMapping["000301"] = "江阴";
				
				XML_URL = "xml/jiangsu/map_wuxi.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"0300");
				
				/*-----常州---------*/
				VcetorArr["0004_a"] = new changzhou();
				VcetorArr["000401_a"] = new jintan();
				VcetorArr["000402_a"] = new liyang();
				VcetorArr["000407_a"] = new wujin();
				
				cityMapping["0004"] = "市区";
				cityMapping["000401"] = "金坛";
				cityMapping["000402"] = "溧阳";
				cityMapping["000407"] = "武进";
				
				XML_URL = "xml/jiangsu/map_changzhou.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"0400");
				
				/*-----镇江---------*/
				VcetorArr["0005_a"] = new zhenjiang();
				VcetorArr["000503_a"] = new yangzhong();
				VcetorArr["000502_a"] = new jurong();
				VcetorArr["000501_a"] = new danyang();
				VcetorArr["000506_a"] = new dantu();
				
				cityMapping["0005"] = "市区";
				cityMapping["000503"] = "扬中";
				cityMapping["000502"] = "句容";
				cityMapping["000501"] = "丹阳";
				cityMapping["000506"] = "丹徒";
				
				XML_URL = "xml/jiangsu/map_zhenjiang.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"0500");
				
				/*-----扬州---------*/
				VcetorArr["0006_a"] = new yangzhou();
				VcetorArr["000605_a"] = new yizhen();
				VcetorArr["000607_a"] = new ganjiang();
				VcetorArr["000603_a"] = new jiangdu();
				VcetorArr["000602_a"] = new gaoyou();
				VcetorArr["000601_a"] = new baoying();
				
				cityMapping["0006"] = "市区";
				cityMapping["000605"] = "仪征";
				cityMapping["000607"] = "邗江";
				cityMapping["000603"] = "江都";
				cityMapping["000602"] = "高邮";
				cityMapping["000601"] = "宝应";
				
				XML_URL = "xml/jiangsu/map_yangzhou.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"0600");
				
				/*-----南通---------*/
				VcetorArr["0007_a"] = new nantong();
				VcetorArr["000701_a"] = new haian();
				VcetorArr["000705_a"] = new rubang();
				VcetorArr["000704_a"] = new rudong();
				VcetorArr["000706_a"] = new tongzhou();
				VcetorArr["000702_a"] = new haimen();
				VcetorArr["000703_a"] = new qidong();
				
				cityMapping["0007"] = "市区";
				cityMapping["000701"] = "海安";
				cityMapping["000705"] = "如皋";
				cityMapping["000704"] = "如东";
				cityMapping["000706"] = "通州";
				cityMapping["000702"] = "海门";
				cityMapping["000703"] = "启东";
				
				XML_URL = "xml/jiangsu/map_nantong.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"0700");
				
				/*-----泰州---------*/
				VcetorArr["0008_a"] = new taizhou();
				VcetorArr["000802_a"] = new jiangyan();
				VcetorArr["000801_a"] = new jingjiang();
				VcetorArr["000803_a"] = new taixin();
				VcetorArr["000804_a"] = new xinhua();
				
				cityMapping["0008"] = "市区";
				cityMapping["000802"] = "姜堰";
				cityMapping["000801"] = "靖江";
				cityMapping["000803"] = "泰兴";
				cityMapping["000804"] = "兴化";
				
				XML_URL = "xml/jiangsu/map_taizhou.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"0800");
				
				/*-----徐州---------*/
				VcetorArr["0009_a"] = new xuzhou();
				VcetorArr["000902_a"] = new peixian();
				VcetorArr["000901_a"] = new fengxian();
				VcetorArr["000906_a"] = new tongshan();
				VcetorArr["000903_a"] = new peizhou();
				VcetorArr["000904_a"] = new suining();
				VcetorArr["000905_a"] = new xinze();
				
				cityMapping["0009"] = "市区";
				cityMapping["000902"] = "沛县";
				cityMapping["000901"] = "丰县";
				cityMapping["000906"] = "铜山";
				cityMapping["000903"] = "邳州";
				cityMapping["000904"] = "睢宁";
				cityMapping["000905"] = "新沂";
				
				XML_URL = "xml/jiangsu/map_xuzhou.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"0900");
				
				/*-----淮安---------*/
				VcetorArr["0010_a"] = new huaian();
				VcetorArr["001005_a"] = new huaishui();
				VcetorArr["001003_a"] = new hongze();
				VcetorArr["001004_a"] = new jinhu();
				
				cityMapping["0010"] = "市区";
				cityMapping["001005"] = "涟水";
				cityMapping["001003"] = "洪泽";
				cityMapping["001004"] = "金湖";
				
				XML_URL = "xml/jiangsu/map_huaian.xml";
//				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"淮安");
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"1000");
				
				/*-----盐城---------*/
				VcetorArr["0011_a"] = new yanchen();
				VcetorArr["001107_a"] = new xiangshui();
				VcetorArr["001101_a"] = new binghai();
				VcetorArr["001104_a"] = new funing();
				VcetorArr["001106_a"] = new sheyang();
				VcetorArr["001105_a"] = new jianhu();
				VcetorArr["001108_a"] = new yandu();
				VcetorArr["001102_a"] = new dafeng();
				VcetorArr["001103_a"] = new dongtai();
				
				cityMapping["0011"] = "市区";
				cityMapping["001107"] = "响水";
				cityMapping["001101"] = "滨海";
				cityMapping["001104"] = "阜宁";
				cityMapping["001106"] = "射阳";
				cityMapping["001105"] = "建湖";
				cityMapping["001108"] = "盐都";
				cityMapping["001102"] = "大丰";
				cityMapping["001103"] = "东台";
				
				XML_URL = "xml/jiangsu/map_yancheng.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"1100");
				
				/*-----连云港---------*/
				VcetorArr["001201_a"] = new donghai();
				VcetorArr["001204_a"] = new ganyu();
				VcetorArr["001205_a"] = new guanyun();
				VcetorArr["001203_a"] = new guannan();
				
				cityMapping["001201"] = "东海";
				cityMapping["001204"] = "赣榆";
				cityMapping["001205"] = "灌云";
				cityMapping["001203"] = "灌南";
				
				XML_URL = "xml/jiangsu/map_lianyungang.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"1200");
				
				/*-----宿迁---------*/
				VcetorArr["0013_a"] = new suqian();
				VcetorArr["001302_a"] = new suyang();
				VcetorArr["001305_a"] = new suyu();
				VcetorArr["001303_a"] = new siyang();
				VcetorArr["001301_a"] = new sihong();
				
				cityMapping["0013"] = "市区";
				cityMapping["001302"] = "沭阳";
				cityMapping["001305"] = "宿豫";
				cityMapping["001303"] = "泗阳";
				cityMapping["001301"] = "泗洪";
				
				XML_URL = "xml/jiangsu/map_suqian.xml";
				MapDictionary.addMapBean(VcetorArr,cityMapping,XML_URL,"1300");
			}
		}
		private static function addMapBean(VcetorArr:Array,cityMapping:Array,XML_URL:String,cityName:String):void{
			var cityMapJar:MapBean = new MapBean();
			cityMapJar.VcetorArr= VcetorArr;
			cityMapJar.XML_URL = XML_URL;
			cityMapJar.cityMapping = cityMapping;
			mapDic[cityName] = cityMapJar;
		}
	}
}