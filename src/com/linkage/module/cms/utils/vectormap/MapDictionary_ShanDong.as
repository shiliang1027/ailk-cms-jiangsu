package com.linkage.module.cms.utils.vectormap
{
	public class MapDictionary_ShanDong extends MapDictionary
	{
		public function MapDictionary_ShanDong(configBaseUrl:String)
		{
			super(configBaseUrl);
		}
		
		override protected function doInit():void{
//			provinceName = "山东";
//			provinceId = "00";
//			var VcetorArr:Array=[];
//			var cityMapping:Array;
//			var XML_URL:String;
//			VcetorArr["01_a"] = new shandong_jinan_a();
//			VcetorArr["01_b"] = new shandong_jinan_b();
//			VcetorArr["02_a"] = new shandong_qindao_a();
//			VcetorArr["02_b"] = new shandong_qindao_b();
//			VcetorArr["03_a"] = new shandong_yantai_a();
//			VcetorArr["03_b"] = new shandong_yantai_b();
//			VcetorArr["04_a"] = new shandong_duifang_a();
//			VcetorArr["04_b"] = new shandong_duifang_b();
//			VcetorArr["05_a"] = new shandong_zibo_a();
//			VcetorArr["05_b"] = new shandong_zibo_b();
//			VcetorArr["06_a"] = new shandong_weihai_a();
//			VcetorArr["06_b"] = new shandong_weihai_b();
//			VcetorArr["07_a"] = new shandong_jining_a();
//			VcetorArr["07_b"] = new shandong_jining_b();
//			VcetorArr["08_a"] = new shandong_taian_a();
//			VcetorArr["08_b"] = new shandong_taian_b();
//			VcetorArr["09_a"] = new shandong_dezhou_a();
//			VcetorArr["09_b"] = new shandong_dezhou_b();
//			VcetorArr["10_a"] = new shandong_linze_a();
//			VcetorArr["10_b"] = new shandong_linze_b();
//			VcetorArr["11_a"] = new shandong_zaozhuang_a();
//			VcetorArr["11_b"] = new shandong_zaozhuang_b();
//			VcetorArr["12_a"] = new shandong_heze_a();
//			VcetorArr["12_b"] = new shandong_heze_b();
//			VcetorArr["13_a"] = new shandong_liaochen_a();
//			VcetorArr["13_b"] = new shandong_liaochen_b();
//			VcetorArr["14_a"] = new shandong_binzhou_a();
//			VcetorArr["14_b"] = new shandong_binzhou_b();
//			VcetorArr["15_a"] = new shandong_dongyin_a();
//			VcetorArr["15_b"] = new shandong_dongyin_b();
//			VcetorArr["16_a"] = new shandong_rizhao_a();
//			VcetorArr["16_b"] = new shandong_rizhao_b();
//			VcetorArr["17_a"] = new shandong_laiwu_a();
//			VcetorArr["17_b"] = new shandong_laiwu_b();
//			
//			cityMapping = [];
//			cityMapping["01"] = "济南";
//			cityMapping["02"] = "青岛";
//			cityMapping["03"] = "烟台";
//			cityMapping["04"] = "潍坊";
//			cityMapping["05"] = "淄博";
//			cityMapping["06"] = "威海";
//			cityMapping["07"] = "济宁";
//			cityMapping["08"] = "泰安";
//			cityMapping["09"] = "德州";
//			cityMapping["10"] = "临沂";
//			cityMapping["11"] = "枣庄";
//			cityMapping["12"] = "菏泽";
//			cityMapping["13"] = "聊城";
//			cityMapping["14"] = "滨州";
//			cityMapping["15"] = "东营";
//			cityMapping["16"] = "日照";
//			cityMapping["17"] = "莱芜";
//			XML_URL = configBaseUrl+"map_shandong.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,provinceId);
//			/*-----------------济南------------------*/
//			VcetorArr["0100_a"] = new jinan_b();
//			VcetorArr["010001_a"] = new zhangqiu();
//			VcetorArr["010002_a"] = new lixia();
//			VcetorArr["010003_a"] = new shizhong();
//			VcetorArr["010004_a"] = new kuiyin();
//			VcetorArr["010005_a"] = new tianqiao();
//			VcetorArr["010006_a"] = new lichen();
//			VcetorArr["010007_a"] = new changqin();
//			VcetorArr["010008_a"] = new gaoxinqu();
//			VcetorArr["010009_a"] = new pinying();
//			VcetorArr["010010_a"] = new jiyang();
//			VcetorArr["010011_a"] = new shangqiu();//
//			
//			cityMapping["0100"] = "市区";
//			cityMapping["010001"] = "章丘市";
//			cityMapping["010002"] = "历下区";
//			cityMapping["010003"] = "市中区";
//			cityMapping["010004"] = "槐荫区";
//			cityMapping["010005"] = "天桥区";
//			cityMapping["010006"] = "历城区";
//			cityMapping["010007"] = "长清区";
//			cityMapping["010008"] = "高新区";
//			cityMapping["010009"] = "平阴县";
//			cityMapping["010010"] = "济阳县";
//			cityMapping["010011"] = "商河县";
//			XML_URL = configBaseUrl+"map_jinan.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"01");
//			
//			/*-----------------青岛------------------*/
//			VcetorArr["020001_a"] = new hd_kaifaqu;
//			VcetorArr["020002_a"] = new qindao_gaoxin();
//			VcetorArr["020003_a"] = new qindao_shinan();
//			VcetorArr["020004_a"] = new qindao_shibei();
//			VcetorArr["020005_a"] = new qindao_sifang();
//			VcetorArr["020006_a"] = new huangdao12();
//			VcetorArr["020007_a"] = new qindao_laoshan();
//			VcetorArr["020008_a"] = new qindao_lichang();
//			VcetorArr["020009_a"] = new qindao_chenyang();
//			VcetorArr["020010_a"] = new jiaozhou();
//			VcetorArr["020011_a"] = new jimo12;
//			VcetorArr["020012_a"] = new pindu();
//			VcetorArr["020013_a"] = new jiaonan();
//			VcetorArr["020014_a"] = new laixi();
//			
//			cityMapping["020001"] = "开发区";
//			cityMapping["020002"] = "高新区";
//			cityMapping["020003"] = "市南区";
//			cityMapping["020004"] = "市北区";
//			cityMapping["020005"] = "四方区";
//			cityMapping["020006"] = "黄岛区";
//			cityMapping["020007"] = "崂山区";
//			cityMapping["020008"] = "李沧区";
//			cityMapping["020009"] = "城阳区";
//			cityMapping["020010"] = "胶州市";
//			cityMapping["020011"] = "即墨市";
//			cityMapping["020012"] = "平度市";
//			cityMapping["020013"] = "胶南市";
//			cityMapping["020014"] = "莱西市";
//			XML_URL = configBaseUrl+"map_qingdao.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"02");
//			
//			/*-----------------烟台------------------*/
//			VcetorArr["030001_a"] = new yant_gaoxin();
//			VcetorArr["030002_a"] = new yant_zhisu();
//			VcetorArr["030003_a"] = new yant_fushan();
//			VcetorArr["030004_a"] = new yant_xipin();
//			VcetorArr["030005_a"] = new yant_laishan();
//			VcetorArr["030006_a"] = new yant_kaifaqu();
//			VcetorArr["030007_a"] = new changdao();
//			VcetorArr["030008_a"] = new longkou();
//			VcetorArr["030009_a"] = new laiyang();
//			VcetorArr["030010_a"] = new laizhou12();
//			VcetorArr["030011_a"] = new penlai();
//			VcetorArr["030012_a"] = new zhaoyuan();
//			VcetorArr["030013_a"] = new xixia();
//			VcetorArr["030014_a"] = new haiyang12();
//			
//			cityMapping["030001"] = "高新区";
//			cityMapping["030002"] = "芝罘区";
//			cityMapping["030003"] = "福山区";
//			cityMapping["030004"] = "牟平区";
//			cityMapping["030005"] = "莱山区";
//			cityMapping["030006"] = "开发区";
//			cityMapping["030007"] = "长岛县";
//			cityMapping["030008"] = "龙口市";
//			cityMapping["030009"] = "莱阳市";
//			cityMapping["030010"] = "莱州市";
//			cityMapping["030011"] = "蓬莱市";
//			cityMapping["030012"] = "招远市";
//			cityMapping["030013"] = "栖霞市";
//			cityMapping["030014"] = "海阳市";
//			XML_URL = configBaseUrl+"map_yantai.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"03");
//			/*-----------------潍坊------------------*/
//			VcetorArr["0400_a"] = new weifang_b();
//			VcetorArr["040001_a"] = new wf_weichen();
//			VcetorArr["040002_a"] = new wf_hanting12();
//			VcetorArr["040003_a"] = new wf_fangzi();
//			VcetorArr["040004_a"] = new wf_kuiwen12();
//			VcetorArr["040005_a"] = new wf_kaifaqu();
//			VcetorArr["040006_a"] = new binghai();
//			VcetorArr["040007_a"] = new lingxiang();
//			VcetorArr["040008_a"] = new lule();
//			VcetorArr["040009_a"] = new jizhou();
//			VcetorArr["040010_a"] = new zhuchen();
//			VcetorArr["040011_a"] = new souguang12();
//			VcetorArr["040012_a"] = new anqiu();
//			VcetorArr["040013_a"] = new gaomi();
//			VcetorArr["040014_a"] = new luyi();
//			
//			cityMapping["0400"] = "市区";
//			cityMapping["040001"] = "潍城区";
//			cityMapping["040002"] = "寒亭区";
//			cityMapping["040003"] = "坊子区";
//			cityMapping["040004"] = "奎文区";
//			cityMapping["040005"] = "开发区";
//			cityMapping["040006"] = "滨海";
//			cityMapping["040007"] = "临朐县";
//			cityMapping["040008"] = "昌乐县";
//			cityMapping["040009"] = "青州市";
//			cityMapping["040010"] = "诸城市";
//			cityMapping["040011"] = "寿光市";
//			cityMapping["040012"] = "安丘市";
//			cityMapping["040013"] = "高密市";
//			cityMapping["040014"] = "昌邑市";
//			XML_URL = configBaseUrl+"map_duifang.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"04");
//			
//			/*-----------------淄博------------------*/
//			VcetorArr["0500_a"] = new zibo_b();
//			VcetorArr["050001_a"] = new gaoxin();
//			VcetorArr["050002_a"] = new zichuan();
//			VcetorArr["050003_a"] = new zhangdian();
//			VcetorArr["050004_a"] = new boshan();
//			VcetorArr["050005_a"] = new linzi();
//			VcetorArr["050006_a"] = new zhoucun();
//			VcetorArr["050007_a"] = new hengtai();
//			VcetorArr["050008_a"] = new gaoqin();
//			VcetorArr["050009_a"] = new xinyuan();
//		
//			cityMapping["0500"] = "市区";
//			cityMapping["050001"] = "高新区";
//			cityMapping["050002"] = "淄川区";
//			cityMapping["050003"] = "张店区";
//			cityMapping["050004"] = "博山区";
//			cityMapping["050005"] = "临淄区";
//			cityMapping["050006"] = "周村区";
//			cityMapping["050007"] = "桓台县";
//			cityMapping["050008"] = "高青县";
//			cityMapping["050009"] = "沂源县";
//			XML_URL = configBaseUrl+"map_zibo.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"05");
//			/*-----------------威海------------------*/
//			VcetorArr["060001_a"] = new weihai_gaoqu();
//			VcetorArr["060002_a"] = new weihai_jinqu();
//			VcetorArr["060003_a"] = new weihai_gongyequ12();
//			VcetorArr["060004_a"] = new weihai_huancui();
//			VcetorArr["060005_a"] = new wendeng12();
//			VcetorArr["060006_a"] = new rongchen();
//			VcetorArr["060007_a"] = new rushan();
//			
//			cityMapping["060001"] = "高区";
//			cityMapping["060002"] = "经区";
//			cityMapping["060003"] = "工业新区";
//			cityMapping["060004"] = "环翠区";
//			cityMapping["060005"] = "文登市";
//			cityMapping["060006"] = "荣成市";
//			cityMapping["060007"] = "乳山市";
//			XML_URL = configBaseUrl+"map_weihai.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"06");
//			
//			/*-----------------济宁------------------*/
//			VcetorArr["070001_a"] = new jn_shizhong();
//			VcetorArr["070002_a"] = new jn_renchen();
//			VcetorArr["070003_a"] = new weishan();
//			VcetorArr["070004_a"] = new yutai();
//			VcetorArr["070005_a"] = new jinxiang();
//			VcetorArr["070006_a"] = new jiaxiang();
//			VcetorArr["070007_a"] = new wenshang();
//			VcetorArr["070008_a"] = new sishui();
//			VcetorArr["070009_a"] = new liangshan();
//			VcetorArr["070010_a"] = new qubu();
//			VcetorArr["070011_a"] = new yuzhou();
//			VcetorArr["070012_a"] = new zhouchen();
//			
//			cityMapping["070001"] = "市中区";
//			cityMapping["070002"] = "任城区";
//			cityMapping["070003"] = "微山县";
//			cityMapping["070004"] = "鱼台县";
//			cityMapping["070005"] = "金乡县";
//			cityMapping["070006"] = "嘉祥县";
//			cityMapping["070007"] = "汶上县";
//			cityMapping["070008"] = "泗水县";
//			cityMapping["070009"] = "梁山县";
//			cityMapping["070010"] = "曲阜市";
//			cityMapping["070011"] = "兖州市";
//			cityMapping["070012"] = "邹城市";
//			XML_URL = configBaseUrl+"map_jining.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"07");
//			
//			/*-----------------泰安------------------*/
//			VcetorArr["080001_a"] = new xintai();
//			VcetorArr["080002_a"] = new feichenshi();
//			VcetorArr["080003_a"] = new ta_taishan();
//			VcetorArr["080004_a"] = new ta_daiyue12();
//			VcetorArr["080005_a"] = new ningyang();
//			VcetorArr["080006_a"] = new dongpinxian();
//			
//			cityMapping["080001"] = "新泰市";
//			cityMapping["080002"] = "肥城市";
//			cityMapping["080003"] = "泰山区";
//			cityMapping["080004"] = "岱岳区";
//			cityMapping["080005"] = "宁阳县";
//			cityMapping["080006"] = "东平县";
//			XML_URL = configBaseUrl+"map_taian.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"08");
//			
//			/*-----------------德州------------------*/
//			VcetorArr["0900_a"] = new dezhou_b();
//			VcetorArr["090001_a"] = new lelin();
//			VcetorArr["090002_a"] = new yuchen();
//			VcetorArr["090003_a"] = new dechen();
//			VcetorArr["090004_a"] = new linxian();
//			VcetorArr["090005_a"] = new ningjian();
//			VcetorArr["090006_a"] = new qinyun();
//			VcetorArr["090007_a"] = new linyi();
//			VcetorArr["090008_a"] = new qihe();
//			VcetorArr["090009_a"] = new pinyuan();
//			VcetorArr["090010_a"] = new xiajin();
//			VcetorArr["090011_a"] = new wuchen();
//			
//			cityMapping["0900"] = "市区";
//			cityMapping["090001"] = "乐陵市";
//			cityMapping["090002"] = "禹城市";
//			cityMapping["090003"] = "德城区";
//			cityMapping["090004"] = "陵县";
//			cityMapping["090005"] = "宁津县";
//			cityMapping["090006"] = "庆云县";
//			cityMapping["090007"] = "临邑县";
//			cityMapping["090008"] = "齐河县";
//			cityMapping["090009"] = "平原县";
//			cityMapping["090010"] = "夏津县";
//			cityMapping["090011"] = "武城县";
//			XML_URL = configBaseUrl+"map_dezhou.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"09");
//			
//			/*-----------------临沂------------------*/
//			VcetorArr["100001_a"] = new lz_lanshan();
//			VcetorArr["100002_a"] = new lz_luozhuang();
//			VcetorArr["100003_a"] = new lz_hedong();
//			VcetorArr["100004_a"] = new lz_kaifaqu12();
//			VcetorArr["100005_a"] = new zenan();
//			VcetorArr["100006_a"] = new yanchen();
//			VcetorArr["100007_a"] = new zeshui();
//			VcetorArr["100008_a"] = new changshan();
//			VcetorArr["100009_a"] = new feixian();
//			VcetorArr["100010_a"] = new pinyi();
//			VcetorArr["100011_a"] = new nunan();
//			VcetorArr["100012_a"] = new menying();
//			VcetorArr["100013_a"] = new linsu();
//			
//			cityMapping["100001"] = "兰山区";
//			cityMapping["100002"] = "罗庄区";
//			cityMapping["100003"] = "河东区";
//			cityMapping["100004"] = "开发区";
//			cityMapping["100005"] = "沂南县";
//			cityMapping["100006"] = "郯城县";
//			cityMapping["100007"] = "沂水县";
//			cityMapping["100008"] = "苍山县";
//			cityMapping["100009"] = "费县";
//			cityMapping["100010"] = "平邑县";
//			cityMapping["100011"] = "莒南县";
//			cityMapping["100012"] = "蒙阴县";
//			cityMapping["100013"] = "临沭县";
//			XML_URL = configBaseUrl+"map_linze.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"10");
//			
//			/*-----------------枣庄------------------*/
//			VcetorArr["1100_a"] = new zaozhuang_b();
//			VcetorArr["110001_a"] = new zz_gaoxin();
//			VcetorArr["110002_a"] = new tengzhou();
//			VcetorArr["110003_a"] = new zz_shizhong();
//			VcetorArr["110004_a"] = new zz_xuechen();
//			VcetorArr["110005_a"] = new zz_fenchen();
//			VcetorArr["110006_a"] = new zz_taier();
//			VcetorArr["110007_a"] = new zz_shantin();
//			
//			cityMapping["1100"] = "市区";
//			cityMapping["110001"] = "高新区";
//			cityMapping["110002"] = "滕州市";
//			cityMapping["110003"] = "市中区";
//			cityMapping["110004"] = "薛城区";
//			cityMapping["110005"] = "峄城区";
//			cityMapping["110006"] = "台儿庄区";
//			cityMapping["110007"] = "山亭区";
//			XML_URL = configBaseUrl+"map_zaozhuang.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"11");
//			
//			/*-----------------菏泽------------------*/
//			VcetorArr["1200_a"] = new heze_b();
//			VcetorArr["120001_a"] = new cao();
//			VcetorArr["120002_a"] = new dan();
//			VcetorArr["120003_a"] = new chenwu();
//			VcetorArr["120004_a"] = new juye();
//			VcetorArr["120005_a"] = new yunchen12();
//			VcetorArr["120006_a"] = new zhenchen12();
//			VcetorArr["120007_a"] = new dingtao();
//			VcetorArr["120008_a"] = new dongming();
//			VcetorArr["120009_a"] = new hz_mudanjiang12();
//
//			cityMapping["1200"] = "市区";
//			cityMapping["120001"] = "曹县";
//			cityMapping["120002"] = "单县";
//			cityMapping["120003"] = "成武县";
//			cityMapping["120004"] = "巨野县";
//			cityMapping["120005"] = "郓城县";
//			cityMapping["120006"] = "鄄城县";
//			cityMapping["120007"] = "定陶县";
//			cityMapping["120008"] = "东明县";
//			cityMapping["120009"] = "牡丹区";
//			XML_URL = configBaseUrl+"map_heze.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"12");
//			
//			/*-----------------聊城------------------*/
//			VcetorArr["1300_a"] = new liaochen_b();
//			VcetorArr["130001_a"] = new dongchang();
//			VcetorArr["130002_a"] = new yanggu();
//			VcetorArr["130003_a"] = new xinxian();
//			VcetorArr["130004_a"] = new zhuangpin();
//			VcetorArr["130005_a"] = new donga();
//			VcetorArr["130006_a"] = new guanxian();
//			VcetorArr["130007_a"] = new gaotang();
//			VcetorArr["130008_a"] = new linqin();
//			
//			cityMapping["1300"] = "市区";
//			cityMapping["130001"] = "东昌府区";
//			cityMapping["130002"] = "阳谷县";
//			cityMapping["130003"] = "莘县";
//			cityMapping["130004"] = "茌平县";
//			cityMapping["130005"] = "东阿县";
//			cityMapping["130006"] = "冠县";
//			cityMapping["130007"] = "高唐县";
//			cityMapping["130008"] = "临清市";
//			XML_URL = configBaseUrl+"map_liaocheng.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"13");
//			
//			/*-----------------滨州------------------*/
//			VcetorArr["1400_a"] = new bingzhou_b()
//			VcetorArr["140001_a"] = new bingchen12();
//			VcetorArr["140002_a"] = new huimin();
//			VcetorArr["140003_a"] = new yangxin12();
//			VcetorArr["140004_a"] = new wukang();
//			VcetorArr["140005_a"] = new zhanhua();
//			VcetorArr["140006_a"] = new boxin();
//			VcetorArr["140007_a"] = new zhoupin();
//			
//			cityMapping["1400"] = "市区";
//			cityMapping["140001"] = "滨城区";
//			cityMapping["140002"] = "惠民县";
//			cityMapping["140003"] = "阳信县";
//			cityMapping["140004"] = "无棣县";
//			cityMapping["140005"] = "沾化县";
//			cityMapping["140006"] = "博兴县";
//			cityMapping["140007"] = "邹平县";
//			XML_URL = configBaseUrl+"map_binzhou.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"14");
//			
//			/*-----------------东营------------------*/
//			VcetorArr["1500_a"] = new dongyin_b();
//			VcetorArr["150001_a"] = new kaifaqu();
//			VcetorArr["150002_a"] = new dongyin();
//			VcetorArr["150003_a"] = new hekou();
//			VcetorArr["150004_a"] = new keli();
//			VcetorArr["150005_a"] = new lijin();
//			VcetorArr["150006_a"] = new guangrao();
//			
//			cityMapping["1500"] = "市区";
//			cityMapping["150001"] = "开发区";
//			cityMapping["150002"] = "东营区";
//			cityMapping["150003"] = "河口区";
//			cityMapping["150004"] = "垦利县";
//			cityMapping["150005"] = "利津县";
//			cityMapping["150006"] = "广饶县";
//			XML_URL = configBaseUrl+"map_dongying.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"15");
//			
//			/*-----------------日照------------------*/
//			VcetorArr["160001_a"] = new rz_kaifaqu();
//			VcetorArr["160002_a"] = new rz_dongxiang();
//			VcetorArr["160003_a"] = new rz_fenshan();
//			VcetorArr["160004_a"] = new wulian();
//			VcetorArr["160005_a"] = new lu();
//			
//			cityMapping["160001"] = "开发区";
//			cityMapping["160002"] = "东港区";
//			cityMapping["160003"] = "岚山区";
//			cityMapping["160004"] = "五莲县";
//			cityMapping["160005"] = "莒县";
//			XML_URL = configBaseUrl+"map_rizhao.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"16");
//			
//			/*-----------------莱芜------------------*/
//			VcetorArr["1700_a"] = new laiwu_b();
//			VcetorArr["170001_a"] = new laichen_a12();
//			VcetorArr["170002_a"] = new gangchen_a12();
//			
//			cityMapping["1700"] = "市区";
//			cityMapping["170001"] = "莱城区";
//			cityMapping["170002"] = "钢城区";
//			XML_URL = configBaseUrl+"map_laiwu.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,"17");
		}
	}
}