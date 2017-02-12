package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;

	/**
	 *渲染器
	 * @author mengqiang
	 *
	 */
	public class CircleRenderer extends AreaMarkRenderer
	{
		public function CircleRenderer(e:IElement)
		{
			super(e);
		}


		/**
		 *画带圆形形状
		 * @param circle 圆形标记对象
		 *
		 */
		override protected function drawShape(circle:IAreaMark):void
		{
			var g:Graphics = this.graphics;
			g.lineStyle(1, circle.lineColor);
			var fillType:String = GradientType.LINEAR
			var leftColor:uint = 0xffffff;
			var rightColor:uint = 0x000000;
			var middleColor:uint = (circle.color1 + circle.color2) / 2;
			var leftmiddleColor:uint = circle.color1;
			var rightmiddleColor:uint = circle.color2;
			var colors:Array = [leftColor, leftmiddleColor, middleColor, rightmiddleColor, rightColor];
			var alphas:Array = [0.8, 1, 1, 1, 0.8];
			var ratios:Array = [0, 20, 120, 235, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(circle.width, circle.height, Math.PI / 6, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			// 画圆形
			var radius:Number = Math.min(circle.width, circle.height) / 2;
			g.drawCircle(circle.width / 2, circle.height / 2, radius);
			g.endFill();
		}
	}
}