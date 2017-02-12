package com.linkage.module.cms.common.columnar
{
	import com.linkage.module.cms.common.Constants;

	import flash.utils.clearInterval;
	import flash.utils.setInterval;

	import mx.controls.Label;

	public class ColumnarLabel extends Label
	{
		//定时器key
		private var _timeKey:uint = 0;
		//数据原始Y坐标
		private var _coordY:Number = 0;
		//标签偏移量
		private var _remoteNum:Number = 0;
		//显示数量
		private var _showValue:Number = 0;
		//增加的数据
		private var _addToValue:Number = 0;
		//是否移动
		private var _isMove:Boolean = false;
		//是否百分数
		private var _isPercent:Boolean = false;
		//扩大倍数
		private var _expandMultiple:Number = 0;

		public function ColumnarLabel()
		{
			super();
		}

		/**
		 *展示值
		 * @param duration
		 *
		 */
		public function showValueChange(duration:int):void
		{
			_addToValue = 0;
			clearInterval(_timeKey);
			text = isPercent ? "0%" : "0";
			var cycleNum:int = duration / 1000;
			cycleNum = (cycleNum < 1) ? 1 : cycleNum;
			var lastValue:Number = showValue * expandMultiple;
			var numStep:Number = ColumnarUtil.countStep(lastValue, cycleNum, 0);
			numStep = (numStep < 1) ? 1 : numStep;
			_timeKey = setInterval(function():void
				{
					_addToValue = Number(ColumnarUtil.formart(String(_addToValue + numStep), isPercent ? 2 : 0));
					if (_addToValue > lastValue)
					{
						resetParam(lastValue);
						return;
					}
					text = _addToValue + (isPercent ? "%" : "");
				}, 1000);
		}

		//重置参数
		private function resetParam(lastValue:Number):void
		{
			_addToValue = 0;
			clearInterval(_timeKey);
			text = lastValue + (isPercent ? "%" : "");
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

		public function get remoteNum():Number
		{
			return _remoteNum;
		}

		public function set remoteNum(value:Number):void
		{
			_remoteNum = value;
		}

		public function get showValue():Number
		{
			return _showValue;
		}

		public function set showValue(value:Number):void
		{
			_showValue = value;
		}

		public function get coordY():Number
		{
			return _coordY;
		}

		public function set coordY(value:Number):void
		{
			_coordY = value;
		}

		public function get expandMultiple():Number
		{
			return _expandMultiple;
		}

		public function set expandMultiple(value:Number):void
		{
			_expandMultiple = value;
		}

		public function get isPercent():Boolean
		{
			return _isPercent;
		}

		public function set isPercent(value:Boolean):void
		{
			_isPercent = value;
		}
	}
}