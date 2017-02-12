package com.linkage.module.cms.utils.vectormap
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	public class MapDictionary_JiangSu_LTETopo extends MapDictionary
	{
		private var log:ILogger = Log.getLoggerByClass(MapDictionary_JiangSu_LTETopo);
		public function MapDictionary_JiangSu_LTETopo(configBaseUrl:String)
		{
			super(configBaseUrl);
		}
		
		override protected function doInit():void{
//			log.debug("[doInit]");
			
			provinceName = "江苏";
			provinceId = "00";
			var VcetorArr:Array=[];
			var cityMapping:Array;
			var XML_URL:String;
			VcetorArr["0100_a"] = new nanjing_ca();
			VcetorArr["0100_b"] = new nanjing_cb();
			VcetorArr["0200_a"] = new suzhou_ca();
			VcetorArr["0200_b"] = new suzhou_cb();
			VcetorArr["0300_a"] = new wuxi_ca();
			VcetorArr["0300_b"] = new wuxi_cb();
			VcetorArr["0400_a"] = new changzhou_ca();
			VcetorArr["0400_b"] = new changzhou_cb();
			VcetorArr["0500_a"] = new zhenjiang_ca();
			VcetorArr["0500_b"] = new zhenjiang_cb();
			VcetorArr["0600_a"] = new yangzhou_ca();
			VcetorArr["0600_b"] = new yangzhou_cb();
			VcetorArr["0700_a"] = new nantong_ca();
			VcetorArr["0700_b"] = new nantong_cb();
			VcetorArr["0800_a"] = new taizhou_ca();
			VcetorArr["0800_b"] = new taizhou_cb();
			VcetorArr["0900_a"] = new xuzhou_ca();
			VcetorArr["0900_b"] = new xuzhou_cb();
			VcetorArr["1000_a"] = new huaian_ca();
			VcetorArr["1000_b"] = new huaian_cb();
			VcetorArr["1100_a"] = new yancheng_ca();
			VcetorArr["1100_b"] = new yancheng_cb();
			VcetorArr["1200_a"] = new lianyungang_ca();
			VcetorArr["1200_b"] = new lianyungang_cb();
			VcetorArr["1300_a"] = new suqian_ca();
			VcetorArr["1300_b"] = new suqian_cb();
			
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
			
			XML_URL = configBaseUrl+"map_gs_jiangsu.xml";
			addMapBean(VcetorArr,cityMapping,XML_URL,provinceId);
			
			log.debug(provinceName);
		}
	}
}