package com.linkage.module.cms.general.monitor.common.map
{

	import com.linkage.module.cms.common.Constants;
	
	import flash.display.MovieClip;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	
	import mx.core.UIComponent;

	/**
	 * 地图区域节点
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2010-11-26 上午11:38:27
	 * @category com.linkage.module.ims.scene.outshow.core
	 * @copyright 南京联创科技 网管开发部
	 */
	public class MapNode extends UIComponent implements IData
	{
		private var _map:MovieClip;
		private var _isMove:Boolean = false;
		private var _defBgColor:Number = 0x0fffff;

		public function MapNode()
		{
			super();
		}

		public function fillColor(color:Number):void
		{
			if (id.indexOf("_a") != -1)
			{
				var colorForm:ColorTransform = _map.transform.colorTransform;
				colorForm.color = color;
				_map.transform.colorTransform = colorForm;
			}
		}

		public function reset():void
		{
			if (id.indexOf("_a") != -1)
			{
				var colorForm:ColorTransform = _map.transform.colorTransform;
				colorForm.color = _defBgColor;
				_map.transform.colorTransform = colorForm;
			}
		}

		public function mouseOver():void
		{
			if (!_isMove)
			{
				this.y -= Constants.MOUSEOVER_REMOTE_NUM;
				_isMove = true;
			}
		}

		public function mouseOut():void
		{
			if (_isMove)
			{
				this.y += Constants.MOUSEOVER_REMOTE_NUM;
				_isMove = false;
			}
		}

		public function get map():MovieClip
		{
			return _map;
		}

		public function set map(value:MovieClip):void
		{
			_map = value;
		}
	}
}