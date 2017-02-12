package com.linkage.module.cms.scenedaily.domain
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DailyMapDM
	{
		//存放江苏省各省份地市swc
		private var _jsMapArray:Array = new Array();

		//存放江苏省各地市坐标等数据
		private var _jsMap:XML = new XML();

		private var _gisKpis:ArrayCollection = new ArrayCollection(); //giskpi存放

		private var _param:Object = new Object(); //地图渲染或者撒点参数保存

		private var _cityLocation:Object = new Object(); //存放地市坐标

		public function get jsMapArray():Array
		{
			return _jsMapArray;
		}

		public function set jsMapArray(value:Array):void
		{
			_jsMapArray = value;
		}

		public function get jsMap():XML
		{
			return _jsMap;
		}

		public function set jsMap(value:XML):void
		{
			_jsMap = value;
		}

		public function get gisKpis():ArrayCollection
		{
			return _gisKpis;
		}

		[Bindable]
		public function set gisKpis(value:ArrayCollection):void
		{
			_gisKpis = value;
		}

		public function get param():Object
		{
			return _param;
		}

		[Bindable]
		public function set param(value:Object):void
		{
			_param = value;
		}

		public function get cityLocation():Object
		{
			return _cityLocation;
		}

		public function set cityLocation(value:Object):void
		{
			_cityLocation = value;
		}


	}
}