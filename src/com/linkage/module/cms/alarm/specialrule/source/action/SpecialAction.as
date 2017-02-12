package com.linkage.module.cms.alarm.specialrule.source.action
{
	import com.linkage.module.cms.alarm.framework.controller.AlarmAction;
	import com.linkage.module.cms.alarm.specialrule.source.server.SpecialServerImp;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	public class SpecialAction extends AlarmAction
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.specialrule.source.action.SpecialAction");

		public function SpecialAction(param:Object, collectClass:Class)
		{
			super(param, collectClass);
		}

		//初始化告警服务类
		override public function initAlarmServer(collectClass:Class):void
		{
			_alarmServer=new SpecialServerImp(this, collectClass);
		}
	}
}