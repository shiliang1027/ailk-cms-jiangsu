package com.linkage.module.cms.alarm.relation.core
{
	import com.linkage.module.cms.alarm.framework.controller.AlarmAction;
	import com.linkage.module.cms.alarm.relation.RelationAlarmModule;
	import com.linkage.module.cms.alarm.relation.RelationContainer;
	import com.linkage.module.cms.alarm.relation.component.RelationWinAcross;
	import com.linkage.module.cms.alarm.relation.component.RelationWinView;
	import com.linkage.module.cms.alarm.relation.param.RelationParams;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.structure.map.Map;

	import mx.containers.ViewStack;
	import mx.core.UIComponent;

	import spark.components.NavigatorContent;

	public class RelationManager
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.relation.core.RelationManager");
		// 视图容器管理
		protected var _viewStack:ViewStack=null;
		//关联关系参数
		private var _relationParams:RelationParams=null;
		//窗口Map
		private var _windowMap:Map=null;

		public function RelationManager(viewStack:ViewStack, params:Object)
		{
			log.info("初始化关联关系窗口");
			_viewStack=viewStack;
			_windowMap=new Map();
			_relationParams=new RelationParams(params);
		}

		/**
		 *初始化矩阵视图
		 *
		 */
		public function initMatrixView(relationAlarm:RelationAlarmModule):RelationWinView
		{
			//初始化矩阵窗口
			for each (var windowObj:Object in _relationParams.windowKeyJsons)
			{
				var windowKey:String=windowObj.windowKey;
				var windowName:String=windowObj.windowName;
				var windowType:String=windowObj.windowType;
				if (windowType == "1")
				{
					var view:RelationWinView=new RelationWinView();
					createView(windowName, windowKey, view, _viewStack);
					var columnArray:Array=_relationParams.columnJsons[windowKey];
					view.relationMatrix.columnArray=columnArray;
					view.windowName=windowName;
					view.windonKey=windowKey;
					_windowMap.put(windowKey, view);
				}
				else
				{
					var relationWin:RelationWinAcross=new RelationWinAcross();
					relationWin.relationAlarm=relationAlarm;
					createView(windowName, windowKey, relationWin, _viewStack);
					for each (var childWin:Object in windowObj.children)
					{
						var childKey:String=childWin.windowKey;
						var childName:String=childWin.windowName;
						var childView:RelationWinView=new RelationWinView();
						createView(childName, childKey, childView, relationWin.myViewStack);
						var childColumn:Array=_relationParams.columnJsons[childKey];
						childView.relationMatrix.columnArray=childColumn;
						childView.windowName=childName;
						childView.windonKey=childKey;
						_windowMap.put(childKey, childView);
					}
				}
			}
			return _windowMap.get(RelationContainer.WINDOWNAME_SPECIALTYINNER);
		}

		/**
		 *初始化流水
		 * @param alarmAction
		 *
		 */
		public function initAlarmFlow(alarmAction:AlarmAction):void
		{
			//初始化各个流水
			alarmAction.alarmParamMo.winJsons.forEach(function(win:*, index:int, array:Array):void
				{
					var windowKey:String=win.windowUniquekey;
					var view:RelationWinView=_windowMap.get(windowKey);
					if (view != null)
					{
						view.windowId=win.windowId;
						view.alarmAction=alarmAction;
						view.initWindow();
					}
				});
		}

		/**
		 *创建窗口视图
		 */
		private function createView(windowName:String, windowKey:String, ui:UIComponent, viewStack:ViewStack):void
		{
			var navContent:NavigatorContent=new NavigatorContent();
			navContent.id=windowKey;
			navContent.label=windowName;
			navContent.addElement(ui);
			viewStack.addElement(navContent);
		}

		/**
		 *清空矩阵表格
		 */
		public function clearAllMatrixGrid():void
		{
			_windowMap.forEach(function(index:*, view:RelationWinView):void
				{
					if (view != null)
					{
						view.matrixGridClear();
					}
				});
		}
		public function get relationParams():RelationParams
		{
			return _relationParams;
		}
	}
}