package com.linkage.module.cms.common.columnar
{
	import com.linkage.module.cms.common.Constants;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	
	import spark.components.Group;

	public class ColumnarNode extends Group
	{
		//柱状图颜色
		private var _color:uint = 0xff0000;
		//是否移动
		private var _isMove:Boolean = false;

		public function ColumnarNode()
		{
			super();
		}

		/**
		 *画柱状图
		 *
		 */
		public function drawColumnar():void
		{
			this.removeAllElements();
			this.graphics.clear();
			var g:Graphics = this.graphics;
			var fillType:String = GradientType.LINEAR;
			var colors:Array = [color, 0xffffff];
			var alphas:Array = [0.8, 0.8];
			var ratios:Array = [0, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(width, width, Math.PI, 0, 0);
			var spreadMethod:String = SpreadMethod.REPEAT;
			//画下面椭圆
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			g.drawEllipse(-width, -3, width, width - 6);
			// 画中间矩形
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			g.drawRect(-width, -height, width, height);
			//画上面椭圆
			g.beginFill(0xff0000);
			g.drawEllipse(-width, -height - 3, width, width - 7);
			g.endFill();
		}

		/**
		 *画默认柱状图
		 *
		 */
		public function drawDefaultColumnar():void
		{
			this.removeAllElements();
			this.graphics.clear();
			var g:Graphics = this.graphics;
			var fillType:String = GradientType.LINEAR;
			var colors:Array = [0x0379e7, 0x2682ff, 0xa6ccff, 0x9ec9ff, 0x8cbeff, 0x0c78ff, 0x0068ff, 0x0877ad];
			var alphas:Array = [0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8];
			var ratios:Array = [0, 10, 23, 36, 50, 160, 200, 255];
			var matr:Matrix = new Matrix();
			matr.createGradientBox(width, width, 2 * Math.PI, 0, 0);
			var spreadMethod:String = SpreadMethod.REPEAT;
			//画下面椭圆
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			g.drawEllipse(-width, -3, width, width - 6);
			// 画中间矩形
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			g.drawRect(-width, -height, width, height);
			//画上面椭圆
			colors = [0x0028ff, 0x046aff];
			alphas = [0.8, 0.8];
			ratios = [0, 255];
			g.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			g.drawEllipse(-width, -height - 3, width, width - 7);
			g.endFill();
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

		public function get color():uint
		{
			return _color;
		}

		public function set color(value:uint):void
		{
			_color = value;
		}
	}
}