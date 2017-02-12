package com.linkage.module.cms.perfmonitor.monitor.alarm.core
{
	import com.linkage.module.cms.alarm.framework.controller.AlarmAction;
	import com.linkage.module.cms.perfmonitor.monitor.alarm.AlarmMonitorTest;
	import com.linkage.module.cms.perfmonitor.monitor.alarm.component.MonitorView;
	import com.linkage.module.cms.perfmonitor.monitor.alarm.data.MonitorData;
	import com.linkage.module.cms.perfmonitor.monitor.alarm.data.MonitorDataImp;
	import com.linkage.module.cms.perfmonitor.monitor.alarm.params.MonitorContainer;
	import com.linkage.module.cms.perfmonitor.monitor.alarm.params.MonitorParams;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.utils.Timer;

	import mx.logging.ILogger;
	import mx.logging.Log;

	/**
	 *监控控制类
	 * @author mengqiang
	 *
	 */
	public class MonitorAction extends EventDispatcher implements IEventDispatcher
	{
		//日志记录器
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.perfmonitor.monitor.alarm.core.MonitorAction");
		//设备性能
		private var _devPerf:MonitorView=null;
		//业务性能
		private var _servPerf:MonitorView=null;
		//专题监控
		private var _subMonitor:MonitorView=null;
		//监控数据
		private var _monitorData:MonitorData=null;
		//监控参数
		private var _monitorParams:MonitorParams=null;
		//加载设备性能定时器 Timer (10s)
		protected var _loadDataTimer:Timer=new Timer(10000);

		public function MonitorAction(params:Object)
		{
			_monitorParams=new MonitorParams(params);
			_monitorData=new MonitorDataImp(_monitorParams.mapInfo);
			_loadDataTimer.addEventListener(TimerEvent.TIMER, loadStatData);
		}

		//开始执行
		public function start():void
		{
			//初始化列
			initColumns();
			//赋值
			_devPerf.monitorAction=this;
			_devPerf.monitorData=_monitorData;
			_servPerf.monitorAction=this;
			_servPerf.monitorData=_monitorData;
			_subMonitor.monitorAction=this;
			_subMonitor.monitorData=_monitorData;
			//加载数据
			loadStatData(null);
			//开启定时器
			_loadDataTimer.start();
		}

		//视图点击
		public function viewClick(columnKey:String, rowKey:String, windonKey:String, ruleStr:String):void
		{
			log.info("视图点击columnKey=" + columnKey + ",rowKey=" + rowKey);
			if (columnKey == MonitorContainer.PARAMKEY_NAME && windonKey != MonitorContainer.PARAMKEY_SPECMONITORFLOWALARM) //进入相应菜单
			{
				var url:String=null;
				switch (rowKey)
				{
					case "1":
					case "2":
					case "7":
						url=_monitorParams.devPerfMenu[rowKey];
						break;
					case "41":
					case "42":
					case "43":
					case "44":
					case "45":
						url=_monitorParams.servPerfMenu;
				}
				log.info("弹出窗口URL=" + _monitorParams.context + url);
				navigateToURL(new URLRequest(_monitorParams.context + url), "_self");
			}
			else //重载告警
			{
				var ruleContent:String=ruleStr;
				switch (windonKey)
				{
					case MonitorContainer.PARAMKEY_DEVICEPMFLOWALARM:
						if (rowKey == "7")
						{
							ruleContent+="&(specialty=5|specialty=6)&alarmseverity=" + (columnKey == MonitorContainer.PARAMKEY_LEVEL1 ? "1" : "2");
						}
						else
						{
							ruleContent+="&specialty=" + rowKey + "&alarmseverity=" + (columnKey == MonitorContainer.PARAMKEY_LEVEL1 ? "1" : "2");
						}

						log.info("重载告警ruleStr=" + ruleContent);
						_devPerf.reloadAlarm(ruleContent);
						break;
					case MonitorContainer.PARAMKEY_BUSSPMFLOWALARM:
						ruleContent+="&buss_id=" + rowKey + "&alarmseverity=" + (columnKey == MonitorContainer.PARAMKEY_LEVEL1 ? "1" : "2");
						log.info("重载告警ruleStr=" + ruleContent);
						_servPerf.reloadAlarm(ruleContent);
						break;
					case MonitorContainer.PARAMKEY_SPECMONITORFLOWALARM:
						ruleContent+="&buss_id=" + rowKey;
						log.info("重载告警ruleStr=" + ruleContent);
						_subMonitor.reloadAlarm(ruleContent);
						break;
				}
			}
		}

		//初始化告警流水
		public function initAlarmFlow(alarmAction:AlarmAction):void
		{
			//初始化各个流水
			alarmAction.alarmParamMo.winJsons.forEach(function(win:*, index:int, array:Array):void
				{
					if (_devPerf.windonKey == win.windowUniquekey)
					{
						_devPerf.windowId=win.windowId;
						_devPerf.alarmAction=alarmAction;
						_devPerf.initWindow();
					}
					else if (_servPerf.windonKey == win.windowUniquekey)
					{
						_servPerf.windowId=win.windowId;
						_servPerf.alarmAction=alarmAction;
						_servPerf.initWindow();
					}
					else if (_subMonitor.windonKey == win.windowUniquekey)
					{
						_subMonitor.windowId=win.windowId;
						_subMonitor.alarmAction=alarmAction;
						_subMonitor.initWindow();
					}
				});
		}

		//获取集中性能监控首页数据
		private function loadStatData(event:TimerEvent=null):void
		{
			//本地运行
			if (_monitorParams.local)
			{
				var result:Object=AlarmMonitorTest.loadStatData();
				_devPerf.dataSource=result.equit;
				_servPerf.dataSource=result.buss;
				_subMonitor.dataSource=result.subject;
				return;
			}
			//服务器运行
			_monitorData.loadStatData(function(result:Object):void
				{
					_devPerf.dataSource=result.equit;
					_servPerf.dataSource=result.buss;
					_subMonitor.dataSource=result.subject;
				}, function():void
				{
					log.info("加载集中性能监控首页数据失败!");
				});
		}

		//初始化列
		private function initColumns():void
		{
			//设备性能
			_devPerf.columns=_monitorParams.statColumns[MonitorContainer.PARAMKEY_DEVPREF] as Array
			//业务性能
			_servPerf.columns=_monitorParams.statColumns[MonitorContainer.PARAMKEY_SERVPREF] as Array
			//专题监控
			_subMonitor.columns=_monitorParams.statColumns[MonitorContainer.PARAMKEY_SUBMONITOR] as Array
		}

		public function get monitorParams():MonitorParams
		{
			return _monitorParams;
		}

		public function set devPerf(value:MonitorView):void
		{
			_devPerf=value;
		}

		public function set servPerf(value:MonitorView):void
		{
			_servPerf=value;
		}

		public function set subMonitor(value:MonitorView):void
		{
			_subMonitor=value;
		}
	}
}