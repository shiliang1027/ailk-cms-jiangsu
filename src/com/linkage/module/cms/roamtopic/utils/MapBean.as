package com.linkage.module.cms.roamtopic.utils
{
	public class MapBean
	{
		public function MapBean()
		{
		}
		//地图矢量图集合
		private var _VcetorArr:Array;
		//地图xml
		private var _XML_URL:String;
		//地区id和名称对应关系
		private var _cityMapping:Object;
		
		public function get cityMapping():Object
		{
			return _cityMapping;
		}
		
		public function set cityMapping(value:Object):void
		{
			_cityMapping = value;
		}
		
		public function get XML_URL():String
		{
			return _XML_URL;
		}
		
		public function set XML_URL(value:String):void
		{
			_XML_URL = value;
		}
		
		public function get VcetorArr():Array
		{
			return _VcetorArr;
		}
		
		public function set VcetorArr(value:Array):void
		{
			_VcetorArr = value;
		}
	}
}