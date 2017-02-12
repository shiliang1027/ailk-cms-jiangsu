package com.linkage.module.cms.general.monitor.base.core.element
{

	/**
	 * 区域标记对象
	 * @author duangr
	 *
	 */
	public class AreaMark extends Element implements IAreaMark
	{
		// 是否位移
		private var _isMove:Boolean = false;
		// 发光状态 0:不发光 1:发光10次 2: 一直发光
		private var _shineStatu:int = 0;
		// 区域编号
		private var _areaId:String = null;
		// 业务类型
		private var _type:String = null;
		// 是否显示
		private var _visible:Boolean = false;
		// 颜色
		private var _color1:uint = 0;
		private var _color2:uint = 0;
		private var _lineColor:uint = 0;
		// 图标
		private var _icon:String = null;
		// 文字
		private var _text:String = null;

		public function AreaMark()
		{
			super();
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

		public function get isMove():Boolean
		{
			return _isMove;
		}

		public function set isMove(isMove:Boolean):void
		{
			_isMove = isMove;
		}

		public function get shineStatu():int
		{
			return _shineStatu;
		}

		public function set shineStatu(shineStatu:int):void
		{
			_shineStatu = shineStatu;
		}

		public function get areaId():String
		{
			return _areaId;
		}

		public function set areaId(areaId:String):void
		{
			_areaId = areaId;
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

		public function get icon():String
		{
			return _icon;
		}

		public function set icon(icon:String):void
		{
			_icon = icon;
		}

		public function get text():String
		{
			return _text;
		}

		public function set text(text:String):void
		{
			_text = text;
		}

		public function set changeValue(value:String):void
		{
			// 什么都不做
		}
	}
}