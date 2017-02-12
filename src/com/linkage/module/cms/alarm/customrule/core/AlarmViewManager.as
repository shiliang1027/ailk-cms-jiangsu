package com.linkage.module.cms.alarm.customrule.core
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.alarm.customrule.component.RuleAlarmView;
	import com.linkage.module.cms.alarm.customrule.component.mdi.WindowManager;
	import com.linkage.module.cms.alarm.customrule.data.CustomRuleData;
	import com.linkage.module.cms.alarm.customrule.data.CustomRuleDataImp;
	import com.linkage.module.cms.alarm.customrule.params.CustomRuleParams;
	import com.linkage.module.cms.alarm.framework.common.util.AlarmUtil;
	import com.linkage.module.cms.alarm.framework.controller.AlarmAction;
	import com.linkage.module.cms.alarm.framework.controller.fo.AlarmParamFo;
	import com.linkage.module.cms.alarm.framework.module.dao.mo.AlarmParamMo;
	
	import flash.external.ExternalInterface;
	import flash.utils.setTimeout;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.rpc.events.FaultEvent;

	/**
	 *视图管理器
	 * @author mengqiang
	 *
	 */
	public class AlarmViewManager
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger = Log.getLoggerByClass(AlarmViewManager);
		/**
		 *自定义窗口参数
		 */
		private var _customRuleParams:CustomRuleParams = null;
		/**
		 *自定义窗口数据接口
		 */
		private var _customRuleData:CustomRuleData = null;
		/**
		 *视图容器管理
		 */
		protected var _windowManager:WindowManager = null;

		public function AlarmViewManager(params:Object, windowManager:WindowManager)
		{
			log.info("初始化自定义或当班人员窗口");
			_windowManager = windowManager;
			_customRuleParams = new CustomRuleParams(params);
			_customRuleData = new CustomRuleDataImp(_customRuleParams.mapInfo);
		}

		/**
		 *初始化视图
		 *
		 */
		public function initView(alarmAction:AlarmAction, success:Function):void
		{
			//1.初始化窗口
			var alarmParamMo:AlarmParamMo = alarmAction.alarmParamMo;
			var alarmParamFo:AlarmParamFo = alarmAction.alarmParamFo;
			var viewLen:int = alarmParamMo.viewJsons.length;
			if (viewLen != 1)
			{
				var mesInfo:String = (viewLen == 0) ? "您尚未配置视图，是否现在配置?" : "您有多个视图，是否选择要展示视图?";
				AlarmUtil.showMessage(mesInfo, "消息", Alert.OK | Alert.CANCEL, null, function(event:CloseEvent):void
					{
						if (event.detail == Alert.OK)
						{
							var baseUrl:String = alarmParamFo.baseURL;
							var moduleKey:String = alarmParamFo.moduleKey;
							//var url:String = baseUrl + "/warn/view/config/warnViewConfAction!initWarnView.action?hangToolBar=yes&permitPublic=true&viewKind=" + moduleKey;
							var url:String = baseUrl + "/warn/view/set/alarmSetAction!initWarnView.action?tab=" + moduleKey;
							ExternalInterface.call("function(){window.open('" + url + "','','resizable=yes,toolbar=no')}");
						}
					});
				//执行回调函数
				success.call(this);
			}
			else
			{
				var columns:int = alarmParamMo.windowNum;
				var winnums:int = alarmParamMo.winJsons.length;
				_windowManager.initParam(columns, winnums);
				createWindow(alarmAction, success, 0);
			}
		}

		//创建窗口
		private function createWindow(alarmAction:AlarmAction, success:Function, index:int):void
		{
			var winJsons:Array = alarmAction.alarmParamMo.winJsons;
			if (index == winJsons.length)
			{
				//处理历史遗留问题windowD
				_windowManager.dealWindowDepth();
				//执行回调函数
				success.call(this);

				return;
			}
			var window:Object = winJsons[index++];
			var view:RuleAlarmView = createView();
			view.windowX = window.windowX;
			view.windowY = window.windowY;
			view.windowW = window.windowW;
			view.windowH = window.windowH;
			view.windowId = window.windowId;
			view.windowD = window.windowDepth;
//			view.windowD = index;
			view.windowKey = window.windowUniquekey;
			view.windowName = window.windowName;
			view.childViewKey = window.childviewkey;
			view.childViewName = window.childviewname;
			view.alarmAction = alarmAction;
			view.initWindow();

			//出现两个以上才布局
			if (index > 0)
			{
				if (view.windowD > 0)
				{
					_windowManager.orderWindow();
				}
				else
				{
					_windowManager.tile();
				}
			}

			//设置2s后执行
			setTimeout(createWindow, 1500, alarmAction, success, index);
		}

		/**
		 *创建窗口视图
		 * @param index 视图索引
		 * @return
		 *
		 */
		private function createView():RuleAlarmView
		{
			var view:RuleAlarmView = new RuleAlarmView();
			_windowManager.add(view);
			return view;
		}

		/**
		 *保存窗口
		 *
		 */
		public function saveWindow():void
		{
			//1.拼装参数
			var params:Object = new Object();
			params["wins"] = _windowManager.getWindowParams();

			//2.保存坐标
			_customRuleData.saveWindowXY(params, function(result:String):void
				{
					if (result == "ok")
					{
						Alert.show("保存窗口位置成功!");
					}
				}, function(event:FaultEvent):void
				{
					Alert.show("保存窗口位置失败!");
					log.info("保存窗口位置失败!" + event.message);
				});
		}
	}
}