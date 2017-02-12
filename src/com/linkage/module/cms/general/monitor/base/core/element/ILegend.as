package com.linkage.module.cms.general.monitor.base.core.element
{

	/**
	 * 模板化的图例对象接口
	 * @author mengqiang
	 *
	 */
	public interface ILegend
	{
		/**
		 * 类型
		 */
		function get type():String;
		function set type(type:String):void;

		/**
		 * 颜色
		 */
		function get color():String;
		function set color(color:String):void;
		
		/**
		 * 级别
		 */
		function get level():String;
		function set level(value:String):void
	}
}