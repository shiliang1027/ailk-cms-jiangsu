package com.linkage.module.cms.utils.vectormap
{
	import flash.utils.Dictionary;

	public class MapDictionary
	{
		private var mapDic:Dictionary = new Dictionary();
		protected var provinceName:String = "";
		protected var provinceId:String = "";
		private var _configBaseUrl:String;
		public function MapDictionary(configBaseUrl:String)
		{
			_configBaseUrl = configBaseUrl;
			doInit();
		}
		
		public function get configBaseUrl():String
		{
			return _configBaseUrl;
		}

		protected function doInit():void{
			
		}
		
		protected function addMapBean(VcetorArr:Array,cityMapping:Array,XML_URL:String,cityName:String):void{
			var cityMapJar:MapBean = new MapBean();
			cityMapJar.VcetorArr= VcetorArr;
			cityMapJar.XML_URL = XML_URL;
			cityMapJar.cityMapping = cityMapping;
			mapDic[cityName] = cityMapJar;
		}
		
		public function getInitMapVector():MapBean{
			var mapbean:MapBean = mapDic[provinceId] as MapBean;
			return mapbean;
		}
		public function getMapVector(cityId:String):MapBean{
			var mapbean:MapBean = mapDic[cityId] as MapBean;
			return mapbean;
		}
	}
}