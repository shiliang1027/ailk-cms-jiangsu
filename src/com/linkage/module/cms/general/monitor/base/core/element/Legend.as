package com.linkage.module.cms.general.monitor.base.core.element
{

	/**
	 * 模板化的图例对象接口
	 * @author mengqiang
	 *
	 */
	public class Legend implements ILegend
	{
		// 业务类型
		private var _type:String = null;
		// 颜色
		private var _color:String = null;
		//显示级别
		private var _level:String = null;

		public function get level():String
		{
			return _level;
		}

		public function set level(value:String):void
		{
			_level = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(type:String):void
		{
			_type = type;
		}

		public function get color():String
		{
			return _color;
		}

		public function set color(color:String):void
		{
			_color = color;
		}
	}
}