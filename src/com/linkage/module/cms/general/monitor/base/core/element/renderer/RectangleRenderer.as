package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;

	/**
	 *矩形渲染器
	 * @author mengqiang
	 *
	 */
	public class RectangleRenderer extends AreaMarkRenderer
	{
		public function RectangleRenderer(e:IElement)
		{
			super(e);
		}

		/**
		 * 画带矩形形状
		 *@param rectangle 矩形标记对象
		 */
		override protected function drawShape(rectangle:IAreaMark):void
		{
			var g:Graphics = this.graphics;
			g.lineStyle(1, rectangle.lineColor);
			var fillType:String = GradientType.LINEAR
			var leftColor:uint = 0xffffff;
			var rightColor:uint = 0x000000;
			var middleColor:uint = (rectangle.color1 + rectangle.color2) / 2;
			var leftmiddleColor:uint = rectangle.color1;
			var rightmiddleColor:uint = rectangle.color2;
			var colors:Array = [leftColor, leftmiddleColor, middleColor, rightmiddleColor, rightColor];
			var alphas:Array = [0.8, 1, 1, 1, 0.8];
			var ratios:Array = [0, 10, 120, 235, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(rectangle.width, rectangle.height, Math.PI / 2, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			// 画矩形
			g.drawRect(0, 0, rectangle.width, rectangle.height);
			g.endFill();
		}
	}
}