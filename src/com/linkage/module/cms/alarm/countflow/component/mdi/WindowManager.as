package com.linkage.module.cms.alarm.countflow.component.mdi
{
	import com.linkage.system.component.panel.Window;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;

	import mx.events.FlexEvent;
	import mx.states.OverrideBase;

	import spark.components.Group;

	/**
	 *窗口管理
	 * @author mengqiang
	 *
	 */
	public class WindowManager extends Group
	{
		//日志记录器
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.alarm.countflow.component.mdi.WindowManager");
		//窗口数组
		private var windowArray:Array = [];

		private var _versionType:String = "3";

		public function WindowManager()
		{
//			addEventListener(Event.RESIZE, tile);
		}

		//添加窗口
		public function set addwindows(array:Array):void
		{
			for each(var window:Window in array)
			{
				addElement(window);
				windowArray.push(window);
//				window.addEventListener(MouseEvent.MOUSE_DOWN, windowMouseDown);
			}
		}

		//平铺布局
		public function tile(event:Event=null):void
		{
			var window1:Window = windowArray[0] as Window;
			var window2:Window = windowArray[1] as Window;
			var window3:Window = windowArray[2] as Window;

			if(_versionType == "2")
			{
				//设置窗口1位置
				if(window1 != null)
				{
					window1.x = 0;
					window1.y = 0;
				}
				//设置窗口2位置
				if(window2 != null)
				{
					window2.x = 0;
					window2.y = window1.height;
//					window2.y = Number(Number(height / 2).toFixed(2));
				}
				//设置窗口3位置
				if(window3 != null)
				{
					window3.x = width / 2;
					window3.height = window2.height;
					window3.y = window1.height;
//					window3.y = Number(Number(height / 2).toFixed(2));
				}
			}
			else if(_versionType == "3")
			{
				//设置窗口1位置
				if(window1 != null)
				{
					window1.x = 0;
					window1.y = 0;
				}
				//设置窗口2位置
				if(window2 != null)
				{
					window2.x = 0;
					window2.y = Number(Number(height / 3).toFixed(2));
				}
				//设置窗口3位置
				if(window3 != null)
				{
					window3.x = 0;
					window3.y = Number(Number(height * 2 / 3).toFixed(2));
				}
			}
		}

		//窗口聚焦
		private function windowMouseDown(event:MouseEvent):void
		{
			var countPanel:Window = event.currentTarget as Window;
			if(countPanel == null || getElementIndex(countPanel) == numElements - 1)
			{
				return;
			}

			this.swapElementsAt(this.getChildIndex(countPanel), this.numChildren - 1);
		}

		public function get versionType():String
		{
			return _versionType;
		}

		public function set versionType(value:String):void
		{
			_versionType = value;
		}
	}
}

