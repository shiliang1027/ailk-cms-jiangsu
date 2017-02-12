package com.linkage.module.cms.utils.vectormap
{
	public class MapDictionary_XinJiang extends MapDictionary
	{
		public function MapDictionary_XinJiang(configBaseUrl:String)
		{
			super(configBaseUrl);
		}
		
		override protected function doInit():void{
			provinceName = "新疆";
			provinceId = "00";
			var VcetorArr:Array=[];
			var cityMapping:Array;
			var XML_URL:String;
			VcetorArr["0100_a"] = new wulumuqi_a();
			VcetorArr["0100_b"] = new wulumuqi_b();
			VcetorArr["0200_a"] = new hami_a();
			VcetorArr["0200_b"] = new hami_b();
			VcetorArr["0300_a"] = new kelamayi_a();
			VcetorArr["0300_b"] = new kelamayi_b();
			VcetorArr["0400_a"] = new shihezi_a();
			VcetorArr["0400_b"] = new shihezi_b();
			VcetorArr["0500_a"] = new changji_a();
			VcetorArr["0500_b"] = new changji_b();
			VcetorArr["0600_a"] = new bazhou_a();
			VcetorArr["0600_b"] = new bazhou_b();
			VcetorArr["0700_a"] = new tulufan_a();
			VcetorArr["0700_b"] = new tulufan_b();
			VcetorArr["0800_a"] = new akesu_a();
			VcetorArr["0800_b"] = new akesu_b();
			VcetorArr["0900_a"] = new kashi_a();
			VcetorArr["0900_b"] = new kashi_b();
			VcetorArr["1000_a"] = new bozhou_a();
			VcetorArr["1000_b"] = new bozhou_b();
			VcetorArr["1100_a"] = new kezhou_a();
			VcetorArr["1100_b"] = new kezhou_b();
			VcetorArr["1200_a"] = new yili_a();
			VcetorArr["1200_b"] = new yili_b();
			VcetorArr["1300_a"] = new kuitun_a();
			VcetorArr["1300_b"] = new kuitun_b();
			VcetorArr["1400_a"] = new aletai_a();
			VcetorArr["1400_b"] = new aletai_b();
			VcetorArr["1500_a"] = new tacheng_a();
			VcetorArr["1500_b"] = new tacheng_b();
			VcetorArr["1600_a"] = new hetian_a();
			VcetorArr["1600_b"] = new hetian_b();
			
			cityMapping = [];
			cityMapping["0100"] = "乌鲁木齐";
			cityMapping["0200"] = "哈密";
			cityMapping["0300"] = "克拉玛依";
			cityMapping["0400"] = "石河子";
			cityMapping["0500"] = "昌吉";
			cityMapping["0600"] = "巴州";
			cityMapping["0700"] = "吐鲁番";
			cityMapping["0800"] = "阿克苏";
			cityMapping["0900"] = "喀什";
			cityMapping["1000"] = "博州";
			cityMapping["1100"] = "克州";
			cityMapping["1200"] = "伊犁";
			cityMapping["1300"] = "奎屯";
			cityMapping["1400"] = "阿勒泰";
			cityMapping["1500"] = "塔城";
			cityMapping["1600"] = "和田";
			XML_URL = configBaseUrl+"map_xinjiang.xml";
			addMapBean(VcetorArr,cityMapping,XML_URL,provinceId);
			
			
			/****************阿克苏****************/
//			VcetorArr["000811_a"] = new bottomq();
//			VcetorArr["000801_a"] = new alaershi();
//			VcetorArr["000802_a"] = new kepingxian();
//			VcetorArr["000803_a"] = new baichengxian();
//			VcetorArr["000804_a"] = new awatixian();
//			VcetorArr["000805_a"] = new wushixian();
//			VcetorArr["000806_a"] = new xinhexian();
//			VcetorArr["000807_a"] = new kuchexian();
//			VcetorArr["000808_a"] = new wensuxian();
//			VcetorArr["000809_a"] = new shayaxian();
//			VcetorArr["000810_a"] = new akeshushi();
			
//			cityMapping = [];
//			cityMapping["000811"] = "";
//			cityMapping["000801"] = "阿拉尔市";
//			cityMapping["000802"] = "柯坪县";
//			cityMapping["000803"] = "拜城县";
//			cityMapping["000804"] = "阿瓦提县";
//			cityMapping["000805"] = "乌什县";
//			cityMapping["000806"] = "新和县";
//			cityMapping["000807"] = "库车县";
//			cityMapping["000808"] = "温宿县";
//			cityMapping["000809"] = "沙雅县";
//			cityMapping["000810"] = "阿克苏市";
//			XML_URL = configBaseUrl+"map_akesu.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"0800");
			
//			/****************阿勒泰****************/
//			VcetorArr["001401_a"] = new fuhaixian();
//			VcetorArr["001402_a"] = new jimunaixian();
//			VcetorArr["001403_a"] = new qinghexian();
//			VcetorArr["001404_a"] = new fuyunxian();
//			VcetorArr["001405_a"] = new buerjinxian();
//			VcetorArr["001406_a"] = new aletaishi();
//			VcetorArr["001407_a"] = new habahexian();
//			
//			cityMapping = [];
//			cityMapping["001401"] = "福海县";
//			cityMapping["001402"] = "吉木乃县";
//			cityMapping["001403"] = "青河县";
//			cityMapping["001404"] = "富蕴县";
//			cityMapping["001405"] = "布尔津县";
//			cityMapping["001406"] = "阿勒泰市";
//			cityMapping["001407"] = "哈巴河县";
//			XML_URL = configBaseUrl+"map_aletai.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"1400");
//			
//			/****************巴州****************/
//			VcetorArr["000601_a"] = new yanqixian();
//			VcetorArr["000602_a"] = new bohuxian();
//			VcetorArr["000603_a"] = new heshuoxian();
//			VcetorArr["000604_a"] = new hejingxian();
//			VcetorArr["000605_a"] = new qiemoxian();
//			VcetorArr["000606_a"] = new ruoqiangxian();
//			VcetorArr["000607_a"] = new weilixian();
//			VcetorArr["000608_a"] = new luntaixian();
//			VcetorArr["000609_a"] = new kuerleshi();
//			
//			cityMapping = [];
//			cityMapping["000601"] = "焉耆回族自治县";
//			cityMapping["000602"] = "博湖县";
//			cityMapping["000603"] = "和硕县";
//			cityMapping["000604"] = "和静县";
//			cityMapping["000605"] = "且末县";
//			cityMapping["000606"] = "若羌县";
//			cityMapping["000607"] = "尉犁县";
//			cityMapping["000608"] = "轮台县";
//			cityMapping["000609"] = "库尔勒市";
//			XML_URL = configBaseUrl+"map_bazhou.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"0600");
//			
//			/****************博州****************/
//			VcetorArr["001001_a"] = new boleshi();
//			VcetorArr["001002_a"] = new wenquanxian();
//			VcetorArr["001003_a"] = new jinghexian();
//			
//			cityMapping = [];
//			cityMapping["001001"] = "博乐市";
//			cityMapping["001002"] = "温泉县";
//			cityMapping["001003"] = "精河县";
//			XML_URL = configBaseUrl+"map_bozhou.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"1000");
//			
//			/****************昌吉****************/
//			VcetorArr["000501_a"] = new miquanshi();
//			VcetorArr["000502_a"] = new muleixian();
//			VcetorArr["000503_a"] = new jimusaer();
//			VcetorArr["000504_a"] = new qitaixian();
//			VcetorArr["000505_a"] = new manasixian();
//			VcetorArr["000506_a"] = new hutubixian();
//			VcetorArr["000507_a"] = new fukangshi();
//			VcetorArr["000508_a"] = new changjishi();
//			
//			cityMapping = [];
//			cityMapping["000501"] = "米泉县";
//			cityMapping["000502"] = "木垒哈萨克自治县";
//			cityMapping["000503"] = "吉木萨尔县";
//			cityMapping["000504"] = "奇台县";
//			cityMapping["000505"] = "玛纳斯县";
//			cityMapping["000506"] = "呼图壁县";
//			cityMapping["000507"] = "阜康市";
//			cityMapping["000508"] = "昌吉市";
//			XML_URL = configBaseUrl+"map_changji.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"0500");
//			
//			/****************哈密****************/
//			VcetorArr["000201_a"] = new yiwuxian();
//			VcetorArr["000202_a"] = new hamishi();
//			VcetorArr["000203_a"] = new balikunxian();
//			
//			cityMapping = [];
//			cityMapping["000201"] = "伊吾县";
//			cityMapping["000202"] = "哈密市";
//			cityMapping["000203"] = "巴里坤哈萨克自治县";
//			XML_URL = configBaseUrl+"map_hami.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"0200");
//			
//			/****************和田****************/
//			VcetorArr["001601_a"] = new minfengxian();
//			VcetorArr["001602_a"] = new celexian();
//			VcetorArr["001603_a"] = new pishanxian();
//			VcetorArr["001604_a"] = new moyuxian();
//			VcetorArr["001605_a"] = new luopuxian();
//			VcetorArr["001606_a"] = new hetianxian();
//			VcetorArr["001607_a"] = new yutianxian();
//			
//			cityMapping = [];
//			cityMapping["001601"] = "民丰县";
//			cityMapping["001602"] = "策勒县";
//			cityMapping["001603"] = "皮山县";
//			cityMapping["001604"] = "墨玉县";
//			cityMapping["001605"] = "洛浦县";
//			cityMapping["001606"] = "和田县";
//			cityMapping["001607"] = "和田市";
//			XML_URL = configBaseUrl+"map_hetian.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"1600");
//			
//			/****************喀什****************/
//			VcetorArr["000901_a"] = new shulexian();
//			VcetorArr["000902_a"] = new tashikuergan();
//			VcetorArr["000903_a"] = new bachuxian();
//			VcetorArr["000904_a"] = new jiashixian();
//			VcetorArr["000905_a"] = new yuepuhuxian();
//			VcetorArr["000906_a"] = new maigaitixian();
//			VcetorArr["000907_a"] = new yechengxian();
//			VcetorArr["000908_a"] = new shachexian();
//			VcetorArr["000909_a"] = new zepuxian();
//			VcetorArr["000910_a"] = new yingjishaxian();
//			VcetorArr["000911_a"] = new shufuxian();
//			VcetorArr["000912_a"] = new kashishi();
//			
//			cityMapping = [];
//			cityMapping["000901"] = "疏勒县";
//			cityMapping["000902"] = "塔什库尔干塔吉克自治县";
//			cityMapping["000903"] = "巴楚县";
//			cityMapping["000904"] = "伽师县";
//			cityMapping["000905"] = "岳普湖县";
//			cityMapping["000906"] = "麦盖提县";
//			cityMapping["000907"] = "叶城县";
//			cityMapping["000908"] = "莎车县";
//			cityMapping["000909"] = "泽普县";
//			cityMapping["000910"] = "英吉沙县";
//			cityMapping["000911"] = "疏附县";
//			cityMapping["000912"] = "喀什市";
//			XML_URL = configBaseUrl+"map_kashi.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"0900");
//			
//			/****************克拉玛依****************/
//			VcetorArr["000301_a"] = new gts();
//			VcetorArr["000302_a"] = new weh();
//			VcetorArr["000303_a"] = new bjt();
//			VcetorArr["000304_a"] = new klmys();
//			
//			cityMapping = [];
//			cityMapping["000301"] = "独山子区";
//			cityMapping["000302"] = "乌尔禾区";
//			cityMapping["000303"] = "白碱滩区";
//			cityMapping["000304"] = "克拉玛依市";
//			XML_URL = configBaseUrl+"map_kelamayi.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"0300");
//			
//			/****************克州****************/
//			VcetorArr["001101_a"] = new aketaoxian();
//			VcetorArr["001102_a"] = new wuqiaxian();
//			VcetorArr["001103_a"] = new aheqixian();
//			VcetorArr["001104_a"] = new atushishi();
//			
//			cityMapping = [];
//			cityMapping["001101"] = "阿克陶县";
//			cityMapping["001102"] = "乌恰县";
//			cityMapping["001103"] = "阿合奇县";
//			cityMapping["001104"] = "阿图什市";
//			XML_URL = configBaseUrl+"map_kezhou.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"1100");
//			
//			/****************石河子****************/
//			VcetorArr["000401_a"] = new shihezishi();
//			VcetorArr["000402_a"] = new shawanshi();
//			
//			cityMapping = [];
//			cityMapping["000401"] = "石河子市";
//			cityMapping["000402"] = "沙湾县";
//			XML_URL = configBaseUrl+"map_shihezi.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"0400");
//			
//			/****************塔城****************/
//			VcetorArr["001501_a"] = new hebukesaier();
//			VcetorArr["001502_a"] = new yuminxian();
//			VcetorArr["001503_a"] = new tuolixian();
//			VcetorArr["001504_a"] = new eminxian();
//			VcetorArr["001505_a"] = new wushushi();
//			VcetorArr["001506_a"] = new tachengshi();
//			
//			cityMapping = [];
//			cityMapping["001501"] = "和布克赛尔";
//			cityMapping["001502"] = "裕民县";
//			cityMapping["001503"] = "托里县";
//			cityMapping["001504"] = "额敏县";
//			cityMapping["001505"] = "乌苏市";
//			cityMapping["001506"] = "塔城市";
//			XML_URL = configBaseUrl+"map_tacheng.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"1500");
//			
//			/****************吐鲁番****************/
//			VcetorArr["000701_a"] = new tuoketuoxian();
//			VcetorArr["000702_a"] = new shanshanxian();
//			VcetorArr["000703_a"] = new tulufanshi();
//			
//			cityMapping = [];
//			cityMapping["000701"] = "托克托县";
//			cityMapping["000702"] = "鄯善县";
//			cityMapping["000703"] = "吐鲁番市";
//			XML_URL = configBaseUrl+"map_tulufan.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"0700");
//			
//			/****************乌鲁木齐****************/
//			VcetorArr["000102_a"] = new topk();
//			VcetorArr["000103_a"] = new dabancheng();
//			VcetorArr["000109_a"] = new wulumuqi();
//			VcetorArr["000110_a"] = new wulumuqixian();
//			VcetorArr["000101_a"] = new bottomk();
//			
//			cityMapping = [];
//			cityMapping["000102"] = "";
//			cityMapping["000103"] = "达坂城";
//			cityMapping["000109"] = "乌鲁木齐市";
//			cityMapping["000110"] = "乌鲁木齐县";
//			cityMapping["000101"] = "";
//			XML_URL = configBaseUrl+"map_wulumuqi.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"0100");
//			
//			/****************伊犁****************/
//			VcetorArr["001201_a"] = new chabuchaer();
//			VcetorArr["001202_a"] = new nilekexian();
//			VcetorArr["001203_a"] = new tekesixian();
//			VcetorArr["001204_a"] = new yiningxian();
//			VcetorArr["001205_a"] = new yiningshi();
//			VcetorArr["001206_a"] = new zhaoshuxian();
//			VcetorArr["001207_a"] = new xinyuanxian();
//			VcetorArr["001208_a"] = new gongliuxian();
//			VcetorArr["001209_a"] = new huochengxian();
//			
//			cityMapping = [];
//			cityMapping["001201"] = "察布查尔锡伯自治县";
//			cityMapping["001202"] = "尼勒克县";
//			cityMapping["001203"] = "特克斯县";
//			cityMapping["001204"] = "伊宁县";
//			cityMapping["001205"] = "伊宁市";
//			cityMapping["001206"] = "昭苏县";
//			cityMapping["001207"] = "新源县";
//			cityMapping["001208"] = "巩留县";
//			cityMapping["001209"] = "霍城县";
//			XML_URL = configBaseUrl+"map_yili.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"1200");
//			
//			
//			/****************奎屯****************/
////			VcetorArr["001301_a"] = new kuitun_a();
//			VcetorArr["001301_a"] = new kts();
//			
//			cityMapping = [];
//			cityMapping["001301"] = "奎屯市";
//			XML_URL = configBaseUrl+"map_kuitun.xml";
//			addMapBean(VcetorArr,VcetorArr,XML_URL,"1300");
			
		}
	}
}