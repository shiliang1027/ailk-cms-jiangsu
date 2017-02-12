package com.linkage.module.cms.general.monitor.base.core.element
{

	/**
	 * 模板化标记对象
	 * @author duangr
	 *
	 */
	public class Mark implements IMark
	{
		// 专业
		private var _spec:String = null;
		// 业务类型
		private var _type:String = null;
		// 背景颜色1
		private var _color1:uint = 0;
		// 背景颜色2
		private var _color2:uint = 0;
		//　边框颜色
		private var _lineColor:uint = 0;
		// 是否显示
		private var _visible:Boolean = false;
		// 名称
		private var _name:String = null;
		// 宽度
		private var _width:Number = 0;
		// 长度
		private var _height:Number = 0;
		// 文字
		private var _text:String = null;
		//　默认是否选中
		private var _show:String = null;

		public function get show():String
		{
			return _show;
		}

		public function set show(value:String):void
		{
			_show = value;
		}

		public function get lineColor():uint
		{
			return _lineColor;
		}

		public function set lineColor(value:uint):void
		{
			_lineColor = value;
		}

		public function get color2():uint
		{
			return _color2;
		}

		public function set color2(value:uint):void
		{
			_color2 = value;
		}

		public function get color1():uint
		{
			return _color1;
		}

		public function set color1(value:uint):void
		{
			_color1 = value;
		}

		public function get spec():String
		{
			return _spec;
		}

		public function set spec(spec:String):void
		{
			_spec = spec;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(type:String):void
		{
			_type = type;
		}

		public function get visible():Boolean
		{
			return _visible;
		}

		public function set visible(flag:Boolean):void
		{
			_visible = flag;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(name:String):void
		{
			_name = name;
		}

		public function get width():Number
		{
			return _width;
		}

		public function set width(width:Number):void
		{
			_width = width;
		}

		public function get height():Number
		{
			return _height;
		}

		public function set height(height:Number):void
		{
			_height = height;
		}

		public function get text():String
		{
			return _text;
		}

		public function set text(text:String):void
		{
			_text = text;
		}
	}
}