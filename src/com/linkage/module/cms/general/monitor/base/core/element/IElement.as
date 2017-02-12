package com.linkage.module.cms.general.monitor.base.core.element
{

	import com.linkage.module.cms.general.monitor.base.core.element.renderer.IElementRenderer;
	
	import mx.core.IVisualElementContainer;

	/**
	 * 元素接口
	 * @author duangr
	 *
	 */
	public interface IElement
	{

		/**
		 * 元素编号
		 */
		function get id():String;
		function set id(id:String):void;

		/**
		 * 元素的名称
		 */
		function get name():String;
		function set name(name:String):void;

		/**
		 * 渲染器
		 */
		function set renderer(renderer:IElementRenderer):void;
		function get renderer():IElementRenderer;

		/**
		 * 舞台
		 */
		function set stage(stage:IVisualElementContainer):void;
		function get stage():IVisualElementContainer;

		/**
		 * 元素的X坐标
		 */
		function get x():Number;
		function set x(x:Number):void;

		/**
		 * 元素的Y坐标
		 */
		function get y():Number;
		function set y(y:Number):void;

		/**
		 * 元素的宽度
		 */
		function get width():Number;
		function set width(width:Number):void;

		/**
		 * 元素的长度
		 */
		function get height():Number;
		function set height(height:Number):void;

		/**
		 * 显示元素对象
		 *
		 */
		function show():void;

		/**
		 * 元素主动变化后,刷新(一般都是渲染器发生变化,然后刷新对象)
		 *
		 */
		function refresh():void;
		/**
		 *开始发光
		 *
		 */
		function startShine():void;
		/**
		 *结束发光
		 *
		 */
		function stopShine():void;
		/**
		 *发光指定的时间
		 *
		 */
		function startShineByTime():void;
		/**
		 * 通过状态发光
		 *
		 */
		function stopShineByStaute():void;
	}
}