package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;

	/**
	 *三角形渲染器
	 * @author mengqiang
	 *
	 */
	public class TriangleRenderer extends AreaMarkRenderer
	{
		public function TriangleRenderer(e:IElement)
		{
			super(e);
		}

		/**
		 *画带三角形形状
		 * @param triangle 三角形标记对象
		 *
		 */
		override protected function drawShape(triangle:IAreaMark):void
		{
			var g:Graphics = this.graphics;
			g.lineStyle(1, triangle.lineColor);
			var fillType:String = GradientType.LINEAR
			var leftColor:uint = 0xffffff;
			var rightColor:uint = 0x000000;
			var middleColor:uint = (triangle.color1 + triangle.color2) / 2;
			var leftmiddleColor:uint = triangle.color1;
			var rightmiddleColor:uint = triangle.color2;
			var colors:Array = [leftColor, leftmiddleColor, middleColor, rightmiddleColor, rightColor];
			var alphas:Array = [0.8, 1, 1, 1, 0.8];
			var ratios:Array = [0, 20, 120, 235, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(triangle.width, triangle.height, Math.PI / 2, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			// 画三角形
			g.moveTo(0, triangle.height);
			g.lineTo(triangle.width / 2, 0);
			g.lineTo(triangle.width, triangle.height);
			g.lineTo(0, triangle.height);
			g.endFill();
		}
	}
}