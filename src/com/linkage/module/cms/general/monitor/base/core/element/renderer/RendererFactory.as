package com.linkage.module.cms.general.monitor.base.core.element.renderer
{
	import com.linkage.module.cms.general.monitor.base.core.element.IElement;

	/**
	 * 渲染器工厂类
	 * @author duangr
	 *
	 */
	public class RendererFactory
	{
		/**
		 * 矩形
		 */
		public static const SHAPE_RECTANGLE:String="rectangle";
		/**
		 * 三角形
		 */
		public static const SHAPE_TRIANGLE:String="triangle";
		/**
		 * 梯形
		 */
		public static const SHAPE_TRAPEZOID:String="trapezoid";
		/**
		 * 圆形
		 */
		public static const SHAPE_CIRCLE:String="circle";
		/**
		 * 图片
		 */
		public static const SHAPE_IMAGE:String="image";
		/**
		 * 闪电形
		 */
		public static const SHAPE_LIGHTNING:String="lightning";
		/**
		 * 倒三角形
		 */
		public static const SHAPE_OPPOSITETRIANGLE:String = "opp_triangle";
		/**
		 * 五角形
		 */
		public static const SHAPE_PENTAGRAM:String = "pentagram";
		/**
		 * 箭头形
		 */
		public static const SHAPE_ARROW:String = "arrow";
		/**
		 * 同心圆
		 */
		public static const SHAPE_CONCIRCLE:String = "ConcentricCircles";
		/**
		 * 菱形
		 */
		public static const SHAPE_LOZENGE:String = "lozenge";

		/**
		 * 构造AreaMark渲染器对象
		 * @param type
		 * @param e
		 * @return
		 *
		 */
		public static function buildAreaMarkRenderer(type:String, e:IElement):AreaMarkRenderer
		{
			var renderer:AreaMarkRenderer=null;
			switch (type)
			{
				case SHAPE_RECTANGLE:
					// 矩形渲染器
					renderer=new RectangleRenderer(e);
					break;
				case SHAPE_CIRCLE:
					// 圆形渲染器
					renderer=new CircleRenderer(e);
					break;
				case SHAPE_CONCIRCLE:
					// 圆形渲染器
					renderer=new ConcentricCirclesRenderer(e);
					break;
				case SHAPE_TRIANGLE:
					// 三角形渲染器
					renderer=new TriangleRenderer(e);
					break;
				case SHAPE_LIGHTNING:
					// 闪电渲染器
					renderer=new LightningRenderer(e);
					break;
				case SHAPE_TRAPEZOID:
					// 梯形渲染器
					renderer=new TrapezoidRenderer(e);
					break;
				case SHAPE_IMAGE:
					// 图片渲染器
					renderer=new IconImageRenderer(e);
					break;
				case SHAPE_OPPOSITETRIANGLE:
					// 倒三角形渲染器
					renderer=new OppositeTriangleRenderer(e);
					break;
				case SHAPE_ARROW:
					// 箭头形渲染器
					renderer=new ArrowRenderer(e);
					break;
				case SHAPE_PENTAGRAM:
					// 箭头形渲染器
					renderer=new PentagramRenderer(e);
					break;
				case SHAPE_LOZENGE:
					// 箭头形渲染器
					renderer=new LozengeRenderer(e);
					break;
				default:
					// 矩形渲染器
					renderer=new RectangleRenderer(e);
			}
			return renderer;
		}
	}
}