package com.linkage.module.cms.general.monitor.base.core.element
{

	/**
	 * 模板化的标记对象接口
	 * @author duangr
	 *
	 */
	public interface IMark
	{
		/**
		 * 专业
		 */
		function get spec():String;
		function set spec(type:String):void;
		/**
		 * 类型
		 */
		function get type():String;
		function set type(type:String):void;
		/**
		 * 背景颜色
		 */
		function get color1():uint;
		function set color1(value:uint):void;
		function get color2():uint;
		function set color2(value:uint):void;
		function get lineColor():uint;
		function set lineColor(value:uint):void;

		/**
		 * 是否显示
		 */
		function get visible():Boolean;
		function set visible(flag:Boolean):void;

		/**
		 * 名称
		 */
		function get name():String;
		function set name(name:String):void;

		/**
		 * 宽度
		 */
		function get width():Number;
		function set width(width:Number):void;

		/**
		 * 长度
		 */
		function get height():Number;
		function set height(height:Number):void;

		/**
		 * 文字
		 */
		function get text():String;
		function set text(text:String):void;
		
		/**
		 * 默认是否选中
		 */
		function get show():String;
		function set show(value:String):void;
	}
}