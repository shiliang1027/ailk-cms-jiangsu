package com.linkage.module.cms.roamtopic.utils
{
	import com.linkage.module.cms.components.dummymap.MapWork;
	
	import flash.utils.Dictionary;
	
	import mx.utils.UIDUtil;

	public class VectorMapFactory
	{
		private var _id:String;
		private var _factoryId:String;
		private static var factory:VectorMapFactory;
		private var _mapDic:Dictionary;
		public function VectorMapFactory(factoryId:String)
		{
			_factoryId=factoryId;
			_id = UIDUtil.createUID();
		}
		
		public static function getFactory(mapwork:MapWork):VectorMapFactory{
			if(!factory){
				factory = new JiangSuVectorMapFactory("jiangsu");
			}
			return factory;
		}
		public function get factoryId():String{
			return _factoryId;
		}
		
		public function get mapDic():Dictionary{
			return _mapDic;
		}
		public function set mapDic(value:Dictionary):void{
			_mapDic = value;
		}
		public function getMapBean(cityId:String):MapBean{
			var mapbean:MapBean = mapDic[cityId] as MapBean;
			return mapbean;
		}
		
		public function addMapBean(VcetorArr:Array,cityMapping:Array,XML_URL:String,cityId:String):void{
			var cityMapJar:MapBean = new MapBean();
			cityMapJar.VcetorArr= VcetorArr;
			cityMapJar.XML_URL = XML_URL;
			cityMapJar.cityMapping = cityMapping;
			mapDic[cityId] = cityMapJar;
		}
		
		public function toString():String{
			return "["+_id+"]["+factoryId+"]"+_mapDic;
		}
	}
}