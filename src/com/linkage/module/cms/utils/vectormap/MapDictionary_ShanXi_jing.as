package com.linkage.module.cms.utils.vectormap
{
	public class MapDictionary_ShanXi_jing extends MapDictionary
	{
		public function MapDictionary_ShanXi_jing(configBaseUrl:String)
		{
			super(configBaseUrl);
		}
		
		override protected function doInit():void{
			provinceName = "山西";
			provinceId = "00";
			var VcetorArr:Array=[];
			var cityMapping:Array;
			var XML_URL:String;
//			VcetorArr["35101_a"] = new taiyuan_a();
//			VcetorArr["35101_b"] = new taiyuan_b();
//			VcetorArr["35201_a"] = new datong_a();
//			VcetorArr["35201_b"] = new datong_b();
//			VcetorArr["35301_a"] = new yangchuan_a();
//			VcetorArr["35301_b"] = new yangchuan_b();
//			VcetorArr["35401_a"] = new jinzhong_a();
//			VcetorArr["35401_b"] = new jinzhong_b();
//			VcetorArr["35501_a"] = new changzhi_a();
//			VcetorArr["35501_b"] = new changzhi_b();
//			VcetorArr["35601_a"] = new puchen_a();
//			VcetorArr["35601_b"] = new puchen_b();
//			VcetorArr["35701_a"] = new linfen_a();
//			VcetorArr["35701_b"] = new linfen_b();
//			VcetorArr["35801_a"] = new nuliang_a();
//			VcetorArr["35801_b"] = new nuliang_b();
//			VcetorArr["35901_a"] = new yunchen_a();
//			VcetorArr["35901_b"] = new yunchen_b();
//			VcetorArr["35001_a"] = new xinzhou_a();
//			VcetorArr["35001_b"] = new xinzhou_b();
//			VcetorArr["34901_a"] = new shuozhou_a();
//			VcetorArr["34901_b"] = new shuozhou_b();
//			
//			cityMapping = [];
//			cityMapping["35101"] = "太原市";
//			cityMapping["35201"] = "大同市";
//			cityMapping["35301"] = "阳泉市";
//			cityMapping["35401"] = "晋中市";
//			cityMapping["35501"] = "长治市";
//			cityMapping["35601"] = "晋城市";
//			cityMapping["35701"] = "临汾市";
//			cityMapping["35801"] = "吕梁市";
//			cityMapping["35901"] = "运城市";
//			cityMapping["35001"] = "忻州市";
//			cityMapping["34901"] = "朔州市";
//			XML_URL = configBaseUrl+"map_shanxi_jing.xml";
//			addMapBean(VcetorArr,cityMapping,XML_URL,provinceId);
		}
	}
}