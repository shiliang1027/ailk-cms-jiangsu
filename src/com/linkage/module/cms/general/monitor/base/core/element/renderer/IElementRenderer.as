package com.linkage.module.cms.general.monitor.base.core.element.renderer
{

	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	
	import mx.core.IVisualElement;

	/**
	 * 渲染器接口
	 * @author duangr
	 *
	 */
	public interface IElementRenderer extends IVisualElement
	{
		/**
		 * 元素
		 */
		function get element():IElement;
		function set element(e:IElement):void;
		/**
		 * 显示对象
		 *
		 */
		function show():void;

		/**
		 * 元素模型变化后刷新渲染器(此时已在容器中,不需要再次加入)
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
		 *发光指定时间
		 *
		 */
		function startShineByTime():void;
		/**
		 *通过状态停止发光
		 *
		 */
		function stopShineByStaute():void;
	}
}