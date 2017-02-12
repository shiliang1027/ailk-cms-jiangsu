package com.linkage.module.cms.general.monitor.base.utils
{
	
	import com.linkage.module.cms.common.columnar.ColumnarLabel;
	import com.linkage.module.cms.common.columnar.ColumnarNode;
	import com.linkage.module.cms.general.monitor.base.core.element.AreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.renderer.AreaMarkRenderer;
	import com.linkage.module.cms.general.monitor.common.map.MapLabel;
	import com.linkage.module.cms.general.monitor.common.map.MapNode;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.controls.Button;
	import mx.controls.Label;



	public class FlexViewUtil
	{
		/**
		 * 查找目标对象(或其父对象)是那一种元素对象,找不到返回空
		 * @param target
		 * @return
		 *
		 */
		public static function findTargetElement(target:Object):IAreaMark
		{
			if (target == null)
			{
				return null;
			}

			while (!(target is AreaMarkRenderer))
			{
				target = target.parent;

				if (target == null || target == target.parent)
				{
					return null;
				}
			}
			var renderer:AreaMarkRenderer = target as AreaMarkRenderer;

			if (renderer != null)
			{
				return renderer.element as AreaMark;
			}
			else
			{
				return null;
			}
		}

		/**
		 * 查找目标对象(或其父对象)是那一种元素对象,找不到返回空
		 * @param target
		 * @return
		 *
		 */
		public static function findTargetLabel(target:Object):Label
		{
			if (target == null)
			{
				return null;
			}

			while (!(target is Label))
			{
				target = target.parent;

				if (target == null || target == target.parent)
				{
					return null;
				}
			}
			return target as Label;
		}

		/**
		 * 查找目标对象(或其父对象)是那一种元素对象,找不到返回空
		 * @param target
		 * @return
		 *
		 */
		public static function findTargetButton(target:Object):Button
		{
			if (target == null)
			{
				return null;
			}

			while (!(target is Button))
			{
				target = target.parent;

				if (target == null || target == target.parent)
				{
					return null;
				}
			}
			return target as Button;
		}

		/**
		 * 查找目标对象(或其父对象)是那一种元素对象,找不到返回空
		 * @param target
		 * @return
		 *
		 */
		public static function findTargetMapNode(target:Object):MapNode
		{
			if (target == null)
			{
				return null;
			}

			while (!(target is MapNode))
			{
				target = target.parent;

				if (target == null || target == target.parent)
				{
					return null;
				}
			}
			return target as MapNode;
		}

		/**
		 * 查找目标对象(或其父对象)是那一种元素对象,找不到返回空
		 * @param target
		 * @return
		 *
		 */
		public static function findTargetMapLabel(target:Object):MapLabel
		{
			if (target == null)
			{
				return null;
			}

			while (!(target is MapLabel))
			{
				target = target.parent;

				if (target == null || target == target.parent)
				{
					return null;
				}
			}
			return target as MapLabel;
		}

		/**
		 * 查找目标对象(或其父对象)是那一种元素对象,找不到返回空
		 * @param target
		 * @return
		 *
		 */
		public static function findTargetColumnarNode(target:Object):ColumnarNode
		{
			if (target == null)
			{
				return null;
			}

			while (!(target is ColumnarNode))
			{
				target = target.parent;

				if (target == null || target == target.parent)
				{
					return null;
				}
			}
			return target as ColumnarNode;
		}

		/**
		 * 查找目标对象(或其父对象)是那一种元素对象,找不到返回空
		 * @param target
		 * @return
		 *
		 */
		public static function findTargetColumnarLabel(target:Object):ColumnarLabel
		{
			if (target == null)
			{
				return null;
			}

			while (!(target is ColumnarLabel))
			{
				target = target.parent;

				if (target == null || target == target.parent)
				{
					return null;
				}
			}
			return target as ColumnarLabel;
		}

		/**
		 * 找到鼠标的位置
		 * @param event 鼠标事件
		 * @param parent 以哪个对象作为基准的位置
		 * @return
		 *
		 */
		public static function findMousePoint(event:MouseEvent, parent:DisplayObjectContainer):Point
		{
			var areaMark:IAreaMark = findTargetElement(event.target);
			var x:Number = event.localX;
			var y:Number = event.localY;
			if (areaMark != null)
			{
				var point:Point = findRelativeLocation(event.target as DisplayObjectContainer, parent);
				x += point.x;
				y += point.y;
			}
			var p:Point = new Point(x, y);

			return p;
		}

		/**
		 * 获取父子两对象的相对位置
		 * @param child 子对象
		 * @param parent 父对象
		 * @param point 初始化位置坐标
		 * @return
		 *
		 */
		public static function findRelativeLocation(child:DisplayObjectContainer, parent:DisplayObjectContainer, point:Point = null):Point
		{
			if (point == null)
			{
				point = new Point(0, 0);
			}

			point.x += child.x;
			point.y += child.y;
			if (child.parent != parent)
			{
				findRelativeLocation(child.parent, parent, point);
			}
			return point;
		}
	}
}