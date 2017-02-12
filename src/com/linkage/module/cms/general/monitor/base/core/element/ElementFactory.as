package com.linkage.module.cms.general.monitor.base.core.element
{
	import com.linkage.module.cms.general.monitor.base.core.element.renderer.RendererFactory;

	/**
	 * 元素工厂类
	 * @author duangr
	 *
	 */
	public class ElementFactory
	{
		/**
		 * 一级视图告警
		 */
		public static const LEVEL1WARN:String = "1";

		/**
		 * 一级视图核心网告警
		 */
		public static const LEVEL1COREWARN:String = "2";
		
		/**
		 * 一级视图无线网告警
		 */
		public static const LEVEL1WIRELESSWARN:String = "3";
		
		/**
		 * 一级视图传输网告警
		 */
		public static const LEVEL1TRANSWARN:String = "4";
		
		/**
		 * 一级视图动环告警
		 */
		public static const LEVEL1ENVWARN:String = "5";
		
		/**
		 * 一级视图数据网告警
		 */
		public static const LEVEL1DATAWARN:String = "6";
		
		/**
		 * 一级视图性能告警
		 */
		public static const LEVEL1PERWARN:String = "7";
		
		/**
		 * 一级视图投诉工单
		 */
		public static const LEVEL1COMPLAINTS:String = "8";
		
		/**
		 * 一级视图故障工单
		 */
		public static const LEVEL1FAULTFLOW:String = "9";
		
		/**
		 * 一级视图工程状态
		 */
		public static const LEVEL1WORKSTATE:String = "10";
		
		/**
		 * 图片（备用）
		 */
		public static const IMAGE:String = "999";
		
		/**
		 * 构造AreaMark对象
		 * @param mark
		 * @return
		 *
		 */
		public static function buildAreaMark(x:Number, y:Number, mark:IMark):IAreaMark
		{
			var shapeType:String = null;
			var areaMark:IAreaMark = null;
			switch (mark.type)
			{
				case LEVEL1WARN:
					areaMark = new ColorAreaMark();
					// 圆形渲染器
					shapeType = RendererFactory.SHAPE_CIRCLE;
					break;
				case LEVEL1COREWARN:
				case LEVEL1PERWARN:
					areaMark = new ColorAreaMark();
					// 矩形渲染器
					shapeType = RendererFactory.SHAPE_RECTANGLE;
					break;
				case LEVEL1WIRELESSWARN:
					areaMark = new IconAreaMark();
					// 五角星渲染器
					shapeType = RendererFactory.SHAPE_PENTAGRAM;
					break;
				case LEVEL1TRANSWARN:
					areaMark = new IconAreaMark();
					// 同心圆渲染器
					shapeType = RendererFactory.SHAPE_CONCIRCLE;
					break;
				case LEVEL1ENVWARN:
					areaMark = new IconAreaMark();
					// 菱形渲染器
					shapeType = RendererFactory.SHAPE_LOZENGE;
					break;
				case LEVEL1DATAWARN:
					areaMark = new IconAreaMark();
					// 三角行渲染器
					shapeType = RendererFactory.SHAPE_TRIANGLE;
					break;
				case LEVEL1COMPLAINTS:
					areaMark = new IconAreaMark();
					// 倒三角行渲染器
					shapeType = RendererFactory.SHAPE_OPPOSITETRIANGLE;
					break;
				case LEVEL1FAULTFLOW:
					areaMark = new IconAreaMark();
					// 箭头渲染器
					shapeType = RendererFactory.SHAPE_ARROW;
					break;
				case LEVEL1WORKSTATE:
					areaMark = new IconAreaMark();
					// 梯形渲染器
					shapeType = RendererFactory.SHAPE_TRAPEZOID;
					break;
				case IMAGE:
					areaMark = new IconAreaMark();
					// 图片渲染器
					shapeType = RendererFactory.SHAPE_IMAGE;
					break;
				default:
					areaMark = new ColorAreaMark();
					// 圆形渲染器
					shapeType = RendererFactory.SHAPE_CIRCLE;
			}
			areaMark.x = x;
			areaMark.y = y;
			areaMark.type = mark.type;
			areaMark.name = mark.name;
			areaMark.text = mark.text;
			areaMark.color1 = mark.color1;
			areaMark.color2 = mark.color2;
			areaMark.lineColor = mark.lineColor;
			areaMark.width = mark.width;
			areaMark.height = mark.height;
			areaMark.visible = mark.visible;
			areaMark.renderer = RendererFactory.buildAreaMarkRenderer(shapeType, areaMark);
			return areaMark;
		}
	}
}