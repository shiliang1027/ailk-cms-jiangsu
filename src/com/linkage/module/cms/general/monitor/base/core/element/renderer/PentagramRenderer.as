package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	
	/**
	 *箭头渲染器
	 * @author czm
	 *
	 */
	public class PentagramRenderer extends AreaMarkRenderer
	{
		public function PentagramRenderer(e:IElement)
		{
			super(e);
		}
		
		/**
		 * 画箭头形状
		 *@param arrow 箭头标记对象
		 */
		override protected function drawShape(pentagram:IAreaMark):void
		{
			var g:Graphics = this.graphics;
			g.lineStyle(1, pentagram.lineColor);
			var fillType:String = GradientType.LINEAR
			var leftColor:uint = 0xffffff;
			var rightColor:uint = 0x000000;
			var middleColor:uint = (pentagram.color1 + pentagram.color2) / 2;
			var leftmiddleColor:uint = pentagram.color1;
			var rightmiddleColor:uint = pentagram.color2;
			var colors:Array = [leftColor, leftmiddleColor, middleColor, rightmiddleColor, rightColor];
			var alphas:Array = [0.8, 1, 1, 1, 0.8];
			var ratios:Array = [0, 10, 120, 235, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(pentagram.width, pentagram.height, 2 * Math.PI / 3, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			g.moveTo(pentagram.width/2,0);
			g.lineTo(pentagram.width/3,pentagram.height/4);
			g.lineTo(0,pentagram.height/4);
			g.lineTo(pentagram.width/3,pentagram.height*2/4);
			g.lineTo(0,pentagram.height);
			g.lineTo(pentagram.width/2,pentagram.height*3/4);
			g.lineTo(pentagram.width,pentagram.height);
			g.lineTo(pentagram.width*2/3,pentagram.height*2/4);
			g.lineTo(pentagram.width,pentagram.height/4);
			g.lineTo(pentagram.width*2/3,pentagram.height/4);
			g.lineTo(pentagram.width/2,0);
			g.endFill();
		}
	}
}