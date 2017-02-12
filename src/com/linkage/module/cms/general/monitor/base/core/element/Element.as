package com.linkage.module.cms.general.monitor.base.core.element
{
	
	import com.linkage.module.cms.general.monitor.base.core.element.renderer.IElementRenderer;
	
	import mx.core.IVisualElementContainer;

	/**
	 * 元素对象
	 * @author duangr
	 *
	 */
	public class Element implements IElement
	{
		// 唯一标识
		private var _id:String = null;
		// 名称
		private var _name:String = null;
		// 渲染器
		private var _renderer:IElementRenderer = null;
		// 舞台
		private var _stage:IVisualElementContainer = null;
		// x坐标
		private var _x:Number = 0;
		// y坐标
		private var _y:Number = 0;
		// 宽度
		private var _width:Number = 0;
		// 长度
		private var _height:Number = 0;


		public function get id():String
		{
			return _id;
		}

		public function set id(id:String):void
		{
			_id = id;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(name:String):void
		{
			_name = name;
		}

		public function set renderer(renderer:IElementRenderer):void
		{
			_renderer = renderer;
		}

		public function get renderer():IElementRenderer
		{
			return _renderer;
		}

		public function set stage(stage:IVisualElementContainer):void
		{
			_stage = stage;
		}

		public function get stage():IVisualElementContainer
		{
			return _stage;
		}

		public function get x():Number
		{
			return _x;
		}

		public function set x(x:Number):void
		{
			_x = x;
		}

		public function get y():Number
		{
			return _y;
		}

		public function set y(y:Number):void
		{
			_y = y;
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

		public function show():void
		{
			_renderer.show();
		}

		public function refresh():void
		{
			_renderer.refresh();
		}

		public function startShine():void
		{
			_renderer.startShine();
		}

		public function stopShine():void
		{
			_renderer.stopShine();
		}

		public function startShineByTime():void
		{
			_renderer.startShineByTime();
		}

		public function stopShineByStaute():void
		{
			_renderer.stopShineByStaute();
		}
	}
}