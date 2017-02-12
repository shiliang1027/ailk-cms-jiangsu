package com.linkage.module.cms.alarm.specialrule.source.server
{
	import com.linkage.module.cms.alarm.framework.controller.AlarmAction;
	import com.linkage.module.cms.alarm.framework.module.server.AlarmServerImp;
	import com.linkage.module.cms.alarm.framework.module.server.source.CustCollection;
	import com.linkage.module.cms.alarm.specialrule.source.server.core.SpecialWindow;
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	public class SpecialServerImp extends AlarmServerImp
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.specialrule.source.server.SpecialServerImp");

		public function SpecialServerImp(alarmAction:AlarmAction, collectClass:Class)
		{
			super(alarmAction, collectClass);
		}

		override public function initWindowSource():void
		{
			_alarmAction.alarmParamMo.winJsons.forEach(function(win:*, index:int, array:Array):void
				{
					var isCustWin:String=win.loadCustalarms;
					//集客的做特殊处理
					if (isCustWin == "1")
					{
						log.info("自定义流水--集客流水窗口--");
						_windowControllerMap.put(win.windowId, new SpecialWindow(win.windowId, _alarmAction, CustCollection));
					}
					else
					{
						log.info("自定义流水--普通流水窗口--");
						_windowControllerMap.put(win.windowId, new SpecialWindow(win.windowId, _alarmAction, _collectClass));
					}
				});
		}
	}
}