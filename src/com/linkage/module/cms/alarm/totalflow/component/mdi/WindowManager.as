package com.linkage.module.cms.alarm.totalflow.component.mdi
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.system.component.panel.Window;
	import com.linkage.system.component.panel.events.WindowEvent;
	
	import spark.components.VGroup;

	/**
	 *窗口管理
	 * @author mengqiang
	 *
	 */
	public class WindowManager extends VGroup
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.customrule.component.mdi.WindowManager");
		//窗口数组
		private var windowArray:Array=[];

		public function WindowManager()
		{
			gap=2;
		}

		//添加窗口
		public function set addwindows(array:Array):void
		{
			for each (var window:Window in array)
			{
				addElement(window);
				windowArray.push(window);
				window.addEventListener(WindowEvent.MAXIMIZE, windowMaximize);
				window.addEventListener(WindowEvent.MINIMIZE, windowMinimize);
				window.addEventListener(WindowEvent.RESTORE, windowRestore);
			}
		}

		//窗口最大化
		private function windowMaximize(event:WindowEvent):void
		{
			//还原其他窗口
			setOtherWindowVisible(false, event.target as Window);
		}

		//窗口最小化
		private function windowMinimize(event:WindowEvent):void
		{
			(event.target as Window).percentWidth=100;
			//还原其他窗口
			setOtherWindowVisible(true, event.target as Window);
		}

		//窗口还原
		private function windowRestore(event:WindowEvent):void
		{
			//总流水
			if ((event.target as Window).id == "alarmflowPanel")
			{
				(event.target as Window).percentHeight=100;
			}
			(event.target as Window).percentWidth=100;
			//还原其他窗口
			setOtherWindowVisible(true, event.target as Window);
		}

		//设置对象是否隐藏
		private function setOtherWindowVisible(isVisible:Boolean, window:Window):void
		{
			windowArray.forEach(function(win:Window, index:int, array:Array):void
				{
					if (window.id != win.id)
					{
						win.visible=isVisible;
						win.includeInLayout=isVisible;
					}
				});
		}
	}
}