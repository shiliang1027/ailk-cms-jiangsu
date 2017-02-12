package com.linkage.module.cms.perfmonitor.monitor.alarm.component.mdi
{
	import com.linkage.system.component.panel.Window;

	import flash.events.Event;
	import flash.events.MouseEvent;

	import mx.logging.ILogger;
	import mx.logging.Log;

	import spark.components.Group;

	/**
	 *窗口管理
	 * @author mengqiang
	 *
	 */
	public class WindowManager extends Group
	{
		//日志记录器
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.perfmonitor.monitor.alarm.component.mdi.WindowManager");
		//窗口数组
		private var windowArray:Array=[];

		public function WindowManager()
		{
			addEventListener(Event.RESIZE, windowResize);
		}

		//窗口大小
		private function windowResize(event:Event):void
		{
			tile();
		}

		//添加窗口
		public function set addwindows(array:Array):void
		{
			for each (var window:Window in array)
			{
				addElement(window);
				windowArray.push(window);
				window.addEventListener(MouseEvent.MOUSE_DOWN, windowMouseDown);
			}
		}

		//平铺布局
		public function tile():void
		{
			//设置窗口1位置
			var window1:Window=windowArray[0] as Window;
			if (window1 != null)
			{
				window1.x=0;
				window1.y=0;
			}
			//设置窗口2位置
			var window2:Window=windowArray[1] as Window;
			if (window2 != null)
			{
				window2.x=0;
				window2.y=Number(Number(height / 3).toFixed(2));
			}
			//设置窗口3位置
			var window3:Window=windowArray[2] as Window;
			if (window3 != null)
			{
				window3.x=0;
				window3.y=Number(Number((height * 2) / 3).toFixed(2));
			}
		}

		//窗口聚焦
		private function windowMouseDown(event:MouseEvent):void
		{
			var countPanel:Window=event.currentTarget as Window;
			if (countPanel == null || getElementIndex(countPanel) == numElements - 1)
			{
				return;
			}
			removeElement(countPanel);
			addElement(countPanel);
		}
	}
}