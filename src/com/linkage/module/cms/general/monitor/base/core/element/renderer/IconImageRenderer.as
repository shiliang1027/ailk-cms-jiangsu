package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	import com.linkage.module.cms.general.monitor.base.resource.imagesclass.IconFinder;
	
	import mx.controls.Image;

	/**
	 *图片渲染器
	 * @author mengqiang
	 *
	 */
	public class IconImageRenderer extends AreaMarkRenderer
	{
		public function IconImageRenderer(e:IElement)
		{
			super(e);
		}

		/**
		 *图片
		 * @param trapezoid 标记对象
		 *
		 */
		override protected function drawShape(iconImage:IAreaMark):void
		{
			var icon:String = (iconImage.icon != null) ? iconImage.icon : _defaultImage;
			var img:Image = IconFinder.findElementIcon(icon);
			img.width = iconImage.width;
			img.height = iconImage.height;
			addElement(img);
		}
	}
}