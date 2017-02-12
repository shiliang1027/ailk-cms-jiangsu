package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;
	import com.linkage.system.utils.StringUtils;
	
	import flash.utils.clearInterval;
	import flash.utils.clearTimeout;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	
	import mx.effects.Glow;
	
	import spark.components.Label;


	/**
	 * 区域标记渲染器
	 * @author duangr
	 *
	 */
	public class AreaMarkRenderer extends ElementRenderer
	{
		//定时器key
		private var outKey:uint = 0;
		//定时器key
		private var timeKey:uint = 0;
		//上次发光状态
		private var _perStaute:int = 0;
		//标签对象
		protected var _label:Label = null;
		//是否发外光
		private var isOutLight:Boolean = false;
		//是否在发光
		private var isShineLight:Boolean = false;
		//默认颜色
		protected var _defaultColor:String = "0xfa0707";
		//默认图片
		protected var _defaultImage:String = "00.png";

		public function AreaMarkRenderer(e:IElement)
		{
			super(e);
			initRenderer();
		}

		/**
		 * 初始化渲染器(要求子类必须实现)
		 *
		 */
		private function initRenderer():void
		{
			this.removeAllElements();
			this.graphics.clear();
			this.buttonMode = true;
			var areaMark:IAreaMark = _element as IAreaMark;
			if (areaMark.visible)
			{
				// 计算容器的位置
				initPosition(areaMark);
				// 画图像
				drawShape(areaMark);
				//画标签
				drawLabelText(areaMark);
			}
		}

		/**
		 *刷新视图
		 *
		 */
		override public function refresh():void
		{
			initRenderer();
		}

		/**
		 *通过状态停止发光
		 *
		 */
		override public function stopShineByStaute():void
		{
			if (_perStaute != 1 && isShineLight)
			{
				stopShine();
			}
		}

		/**
		 *
		 * 发光指定的时间
		 */
		override public function startShineByTime():void
		{
			var areaMark:IAreaMark = _element as IAreaMark;
			_perStaute = areaMark.shineStatu;
			if (areaMark.shineStatu == 1)
			{
				outKey = setTimeout(stopShine, 15000);
				if (!isShineLight)
				{
					isShineLight = true;
					timeKey = setInterval(switchGlow, 1000);
				}
			}
		}

		/**
		 *最高开始闪烁
		 *
		 */
		override public function startShine():void
		{
			var areaMark:IAreaMark = _element as IAreaMark;
			_perStaute = areaMark.shineStatu;
			if (!isShineLight && areaMark.shineStatu == 2)
			{
				isShineLight = true;
				timeKey = setInterval(switchGlow, 1000);
			}
		}

		/**
		 *停止闪烁
		 *
		 */
		override public function stopShine():void
		{
			var areaMark:IAreaMark = _element as IAreaMark;
			if (areaMark.shineStatu != 2)
			{
				isShineLight = false;
				clearInterval(timeKey);
				clearTimeout(outKey);
				if (isOutLight)
				{
					switchGlow();
				}
			}
		}

		/**
		 *切换发光
		 *
		 */
		private function switchGlow():void
		{
			var areaMark:IAreaMark = _element as IAreaMark;
			if (areaMark.visible)
			{
				if (isOutLight)
				{
					unGlow(areaMark);
					isOutLight = false;
				}
				else
				{
					glow(areaMark);
					isOutLight = true;
				}
			}
		}

		/**
		 *去除发光
		 *
		 */
		private function unGlow(areaMark:IAreaMark):void
		{
			var unglow:Glow = new Glow();
			unglow.duration = 800;
			unglow.alphaFrom = 0.5;
			unglow.alphaTo = 1.0;
			unglow.blurXFrom = 35.0;
			unglow.blurXTo = 0.0;
			unglow.blurYFrom = 35.0;
			unglow.blurYTo = 0.0;
			unglow.color = (areaMark.lineColor != 0) ? areaMark.lineColor : uint(_defaultColor);
			unglow.play([this]);
		}

		/**
		 *添加发光
		 *
		 */
		private function glow(areaMark:IAreaMark):void
		{
			var glow:Glow = new Glow();
			glow.duration = 800;
			glow.alphaFrom = 1.0;
			glow.alphaTo = 0.5;
			glow.blurXFrom = 0.0;
			glow.blurXTo = 35.0;
			glow.blurYFrom = 0.0;
			glow.blurYTo = 35.0;
			glow.color = (areaMark.lineColor != 0) ? areaMark.lineColor : uint(_defaultColor);
			glow.play([this]);
		}

		/**
		 *计算位置(首次初始时,读取模型中的数据,初始化渲染器的位置和大小)
		 * @param areaMark 标记对象
		 *
		 */
		protected function initPosition(areaMark:IAreaMark):void
		{
			this.x = areaMark.x;
			this.y = areaMark.y
			this.width = areaMark.width;
			this.height = areaMark.height;
		}

		/**
		 * 画图形
		 * @param areaMark 标记对象
		 *
		 */
		protected function drawShape(areaMark:IAreaMark):void
		{
			throw new Error("AreaMarkRenderer.drawShape must be impletemented!");
		}

		/**
		 *画标签
		 * @param areaMark 标记对象
		 *
		 */
		protected function drawLabelText(areaMark:IAreaMark):void
		{
			if (_label == null)
			{
				_label = new Label();
				//_label.width = areaMark.width;
				//_label.setStyle("fontStyle", "Tahoma");
				_label.setStyle("fontSize", 12);
				_label.setStyle("color", "0xFFFFFF");
				_label.setStyle("textAlign", "center");
				_label.setStyle("verticalCenter", "1");
				_label.setStyle("verticalAlign", "middle");
				_label.setStyle("lineBreak","explicit");
			}
			if (!StringUtils.isEmpty(areaMark.text))
			{
				_label.text = areaMark.text;
			}
			
			//设置偏移量
			_label.x = (this.width - _label.text.length * 4.5)/2;
			
			this.addElement(_label);
		}
	}
}