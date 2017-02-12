package com.linkage.module.cms.alarm.customrule.component.mdi
{

	/**
	 *坐标对象
	 * @author mengqiang
	 *
	 */
	public class WindowPosition
	{
		//X轴坐标
		private var _coordX:Number=0;
		//Y轴坐标
		private var _coordY:Number=0;
		//是否在使用
		private var _isUse:Boolean=false;
		//窗口ID
		private var _windowId:String=null;

		public function set coordX(value:Number):void
		{
			_coordX=value;
		}

		public function get coordX():Number
		{
			return _coordX;
		}

		public function set coordY(value:Number):void
		{
			_coordY=value;
		}

		public function get coordY():Number
		{
			return _coordY;
		}

		public function set isUse(value:Boolean):void
		{
			_isUse=value;
		}

		public function get isUse():Boolean
		{
			return _isUse;
		}

		public function set windowId(value:String):void
		{
			_windowId=value;
		}

		public function get windowId():String
		{
			return _windowId;
		}
	}
}