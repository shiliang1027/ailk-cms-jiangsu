package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;

	/**
	 *闪电渲染器
	 * @author mengqiang
	 *
	 */
	public class LightningRenderer extends AreaMarkRenderer
	{
		public function LightningRenderer(e:IElement)
		{
			super(e);
		}

		/**
		 * 画带闪电形状
		 *@param lightning 闪电标记对象
		 */
		override protected function drawShape(lightning:IAreaMark):void
		{
			var g:Graphics = this.graphics;
			g.lineStyle(1, lightning.lineColor);
			var fillType:String = GradientType.LINEAR
			var leftColor:uint = 0xffffff;
			var rightColor:uint = 0x000000;
			var middleColor:uint = (lightning.color1 + lightning.color2) / 2;
			var leftmiddleColor:uint = lightning.color1;
			var rightmiddleColor:uint = lightning.color2;
			var colors:Array = [leftColor, leftmiddleColor, middleColor, rightmiddleColor, rightColor];
			var alphas:Array = [0.8, 1, 1, 1, 0.8];
			var ratios:Array = [0, 10, 120, 235, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(lightning.width, lightning.height, 2 * Math.PI / 3, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			
			// 画闪电
			g.moveTo(lightning.width, -2);
			g.lineTo(0, lightning.height / 2);
			g.lineTo(lightning.width / 2 - 2, lightning.height / 2);
			g.lineTo(0, lightning.height - 2);
			g.lineTo(lightning.width, lightning.height / 2 - 4);
			g.lineTo(lightning.width / 2 + 2, lightning.height / 2 - 4);
			g.lineTo(lightning.width, -2);
			g.endFill();
		}
	}
}