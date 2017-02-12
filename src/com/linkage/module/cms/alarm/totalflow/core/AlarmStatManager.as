package com.linkage.module.cms.alarm.totalflow.core
{
	import com.linkage.module.cms.alarm.framework.common.event.AlarmDataEvent;
	import com.linkage.module.cms.alarm.framework.common.event.SoundEvent;
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.alarm.framework.controller.AlarmAction;
	import com.linkage.module.cms.alarm.framework.view.AlarmView;
	import com.linkage.module.cms.alarm.framework.view.resource.imagesclass.IconParam;
	import com.linkage.module.cms.alarm.totalflow.AlarmContainer;
	import com.linkage.module.cms.alarm.totalflow.TotalflowAlarmModule;
	import com.linkage.module.cms.alarm.totalflow.component.AlarmStatDetail;
	import com.linkage.module.cms.alarm.totalflow.component.AlarmStatList;
	import com.linkage.module.cms.alarm.totalflow.component.AlarmStatPanel;
	import com.linkage.module.cms.alarm.totalflow.component.TreeDiv;
	import com.linkage.module.cms.alarm.totalflow.data.DataManager;
	import com.linkage.module.cms.alarm.totalflow.data.IDataManager;
	import com.linkage.module.cms.alarm.totalflow.event.StatEvent;
	import com.linkage.module.cms.alarm.totalflow.param.StatParam;
	import com.linkage.module.cms.alarm.totalflow.util.TotalUtil;
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.SoundChannel;
	import flash.utils.Timer;

	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.controls.Image;
	import mx.core.SoundAsset;

	/**
	 *告警统计管理
	 * @author mengqiang
	 *
	 */
	public class AlarmStatManager
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.totalflowalarm.core.AlarmStatManager");
		/**
		 *按专业+概况统计的面板
		 */
		protected var _specGeneralStatPanel:AlarmStatPanel=null;
		/**
		 *按专业+属地统计的面板
		 */
		protected var _specCityStatPanel:AlarmStatPanel=null;
		/**
		 *告警统计详情
		 */
		protected var _alarmStatDetail:AlarmStatDetail=null;
		/**
		 *总流水面板
		 */
		protected var _totalflowAlarm:TotalflowAlarmModule=null;
		/**
		 *告警统计列表
		 */
		protected var _alarmStatList:AlarmStatList=null;
		/**
		 *数据接口
		 */
		protected var _dataManager:IDataManager=null;
		/**
		 *告警控制器
		 */
		protected var _alarmAction:AlarmAction=null;
		/**
		 *告警视图
		 */
		protected var _activeView:AlarmView=null;
		/**
		 * 区域树DIV
		 */
		protected var _treeDiv:TreeDiv=null;
		/**
		 *统计参数
		 */
		protected var _statParam:StatParam=null;
		/**
		 *加载统计告警定时器 Timer (10s)
		 */
		protected var _loadStatTimer:Timer=new Timer(10000);
		/**
		 *加载工单统计告警定时器 Timer (300s)
		 */
		protected var _loadSheetStatTimer:Timer=new Timer(300000);
		/**
		 *显示全部按钮
		 */
		protected var _showAll:Image=null;
		[Embed(source="../sound/alarmStorm.mp3")]
		/**
		 *告警风暴声音
		 */
		protected var soundClass:Class;
		/**
		 *告警声音对象
		 */
		protected var sndAss:SoundAsset=new soundClass() as SoundAsset;
		/**
		 *告警声音操作
		 */
		protected var sndChannel:SoundChannel=null;

		public function AlarmStatManager(params:Object)
		{
			initParams(params);
		}

		//初始化参数
		public function initParams(params:Object):void
		{
			_statParam=new StatParam(params);
			_alarmStatList=new AlarmStatList();
			_alarmStatDetail=new AlarmStatDetail();
			_dataManager=new DataManager(_statParam.mapInfo);
			_loadStatTimer.addEventListener(TimerEvent.TIMER, loadStatData);
			_loadSheetStatTimer.addEventListener(TimerEvent.TIMER, loadSheetStatData);
		}

		/**
		 *加载统计数据
		 * @param event
		 *
		 */
		public function loadStatData(event:TimerEvent):void
		{
			_dataManager.loadStatData(function(result:Object):void
				{
					var specCityList:Object=result.specCityStat;
					var specGeneralList:Object=result.specGeneralStat;
					updateStatData(specCityList, specGeneralList);
				}, function():void
				{
					log.info("总流水窗口加载告警统计失败!");
				});
		}

		/**
		 *加载工单统计数据
		 * @param event
		 *
		 */
		public function loadSheetStatData(event:TimerEvent):void
		{
			_dataManager.loadSheetStatData(function(result:Object):void
				{
					var specCityList:Object=result.specCityStat;
					var specGeneralList:Object=result.specGeneralStat;
					updateSheetStatData(specCityList, specGeneralList);
				}, function():void
				{
					log.info("总流水窗口加载工单告警统计失败!");
				});
		}

		/**
		 *更新专业属地统计数据
		 * @param specCityList
		 * @param specGeneralList
		 */
		private function updateSheetStatData(specCityList:Object, specGeneralList:Object):void
		{
			
			//1.更新专业属地数据
			for each (var specCity:Object in specCityList)
			{
				_specCityStatPanel.updateStatNum(specCity.rowId, specCity.columnId, specCity.num);
			}
			_specCityStatPanel.resetTotalNum();
			_specCityStatPanel.refresh();
			//2.更新专业概况数据
			for each (var specGeneral:Object in specGeneralList)
			{
				_specGeneralStatPanel.updateStatNum(specGeneral.rowId, specGeneral.columnId, specGeneral.num);
			}
			_specGeneralStatPanel.resetTotalNum();
			_specGeneralStatPanel.refresh();
		}

		/**
		 *更新专业属地统计数据
		 * @param specCityList
		 * @param specGeneralList
		 */
		private function updateStatData(specCityList:Object, specGeneralList:Object):void
		{
			//1.更新专业属地数据
			for each (var specCity:Object in specCityList)
			{
				_specCityStatPanel.updateStatNum(specCity.rowId, specCity.columnId, specCity.num);
			}
			_specCityStatPanel.resetTotalNum();
			_specCityStatPanel.refresh();
			//2.更新专业概况数据
			for each (var specGeneral:Object in specGeneralList)
			{
				_specGeneralStatPanel.updateStatNum(specGeneral.rowId, specGeneral.columnId, specGeneral.num);
			}
			_specGeneralStatPanel.resetTotalNum();
			_specGeneralStatPanel.refresh();
		}

		/**
		 *开始初始化
		 *
		 */
		public function startInit():void
		{
			//初始化区域树
			initTreeDiv();
			//初始化统计面板参数
			initStatParams();
			//初始化统计面板
			initSpecCityStat();
			initSpecGeneralStat();
			//初始化点击监听器
			initWinListener();
			//启动定时器
			loadStatData(null);
			loadSheetStatData(null);
			_loadStatTimer.start();
			_loadSheetStatTimer.start();
			//添加显示全部
			addShowAllAlarmButton();
			//监听告警风暴
			registerAlarmStorm();
		}

		//初始化统计面板参数
		public function initStatParams():void
		{
			_specCityStatPanel.provice=_statParam.provice;
			_specGeneralStatPanel.provice=_statParam.provice;
		}

		/**
		 *初始化窗口监听器
		 *
		 */
		public function initWinListener():void
		{
			//默认过滤规则
			var ruleContent:String=_statParam.alarmFilter;
			//1.过滤属地专业数据
			_specCityStatPanel.addEventListener(StatEvent.STAT_CLICK, function(event:StatEvent):void
				{
					var column:Object=event.obj;
					var filterStr:String=ColumnConstants.KEY_Specialty + "=" + column[StatEvent.YIDVALUE];
					//不是总窗口加上属地过滤
					if (column[StatEvent.XIDVALUE] != AlarmContainer.STATKEY_CITY_TOTAL)
					{
						filterStr+="&" + ColumnConstants.KEY_AlarmRegion + "=\"" + column[StatEvent.XNAMEVALUE] + "\"";
					}
					//添加默认过滤器
					filterStr+="&alarmseverity=1";
					log.warn("重载过滤规则===========>" + filterStr);
					//拼装过滤规则
					var ruleList:ArrayList=new ArrayList();
					var ruleObject:Object=new Object();
					ruleObject[AlarmContainer.PARAMKEY_RULECONTENT]=filterStr;
					ruleList.addItem(ruleObject);
					_alarmAction.statReload(ruleList);

					//当前按钮显示并显示提示
					_showAll.visible=true;
					_showAll.includeInLayout=true;
				});
			//2.过滤全专业数据
			_specGeneralStatPanel.addEventListener(StatEvent.STAT_CLICK, function(event:StatEvent):void
				{
					var moduleKey:String=null;
					var column:Object=event.obj;
					var filterStr:String=ColumnConstants.KEY_Specialty + "=" + column[StatEvent.YIDVALUE];
					var generalRule:String=TotalUtil.getGeneralSpecFilter(column[StatEvent.XIDVALUE]);
					if (generalRule != null)
					{
						if (generalRule == AlarmContainer.MODULEKEY_RELATIONALARM)
						{
							moduleKey=AlarmContainer.MODULEKEY_RELATIONALARM;
						}
						else
						{
							filterStr+="&" + generalRule;
						}
					}
					log.warn("重载过滤规则===========>" + filterStr);
					//拼装过滤规则
					var ruleList:ArrayList=new ArrayList();
					var ruleObject:Object=new Object();
					ruleObject[AlarmContainer.PARAMKEY_RULECONTENT]=filterStr;
					ruleList.addItem(ruleObject);
					_alarmAction.statReload(ruleList, moduleKey);

					//当前按钮显示并显示提示
					_showAll.visible=true;
					_showAll.includeInLayout=true;
				});
			//3.弹出页面
			_specGeneralStatPanel.addEventListener(StatEvent.STAT_OPEN, function(event:StatEvent):void
				{
					_alarmStatDetail.sheetId=event.obj[StatEvent.XIDVALUE];
					_alarmStatDetail.titleInfo=event.obj[StatEvent.XNAMEVALUE];
					_alarmStatDetail.showHideWindow(_totalflowAlarm);
					_alarmStatDetail.initDataSource(new ArrayCollection());
					_dataManager.loadSheetDetailData(event.obj[StatEvent.YIDVALUE], event.obj[StatEvent.XIDVALUE], function(result:Object):void
						{
							_alarmStatDetail.initDataSource(result);
						}, function():void
						{
							log.info("加载工单详情数据失败!");
						});
				});
			//4.弹出详情
			_alarmStatDetail.addEventListener(StatEvent.DETAIL_OPEN, function(event:StatEvent):void
				{
					_alarmStatList.titleInfo=event.obj.title;
					_alarmStatList.showHideWindow(_totalflowAlarm);
					var pageSize:int=_alarmStatList.districtCustPager.pageSize;
					_alarmStatList.setParams(event.obj.specName, event.obj.cityName, event.obj.type);
					_alarmStatList.setPageParam(int(event.obj.num));
					_alarmStatList.initDataSource(new ArrayCollection());
					_dataManager.loadSheetDetailInfo(1, pageSize, event.obj.specName, event.obj.cityName, event.obj.type, function(result:Object):void
						{
							_alarmStatList.initDataSource(result);
						}, function():void
						{
							log.info("加载工单详细数据失败!");
						});
				});
			//5.查看详情
			_alarmStatList.addEventListener(StatEvent.DETAIL_PAGE, function(event:StatEvent):void
				{
					_alarmStatList.initDataSource(new ArrayCollection());
					_dataManager.loadSheetDetailInfo(event.obj.curPage, event.obj.pageSize, event.obj.specName, event.obj.cityName, event.obj.type, function(result:Object):void
						{
							_alarmStatList.initDataSource(result);
						}, function():void
						{
							log.info("加载工单详细数据失败!");
						});
				});
		}

		/**
		 *添加显示全部按钮
		 *
		 */
		public function addShowAllAlarmButton():void
		{
			_showAll=new Image();
			_showAll.source=IconParam.iconShowAll;
			_showAll.buttonMode=true;
			_showAll.toolTip="显示全部";
			_showAll.visible=false;
			_showAll.includeInLayout=false;
			_activeView.addToolButton(_showAll);
			_showAll.addEventListener(MouseEvent.CLICK, alarmAllShow);
		}

		/**
		 *显示所有告警
		 * @param event
		 *
		 */
		public function alarmAllShow(event:MouseEvent):void
		{
			//1.当前按钮隐藏
			_showAll.visible=false;
			_showAll.includeInLayout=false;

			//2.显示所有告警
			var ruleList:ArrayList=new ArrayList();
			var ruleContent:String=_statParam.alarmFilter;
			log.info("显示全部过滤规则===========>" + ruleContent);
			if (ruleContent != null)
			{
				var ruleObject:Object=new Object();
				ruleObject[AlarmContainer.PARAMKEY_RULECONTENT]=ruleContent;
				ruleList.addItem(ruleObject);
			}
			_alarmAction.reload(ruleList);
		}

		/**
		 *初始化区域树
		 *
		 */
		public function initTreeDiv():void
		{
			//默认过滤规则
			var ruleContent:String=_statParam.alarmFilter;
			var filterStr:String=null;
			_treeDiv.initTree(_statParam.areaXml, _statParam.funcXml, function(treeName:String, parentTreeName:String, type:String, level:String):void
				{
					if (level != '1')
					{
						var ruleList:ArrayList=new ArrayList();
						var ruleObject:Object=new Object();
						if (type == 'city')
						{
							filterStr=ColumnConstants.KEY_AlarmRegion + "=\"" + treeName + "\"";
							//添加默认过滤器
							if (ruleContent != null && ruleContent != "")
							{
								filterStr+="&(" + ruleContent + ")";
							}
							log.warn("重载过滤规则===========>" + filterStr);
							//拼装过滤规则
							ruleObject[AlarmContainer.PARAMKEY_RULECONTENT]=filterStr;
							ruleList.addItem(ruleObject);
							_alarmAction.statReload(ruleList);

							//当前按钮显示并显示提示
							_showAll.visible=true;
							_showAll.includeInLayout=true;
						}
						else if (type == 'device_model')
						{
							filterStr=ColumnConstants.KEY_AlarmRegion + "=\"" + parentTreeName + "\"&" + ColumnConstants.KEY_EquipmentClass + "=\"" + treeName + "\"";
							//添加默认过滤器
							if (ruleContent != null && ruleContent != "")
							{
								filterStr+="&(" + ruleContent + ")";
							}
							log.warn("重载过滤规则===========>" + filterStr);
							//拼装过滤规则
							ruleObject[AlarmContainer.PARAMKEY_RULECONTENT]=filterStr;
							ruleList.addItem(ruleObject);
							_alarmAction.statReload(ruleList);

							//当前按钮显示并显示提示
							_showAll.visible=true;
							_showAll.includeInLayout=true;
						}
					}
				});
		}

		/**
		 * 初始化专业+属地统计面板
		 *
		 */
		public function initSpecCityStat():void
		{
			log.info("【初始化专业+属地统计】");
			// 增加属地汇总列
			_specCityStatPanel.columns=_statParam.citys;
			// 专业行
			_specCityStatPanel.rows=_statParam.specs;
		}

		/**
		 * 初始化专业+概览统计面板
		 *
		 */
		private function initSpecGeneralStat():void
		{
			log.info("【初始化专业+概览统计】");
			// 告警概览列
			_specGeneralStatPanel.columns=_statParam.generas;
			// 专业行
			_specGeneralStatPanel.rows=_statParam.specs;
		}

		/**
		 *监听告警风暴
		 *
		 */
		private function registerAlarmStorm():void
		{
			_alarmAction.addEventListener(AlarmDataEvent.ALARM_STORMSTART, alarmStormStart);
			_alarmAction.addEventListener(AlarmDataEvent.ALARM_STORMSTOP, alarmStormStop);
		}

		/**
		 *告警风暴开始
		 * @param event
		 *
		 */
		private function alarmStormStart(event:AlarmDataEvent):void
		{
			log.warn("告警风暴开始-----------------------------");
			//1.显示告警风暴
			_specGeneralStatPanel.alarmStormStart();
			//2.播放告警风暴声音
			sndChannel=sndAss.play();
			sndChannel.addEventListener(Event.SOUND_COMPLETE, replayhandler);
			//3.广播屏蔽声音
			_alarmAction.dispatchEvent(new SoundEvent(SoundEvent.VOICE_STOP));
		}

		/**
		 *循环播放
		 * @param event
		 *
		 */
		private function replayhandler(event:Event):void
		{
			if (sndChannel == null)
			{
				return;
			}
			//1.停止播放声音
			sndChannel.stop();

			//2.开始播放声音
			sndChannel=sndAss.play();
			sndChannel.addEventListener(Event.SOUND_COMPLETE, replayhandler);

		}

		/**
		 *告警风暴结束
		 * @param event
		 *
		 */
		private function alarmStormStop(event:AlarmDataEvent):void
		{
			log.warn("告警风暴结束-----------------------------");
			//1.屏蔽告警风暴
			_specGeneralStatPanel.alarmStormStop();
			//2.停止告警风暴声音
			if (sndChannel != null)
			{
				sndChannel.stop();
				sndChannel=null;
			}
			//3.广播启动声音
			_alarmAction.dispatchEvent(new SoundEvent(SoundEvent.VOICE_START));
		}

		public function set specGeneralStatPanel(value:AlarmStatPanel):void
		{
			_specGeneralStatPanel=value;
		}

		public function set specCityStatPanel(value:AlarmStatPanel):void
		{
			_specCityStatPanel=value;
		}

		public function set totalflowAlarm(value:TotalflowAlarmModule):void
		{
			_totalflowAlarm=value;
		}

		public function set alarmAction(alarmAction:AlarmAction):void
		{
			_alarmAction=alarmAction;
		}

		public function set activeView(value:AlarmView):void
		{
			_activeView=value;
		}

		public function set treeDiv(value:TreeDiv):void
		{
			_treeDiv=value;
		}

		public function get statParam():StatParam
		{
			return _statParam;
		}
	}
}