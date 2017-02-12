package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;

	/**
	 *梯形渲染器
	 * @author mengqiang
	 *
	 */
	public class TrapezoidRenderer extends AreaMarkRenderer
	{
		public function TrapezoidRenderer(e:IElement)
		{
			super(e);
		}

		/**
		 *画带梯形形状
		 * @param trapezoid 标记对象
		 *
		 */
		override protected function drawShape(trapezoid:IAreaMark):void
		{
			var g:Graphics = this.graphics;
			g.lineStyle(1, trapezoid.lineColor);
			var fillType:String = GradientType.LINEAR
			var leftColor:uint = 0xffffff;
			var rightColor:uint = 0x000000;
			var middleColor:uint = (trapezoid.color1 + trapezoid.color2) / 2;
			var leftmiddleColor:uint = trapezoid.color1;
			var rightmiddleColor:uint = trapezoid.color2;
			var colors:Array = [leftColor, leftmiddleColor, middleColor, rightmiddleColor, rightColor];
			var alphas:Array = [0.8, 1, 1, 1, 0.8];
			var ratios:Array = [0, 10, 120, 235, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(trapezoid.width, trapezoid.height, Math.PI / 2, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			// 画梯形
			g.moveTo(trapezoid.width / 4, 0);
			g.lineTo((trapezoid.width * 3) / 4, 0);
			g.lineTo(trapezoid.width, trapezoid.height);
			g.lineTo(0, trapezoid.height);
			g.lineTo(trapezoid.width / 4, 0);
			g.endFill();
		}
	}
}