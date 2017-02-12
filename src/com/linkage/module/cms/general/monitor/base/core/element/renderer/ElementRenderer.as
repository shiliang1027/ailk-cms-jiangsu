package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	
	import spark.components.Group;

	/**
	 * 元素渲染器
	 * @author duangr
	 *
	 */
	public class ElementRenderer extends Group implements IElementRenderer
	{
		// 元素对象
		protected var _element:IElement = null;

		public function ElementRenderer(e:IElement)
		{
			super();
			element = e;
		}

		public function get element():IElement
		{
			return _element;
		}

		public function set element(e:IElement):void
		{
			_element = e;
		}

		public function show():void
		{
			_element.stage.addElement(this);
		}

		public function refresh():void
		{
		}

		public function startShine():void
		{

		}

		public function stopShine():void
		{

		}

		public function startShineByTime():void
		{

		}

		public function stopShineByStaute():void
		{

		}
	}
}