package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	
	/**
	 *菱形渲染器
	 * @author mengqiang
	 *
	 */
	public class LozengeRenderer extends AreaMarkRenderer
	{
		public function LozengeRenderer(e:IElement)
		{
			super(e);
		}
		
		/**
		 * 画菱形形状
		 *@param rectangle 菱形标记对象
		 */
		override protected function drawShape(lozenge:IAreaMark):void
		{
			var g:Graphics = this.graphics;
			g.lineStyle(1, lozenge.lineColor);
			var fillType:String = GradientType.LINEAR
			var leftColor:uint = 0xffffff;
			var rightColor:uint = 0x000000;
			var middleColor:uint = (lozenge.color1 + lozenge.color2) / 2;
			var leftmiddleColor:uint = lozenge.color1;
			var rightmiddleColor:uint = lozenge.color2;
			var colors:Array = [leftColor, leftmiddleColor, middleColor, rightmiddleColor, rightColor];
			var alphas:Array = [0.8, 1, 1, 1, 0.8];
			var ratios:Array = [0, 10, 120, 235, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(lozenge.width, lozenge.height, Math.PI / 2, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			// 画菱形
			g.moveTo(lozenge.width/2,0);
			g.lineTo(0,lozenge.height/2);
			g.lineTo(lozenge.width/2,lozenge.height);
			g.lineTo(lozenge.width,lozenge.height/2);
			g.lineTo(lozenge.width/2,0);
			g.endFill();
		}
	}
}