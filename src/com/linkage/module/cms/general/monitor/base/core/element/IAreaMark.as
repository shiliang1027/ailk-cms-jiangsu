package com.linkage.module.cms.general.monitor.base.core.element
{

	/**
	 * 区域标记接口
	 * @author duangr
	 *
	 */
	public interface IAreaMark extends IElement
	{
		/**
		 * 是否位移
		 */
		function get isMove():Boolean;
		function set isMove(isMove:Boolean):void;
		/**
		 * 发光状态
		 */
		function get shineStatu():int;
		function set shineStatu(shineStatu:int):void;

		/**
		 * 区域编号
		 */
		function get areaId():String;
		function set areaId(areaId:String):void;

		/**
		 * 类型
		 */
		function get type():String;
		function set type(type:String):void;

		/**
		 * 是否显示
		 */
		function get visible():Boolean;
		function set visible(flag:Boolean):void;

		/**
		 * 颜色
		 */
		function get color1():uint;
		function set color1(value:uint):void;
		function get color2():uint;
		function set color2(value:uint):void;
		function get lineColor():uint;
		function set lineColor(value:uint):void;

		/**
		 * 图标
		 */
		function get icon():String;
		function set icon(icon:String):void;

		/**
		 * 文字
		 */
		function get text():String;
		function set text(text:String):void;

		/**
		 * 数据变更
		 */
		function set changeValue(value:String):void;
	}
}