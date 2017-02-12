package com.linkage.module.cms.common.columnar
{
	import mx.collections.ArrayCollection;
	import mx.effects.AnimateProperty;
	import mx.effects.Move;

	import spark.components.Group;

	public class ColumnarWork extends Group
	{
		//移动效果
		private var _move:Move = null;
		//动画持续时间
		private var _duration:int = 3000;
		//柱状图容器
		private var _columnarBox:ColumnarBox = null;
		//动画效果
		private var _animate:AnimateProperty = null;
		//柱状图显示容器
		private var _columnarGroup:Group = null;
		//柱状图配置信息
		private var _columnarConfig:ColumnarConfig = null;
		//柱状图地区ID数组
		private var _areaIdArray:ArrayCollection = new ArrayCollection();

		public function ColumnarWork()
		{
			_move = new Move();
			_columnarGroup = new Group();
			addElement(_columnarGroup);
			_columnarBox = new ColumnarBox();
			_animate = new AnimateProperty();
			initAnimatePropertyParam();
			_columnarConfig = new ColumnarConfig();
			parseColumnar();
		}

		/**
		 *解析柱状图
		 *
		 */
		public function parseColumnar():void
		{
			var areaArray:ArrayCollection = _columnarConfig.configArray;
			for each (var areaObj:Object in areaArray)
			{
				//1.创建柱状图
				var columnarNode:ColumnarNode = new ColumnarNode();
				columnarNode.id = areaObj.id;
				columnarNode.x = int(areaObj.x);
				columnarNode.y = int(areaObj.y);
				columnarNode.width = _columnarConfig.width;
				columnarNode.color = _columnarConfig.color;
				_columnarBox.add(columnarNode);
				//2.创建标签
				var columnarLabel:ColumnarLabel = new ColumnarLabel();
				columnarLabel.id = areaObj.id + "_label";
				columnarLabel.x = int(areaObj.x);
				columnarLabel.y = int(areaObj.y);
				_columnarBox.add(columnarLabel);
			}
		}

		/**
		 *画柱状图
		 * @param dataArray 数据数组
		 * @param max 整数为:数据中最大值，小数为:1
		 * @param expandMultiple 扩大倍数
		 * @param isPercent 是否百分数
		 *
		 */
		public function drawColumnarImages(dataArray:Array, max:Number, expandMultiple:Number, isPercent:Boolean):void
		{
			_areaIdArray.removeAll();
			var areaId:String = null;
			for (areaId in dataArray)
			{
				var coluHeight:Number = ColumnarUtil.countHeight(dataArray[areaId], max, _columnarConfig.height);
				var columnarNode:ColumnarNode = _columnarBox.getElementById(areaId) as ColumnarNode;
				columnarNode.height = coluHeight;
				columnarNode.drawDefaultColumnar();
				//columnarNode.drawColumnar();
				var columnarLabel:ColumnarLabel = _columnarBox.getElementById(areaId + "_label") as ColumnarLabel;
				columnarLabel.expandMultiple = expandMultiple;
				columnarLabel.showValue = dataArray[areaId];
				columnarLabel.remoteNum = coluHeight;
				columnarLabel.isPercent = isPercent;
				_areaIdArray.addItem(areaId);
			}
		}

		/**
		 *是否显示
		 * @param flag true：显示 false：不显示
		 *
		 */
		public function showHide(flag:Boolean):void
		{
			_columnarGroup.removeAllElements();
			if (flag)
			{
				var areaId:String = null;
				//1.增加柱状图
				for each (areaId in _areaIdArray)
				{
					var columnarNode:ColumnarNode = _columnarBox.getElementById(areaId) as ColumnarNode;
					_columnarGroup.addElement(columnarNode);
					_animate.play([columnarNode]);
				}
				//2.增加标签
				for each (areaId in _areaIdArray)
				{
					var columnarLabel:ColumnarLabel = _columnarBox.getElementById(areaId + "_label") as ColumnarLabel;
					_columnarGroup.addElement(columnarLabel);
					columnarLabel.showValueChange(_duration);
					initMoveParam(columnarLabel.remoteNum, columnarLabel.coordY);
					_move.play([columnarLabel]);
				}
			}
		}

		/**
		 *初始化动画效果
		 *
		 */
		private function initAnimatePropertyParam():void
		{
			_animate.property = "scaleY";
			_animate.fromValue = 0;
			_animate.toValue = 1;
			_animate.duration = _duration;
		}

		/**
		 *初始化动画效果
		 * @param remote 偏移量
		 * @param coordY Y轴原始坐标
		 *
		 */
		private function initMoveParam(remote:Number, coordY:Number):void
		{
			_move.yBy = -remote;
			_move.yFrom = coordY;
			_move.duration = _duration;
		}

		public function get columnarBox():ColumnarBox
		{
			return _columnarBox;
		}

		public function set columnarBox(value:ColumnarBox):void
		{
			_columnarBox = value;
		}

		public function get columnarConfig():ColumnarConfig
		{
			return _columnarConfig;
		}

		public function set columnarConfig(value:ColumnarConfig):void
		{
			_columnarConfig = value;
		}
	}
}