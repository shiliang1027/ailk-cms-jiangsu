package com.linkage.module.cms.common.columnar
{
	import mx.collections.ArrayCollection;

	public class ColumnarConfig
	{
		//柱状图宽度
		private var _width:int = 12;
		//柱状图长度
		private var _height:int = 60;
		//柱状图颜色
		private var _color:uint = 0xff0000;
		//柱状图配置信息
		private var _configArray:ArrayCollection = new ArrayCollection();

		public function ColumnarConfig()
		{
			initColumnarConfigInfo();
		}

		//初始化柱状图配置信息
		private function initColumnarConfigInfo():void
		{
			configArray.addItem({id: '3', name: '潮州', x: '-10', y: '-10'});
			configArray.addItem({id: '4', name: '东莞', x: '-16', y: '-5'});
			configArray.addItem({id: '5', name: '佛山', x: '20', y: '-7'});
			configArray.addItem({id: '6', name: '广州', x: '-20', y: '-15'});
			configArray.addItem({id: '7', name: '河源', x: '0', y: '0'});
			configArray.addItem({id: '8', name: '江门', x: '10', y: '-5'});
			configArray.addItem({id: '9', name: '惠州', x: '-10', y: '0'});
			configArray.addItem({id: '10', name: '揭阳', x: '0', y: '0'});
			configArray.addItem({id: '11', name: '茂名', x: '20', y: '-39'});
			configArray.addItem({id: '12', name: '梅州', x: '-20', y: '0'});
			configArray.addItem({id: '13', name: '清远', x: '40', y: '20'});
			configArray.addItem({id: '14', name: '汕头', x: '-4', y: '5'});
			configArray.addItem({id: '15', name: '汕尾', x: '10', y: '-10'});
			configArray.addItem({id: '16', name: '韶关', x: '0', y: '0'});
			configArray.addItem({id: '17', name: '深圳', x: '20', y: '-2'});
			configArray.addItem({id: '18', name: '阳江', x: '-25', y: '25'});
			configArray.addItem({id: '19', name: '云浮', x: '15', y: '15'});
			configArray.addItem({id: '20', name: '湛江', x: '-39', y: '10'});
			configArray.addItem({id: '21', name: '肇庆', x: '20', y: '-36'});
			configArray.addItem({id: '22', name: '中山', x: '0', y: '-5'});
			configArray.addItem({id: '23', name: '珠海', x: '-10', y: '10'});
		}

		public function get width():int
		{
			return _width;
		}

		public function set width(value:int):void
		{
			_width = value;
		}

		public function get height():int
		{
			return _height;
		}

		public function set height(value:int):void
		{
			_height = value;
		}

		public function get color():uint
		{
			return _color;
		}

		public function set color(value:uint):void
		{
			_color = value;
		}

		public function get configArray():ArrayCollection
		{
			return _configArray;
		}

		public function set configArray(value:ArrayCollection):void
		{
			_configArray = value;
		}

	}
}