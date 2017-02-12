package com.linkage.module.cms.groupclientalarm.relation.core
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.alarm.framework.controller.AlarmAction;
	import com.linkage.module.cms.groupclientalarm.relation.RelationAlarmModule;
	import com.linkage.module.cms.groupclientalarm.relation.component.RelationWinView;
	import com.linkage.module.cms.groupclientalarm.relation.param.RelationParams;

	public class RelationManager
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.relation.core.RelationManager");
		//关联关系参数
		private var _relationParams:RelationParams=null;
		// 试图容器
		private var _relationWinView:RelationWinView = null;

		public function RelationManager(relationWinView:RelationWinView,params:Object)
		{
			log.warn("初始化关联关系窗口");
			_relationWinView= relationWinView;
			_relationParams=new RelationParams(params);
		}

		/**
		 *初始化矩阵视图
		 *
		 */
		public function initMatrixView(relationAlarm:RelationAlarmModule):void
		{
			var windowKey:String="relationCust";
			var windowName:String="集团客户监控专题";
			var windowType:String = "1";
			
			log.warn("巧克力  windowType ==  windowName+"+windowName+"  windowKey= "+windowKey);
			var columnArray:Array=_relationParams.columnJsons[windowKey];
			_relationWinView.relationMatrix.columnArray=columnArray;
			_relationWinView.windowName=windowName;
			_relationWinView.windonKey=windowKey;
		}

		/**
		 *初始化流水
		 * @param alarmAction
		 *
		 */
		public function initAlarmFlow(alarmAction:AlarmAction):void
		{
			//初始化各个流水
			log.warn("巧克力 initAlarmFlow ！！");
			alarmAction.alarmParamMo.winJsons.forEach(function(win:*, index:int, array:Array):void
				{
					if(win.windowUniquekey =="relationCust")
					{
						_relationWinView.windowId=win.windowId;
						_relationWinView.alarmAction=alarmAction;
						_relationWinView.windonKey = win.windowUniquekey;
						_relationWinView.initWindow();
					}
				});
		}


		/**
		 *清空矩阵表格
		 */
		public function clearAllMatrixGrid():void
		{
			_relationWinView.matrixGridClear();
		}
		
		public function get relationParams():RelationParams
		{
			return _relationParams;
		}
	}
}