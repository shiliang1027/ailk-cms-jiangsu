package com.linkage.module.cms.alarm.countflow.core
{
	import com.linkage.module.cms.alarm.countflow.AlarmStatTest;
	import com.linkage.module.cms.alarm.countflow.CountAlarmflowModuleNew;
	import com.linkage.module.cms.alarm.countflow.component.AlarmCountPanelNew;
	import com.linkage.module.cms.alarm.countflow.component.CityWarnSheetNewDetail;
	import com.linkage.module.cms.alarm.countflow.component.RelationCountPanelNew;
	import com.linkage.module.cms.alarm.countflow.component.SheetStatDetail;
	import com.linkage.module.cms.alarm.countflow.component.SheetStatList;
	import com.linkage.module.cms.alarm.countflow.component.WarnSheetNewDetail;
	import com.linkage.module.cms.alarm.countflow.component.mdi.WindowManager;
	import com.linkage.module.cms.alarm.countflow.data.CountAlarmData;
	import com.linkage.module.cms.alarm.countflow.data.CountAlarmDataImp;
	import com.linkage.module.cms.alarm.countflow.filter.StatFilter;
	import com.linkage.module.cms.alarm.countflow.param.AlarmStatParam;
	import com.linkage.module.cms.alarm.countflow.param.StatContainer;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.formatters.DateFormatter;
	
	import spark.components.RadioButton;

	/**
	 *统计管理
	 * @author mengqiang
	 *
	 */
	public class CountManagerNew
	{
		//日志记录器
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.alarm.countflow.core.CountManagerNew");
		//流水对象
		private var _alarmFlow:CountAlarmflowModuleNew = null;
		//告警统计
		private var _warnStatNew:AlarmCountPanelNew = null;
		//告警统计
		private var _warnStat:Object = null;
		//关联告警统计
		private var _relationStat:RelationCountPanelNew = null;
		//工单统计
		private var _sheetStat:AlarmCountPanelNew = null;
		//地市一级告警统计，add by 汪炜，2014-6-6
		private var _cityAlarmStat:AlarmCountPanelNew = null;
		//参数容器
		private var _alarmStatParam:AlarmStatParam = null;
		//告警统计
		private var _countAlarmflow:CountAlarmflowModuleNew = null;
		//统计告警
		private var _countAlarmData:CountAlarmData = null;
		//工单统计列表
		private var _sheetStatList:SheetStatList = null;
		//告警详情
		private var _warnSheetNewDetail:WarnSheetNewDetail = null;
		
		private var _cityWarnSheetNewDetail:CityWarnSheetNewDetail = null;

		//工单统计详情
		private var _sheetStatDetail:SheetStatDetail = null;
		//加载告警统计定时器 Timer (1m)
		protected var _loadWarnStatTimer:Timer = new Timer(5 * 60 * 1000);
		//加载工单统计定时器 Timer (1m)
		protected var _loadSheetStatTimer:Timer = new Timer(5 * 60 * 1000);
		//加载关联统计定时器 Timer (1m)
		protected var _loadRelaStatTimer:Timer = new Timer(5 * 60 * 1000);
		//加载地市一级告警统计定时器 Timer (1m)
		protected var _cityAlarmStatTimer:Timer = new Timer(5 * 60 * 1000);

		private var _wm:WindowManager;

		public function CountManagerNew(params:Object)
		{
			//工单统计列表
			_sheetStatList = new SheetStatList();
			//告警详情
			_warnSheetNewDetail = new WarnSheetNewDetail();
			
			_cityWarnSheetNewDetail = new CityWarnSheetNewDetail();
			//工单统计详情
			_sheetStatDetail = new SheetStatDetail();
			//初始化告警统计
			_alarmStatParam = new AlarmStatParam(params);
			//初始化数据接口
			_countAlarmData = new CountAlarmDataImp(_alarmStatParam.mapInfo);
			//定时刷新告警统计
			_loadWarnStatTimer.addEventListener(TimerEvent.TIMER, loadWarnStatData);
			//定时刷新工单统计
			_loadSheetStatTimer.addEventListener(TimerEvent.TIMER, loadSheetStatData);
			//定时刷新关联统计
			_loadRelaStatTimer.addEventListener(TimerEvent.TIMER, loadRelaStatData);
			//定时刷新地市1级告警统计
			_cityAlarmStatTimer.addEventListener(TimerEvent.TIMER, loadcityAlarmStatData);
			
		}

		//启动
		public function start():void
		{
			//初始化统计面板列
			initColumn();
			//初始化面板信息
//			_warnStat.countManager=this;
			_warnStatNew.countManager = this;
//			_sheetStat.countManager = this;
			_relationStat.countManager = this;
//			_warnStat.local=_alarmStatParam.local;
			_warnStatNew.local = _alarmStatParam.local;
//			_sheetStat.local = _alarmStatParam.local;
			_relationStat.local = _alarmStatParam.local;
			//加载统计面板数据
			loadWarnStatData(null);
//			loadSheetStatData(null);
			loadRelaStatData(null);
			loadcityAlarmStatData(null);
			//加载趋势图数据
//			loadWarnLineData(StatContainer.STATLINETYPE_LEVEL1);
//			loadSheetLineData(StatContainer.STATLINETYPE_SENDNUM);
			loadRelaLineData(StatContainer.STATLINETYPE_RELATIONNUM);
			//初始化告警统计复选框
//			initWarnStatCheckBox();
			//启动定时器
			_loadWarnStatTimer.start();
//			_loadSheetStatTimer.start();
			_loadRelaStatTimer.start();
			_cityAlarmStatTimer.start();
		}

		//初始化告警统计复选框
		private function initWarnStatCheckBox():void
		{
			//一级设备告警复选框
			var level1:RadioButton = new RadioButton();
			level1.label = "一级设备告警";
			level1.selected = true;
			level1.addEventListener(MouseEvent.CLICK, function():void
				{
					loadWarnLineData(StatContainer.STATLINETYPE_LEVEL1);
				});
			_warnStat.addButton(level1);
			//全部告警复选框
			var all:RadioButton = new RadioButton();
			all.label = "全部告警";
			all.addEventListener(MouseEvent.CLICK, function():void
				{
					loadWarnLineData(StatContainer.STATLINETYPE_ALL);
				});
			_warnStat.addButton(all);
		}

		//重载告警
		public function reloadFlowAlarm(ruleContext:String, columnKey:String, moduleKey:String):void
		{
			log.warn("重载告警ruleContext=" + ruleContext + ",columnKey=" + columnKey + ",moduleKey=" + moduleKey);
//			Alert.show("重载告警ruleContext=" + ruleContext + ",columnKey=" + columnKey + ",moduleKey=" + moduleKey)
			//如果行过滤器为空直接返回
			if (ruleContext == null)
			{
				return;
			}
			//拼接行过滤器和列过滤器
			var columnRule:String = StatFilter.getColumnFilter(columnKey);
			if (columnRule == null)
			{
				return;
			}
			if (columnRule != "")
			{
				_alarmFlow.flowAlarm.statReload(ruleContext + "&" + columnRule, moduleKey);
			}
			else
			{
				_alarmFlow.flowAlarm.statReload(ruleContext, moduleKey);
			}
			_alarmFlow.bottomDivider_clickHandler(true);
		}

		//初始化列
		private function initColumn():void
		{
			//告警统计列
//			_warnStat.columns=_alarmStatParam.warnColumnsJson;
			_warnStatNew.columns = _alarmStatParam.warnColumnsJsonNew;
			//工单统计列
//			_sheetStat.columns = _alarmStatParam.sheetColumnsJson;
			//关联告警统计列
			_relationStat.columns = _alarmStatParam.relationColumnsJson;
			//地市一级告警统计列
			_cityAlarmStat.columns = _alarmStatParam.cityAlarmColumnsJson;
		}

		//查询工单列表(分页)
		public function showSheetListPage(curPage:int, pageSize:int, queryType:String, specId:String, cityName:String):void
		{
			_sheetStatList.initDataSource(new ArrayCollection());
			//本地运行
			if (_alarmStatParam.local)
			{
				_sheetStatList.initDataSource(AlarmStatTest.loadSheetDetailInfo());
				return;
			}
			//服务器运行
			_countAlarmData.loadSheetDetailInfo(curPage, pageSize, specId, cityName, queryType, function(result:Object):void
				{
					_sheetStatList.initDataSource(result);
				}, function():void
				{
					log.info("加载工单详细数据失败!");
				});
		}

		//查询工单列表
		public function showSheetList(specId:String, cityName:String, title:String, queryType:String, num:String):void
		{
			_sheetStatList.showHideWindow(_countAlarmflow);
			var pageSize:int = _sheetStatList.districtCustPager.pageSize;
			_sheetStatList.initParams(title, specId, cityName, queryType, this);
			_sheetStatList.setPageParam(int(num));
			_sheetStatList.initDataSource(new ArrayCollection());
			//本地运行
			if (_alarmStatParam.local)
			{
				_sheetStatList.initDataSource(AlarmStatTest.loadSheetDetailInfo());
				return;
			}
			//服务器运行
			_countAlarmData.loadSheetDetailInfo(1, pageSize, specId, cityName, queryType, function(result:Object):void
				{
					_sheetStatList.initDataSource(result);
				}, function():void
				{
					log.info("加载工单详细数据失败!");
				});
		}

		//查看告警处理展示过程详情分页
		public function showWarnStatNewPage(curPage:int, pageSize:int, specId:String, specName:String, columnKey:String, type:int, totalCount:String):void
		{
			_warnSheetNewDetail.initDataSource(new ArrayCollection());
			//本地运行
			if (_alarmStatParam.local)
			{
				_warnSheetNewDetail.initDataSource(AlarmStatTest.loadSheetDetailData());
				return;
			}
			//服务器运行
			_countAlarmData.loadWarnStatDetailData(curPage, pageSize, specId, specName, columnKey, totalCount, function(result:Object):void
				{
					_warnSheetNewDetail.initDataSource(result);
				}, function():void
				{
					log.info("加载告警详情数据失败!");
				});
		}
		
		public function showCityWarnStatNewPage(curPage:int, pageSize:int, specId:String, specName:String, columnKey:String, type:int, num:String,alarmregion:String):void
		{
			_cityWarnSheetNewDetail.initDataSource(new ArrayCollection());
			//本地运行
			if (_alarmStatParam.local)
			{
				_cityWarnSheetNewDetail.initDataSource(AlarmStatTest.loadSheetDetailData());
				return;
			}
			//服务器运行
			
			_countAlarmData.loadCityWarnStatDetailData(curPage, pageSize, specId, specName, columnKey, num,alarmregion, function(result:Object):void
			{
				_cityWarnSheetNewDetail.initDataSource(result, type);
			}, function():void
			{
				log.info("加载告警详情数据失败!");
			});
		}

		//查看告警处理展示过程详情
		public function showWarnStatNew(specId:String, specName:String, columnKey:String, columnName:String, num:String, type:int):void
		{
			//TODO  查看告警处理展示过程详情
			_warnSheetNewDetail.initParamsInfo(specId, specName, columnName, columnKey, num,"", type, this);
//			var pageSize:int = _warnSheetNewDetail.warnSheetPager.pageSize;
			var pageSize:int = 10;
			log.info("22222222");
			_warnSheetNewDetail.showHideWindow(_countAlarmflow);
//			_warnSheetNewDetail.setPageParam(int(num));
			_warnSheetNewDetail.initDataSource(new ArrayCollection(), type);
			//本地运行
			if (_alarmStatParam.local)
			{
				_warnSheetNewDetail.initDataSource(AlarmStatTest.loadSheetDetailData());
				return;
			}
			//服务器运行
			_countAlarmData.loadWarnStatDetailData(1, pageSize, specId, specName, columnKey, num, function(result:Object):void
				{
					_warnSheetNewDetail.initDataSource(result, type);
				}, function():void
				{
					log.info("加载告警详情数据失败!");
				});
		}
		
		public function showCityWarnStatNew(specId:String, specName:String, columnKey:String, columnName:String, num:String,alarmregion:String,type:int,isCityAlarm:String):void
		{
			//TODO  查看告警处理展示过程详情
			_cityWarnSheetNewDetail.initParamsInfo(specId, specName, columnName, columnKey, num, alarmregion,type, this);
//			_cityWarnSheetNewDetail.isCityAlarmWin(isCityAlarm);
//			var pageSize:int = _warnSheetNewDetail.warnSheetPager.pageSize;
			var pageSize:int = 10;
			log.info("22222222");
			_cityWarnSheetNewDetail.showHideWindow(_countAlarmflow);
//			_warnSheetNewDetail.setPageParam(int(num));
			_cityWarnSheetNewDetail.initDataSource(new ArrayCollection(), type);
			//本地运行
			if (_alarmStatParam.local)
			{
				_cityWarnSheetNewDetail.initDataSource(AlarmStatTest.loadSheetDetailData());
				return;
			}
			//服务器运行
			_countAlarmData.loadCityWarnStatDetailData(1, pageSize, specId, specName, columnKey, num,alarmregion, function(result:Object):void
				{
				_cityWarnSheetNewDetail.initDataSource(result, type);
				}, function():void
				{
					log.info("加载告警详情数据失败!");
				});
		}

		//查看工单详情
//		_countManager.showSheetDeatail(specId1, specName1, columnKey, columnName1,rowObj[columnKey]);
		public function showSheetDeatail(specId:String, specName:String, columnKey:String, columnName:String):void
		{
			_sheetStatDetail.initParamsInfo(columnName, columnKey, this);
			_sheetStatDetail.showHideWindow(_countAlarmflow);
			_sheetStatDetail.initDataSource(new ArrayCollection());
			//本地运行
			if (_alarmStatParam.local)
			{
				_sheetStatDetail.initDataSource(AlarmStatTest.loadSheetDetailData());
				return;
			}
			//服务器运行
			_countAlarmData.loadSheetDetailData(specId, specName, columnKey, function(result:Object):void
				{
					_sheetStatDetail.initDataSource(result);
				}, function():void
				{
					log.info("加载工单详情数据失败!");
				});
		}

		//加载统计趋势图数据
		public function loadWarnLineData(type:String):void
		{
			//本地运行
			if (_alarmStatParam.local)
			{
//				_warnStat.initChartsData(parseLineData(AlarmStatTest.loadWarnLineData()));
				return;
			}
			//服务器运行
			_countAlarmData.loadStatLineData(type, function(result:Object):void
				{
//					_warnStat.initChartsData(parseLineData(result));
				}, function():void
				{
					log.info("加载告警统计趋势失败!");
				});
		}

		//解析趋势图数据
		private function parseLineData(data:Object, type:int = 0):Object
		{
			if (data == null || data == "")
			{
				return new ArrayCollection();
			}
			//解析数据
			var valueArray:ArrayCollection = new ArrayCollection();
			var labelArray:ArrayCollection = new ArrayCollection();
			var labelObj:Object = new Object();
			var seriesName:String = null;
			for each (var obj:Object in data)
			{
				if (obj.bussname != seriesName)
				{
					seriesName = obj.bussname;
					if (obj.bussid == "-1" || (type == 0 && (seriesName == "集客关联" || seriesName == "传输网")))
					{
						valueArray.addItem({seriesName: seriesName, parentYAxis: 'P'});
					}
					else
					{
						valueArray.addItem({seriesName: seriesName, parentYAxis: 'S'});
					}
				}
				valueArray.addItem({value: obj.value});
				if (!labelObj.hasOwnProperty(obj.gathertime))
				{
					labelObj[obj.gathertime] = obj.gathertime;
					labelArray.addItem({label: obj.gathertime});
				}
			}
			labelArray.addAll(valueArray);
			return labelArray;
		}

		//加载工单统计趋势图
		public function loadSheetLineData(type:String):void
		{
			//本地运行
			if (_alarmStatParam.local)
			{
				_sheetStat.initChartsData(parseLineData(AlarmStatTest.loadSheetLineData(), 1));
				return;
			}
			//服务器运行
			_countAlarmData.loadStatLineData(type, function(result:Object):void
				{
					_sheetStat.initChartsData(parseLineData(result, 1));
				}, function():void
				{
					log.info("加载工单统计趋势失败!");
				});
		}

		//加载关联统计趋势图
		public function loadRelaLineData(type:String):void
		{
			//本地运行
			if (_alarmStatParam.local)
			{
				_relationStat.initChartsData(parseLineData(AlarmStatTest.loadRelaLineData()));
				return;
			}
			//服务器运行
			_countAlarmData.loadStatLineData(type, function(result:Object):void
				{
					_relationStat.initChartsData(parseLineData(result));
				}, function():void
				{
					log.info("加载关联统计趋势失败!");
				});
		}

		//获取告警统计数据
		private function loadWarnStatData(event:TimerEvent = null):void
		{
			
			_warnStatNew.visible = true;
			_warnStatNew.includeInLayout = true;
		
			//更新告警标题
			_warnStatNew.title = "告警处理过程展示（统计范围：";
			var d1:Date = new Date();

			var df:DateFormatter = new DateFormatter();
			df.formatString = "YYYY-MM-DD";
			var bt:String = df.format(d1);
			df.formatString = "JJ:NN:SS";
			var et:String = df.format(d1);
			
			_warnStatNew.title += bt + " 00:00:00～" + et + "，刷新周期：5分钟）";

			//本地运行
			if (_alarmStatParam.local)
			{
//				_warnStat.dataSource=AlarmStatTest.getWarnStatInfoList();
				return;
			}
			//服务器运行
//			_countAlarmData.getWarnStatInfoList(function(result:Object):void
//				{
//					_warnStat.dataSource=result;
//				}, function():void
//				{
//					log.info("加载告警统计失败!");
//				});

			
			//服务器运行
			_countAlarmData.getWarnStatInfoListNew(function(result:Object):void
				{
//					_warnStatNew.columns = _alarmStatParam.warnColumnsJsonNew;
//					_warnStatNew.count.initialize();
					_warnStatNew.dataSource = result;

					setTimeout(function():void
						{
							_wm.tile();
						}, 200);
				}, function():void
				{
					log.info("加载告警统计失败!");
				});
			
		}

		//获取工单统计数据
		public function loadSheetStatData(event:TimerEvent = null):void
		{
			_sheetStat.visible = true;
			_sheetStat.includeInLayout = true;
			//更新告警标题
			_sheetStat.title = "派单统计（统计范围：";
			var d1:Date = new Date();

			var df:DateFormatter = new DateFormatter();
			df.formatString = "YYYY-MM-DD";
			var bt:String = df.format(d1);
			df.formatString = "JJ:NN:SS";
			var et:String = df.format(d1);

			_sheetStat.title += bt + " 00:00:00～" + et + "，刷新周期：5分钟）";

			//本地运行
			if (_alarmStatParam.local)
			{
				_sheetStat.dataSource = AlarmStatTest.getSheetWarnStatInfoList();
				return;
			}
			//服务器运行
			_countAlarmData.getSheetWarnStatInfoList(function(result:Object):void
				{
					_sheetStat.dataSource = result;
				}, function():void
				{
					log.info("加载工单统计失败!");
				});
		}

		//获取关联告警统计数据
		public function loadRelaStatData(event:TimerEvent = null):void
		{
			_relationStat.visible = true;
			_relationStat.includeInLayout = true;
			
			_relationStat.columns = _alarmStatParam.relationColumnsJson;
			
			_relationStat.count.initialize();
			//本地运行
			if (_alarmStatParam.local)
			{
				_relationStat.dataSource = AlarmStatTest.getRelaWarnStatData();
				return;
			}
			//服务器运行
			_countAlarmData.getRelationWarnStatInfoList(function(result:Object):void
				{
					_relationStat.dataSource = result;
				}, function():void
				{
					log.info("加载关联统计失败!");
				});
		}
		//获取地市一级告警统计数据
		public function loadcityAlarmStatData(event:TimerEvent = null):void
		{
//			地市一级告警统计（统计范围: ，刷新周期：5分钟）
			
			_cityAlarmStat.visible = true;
			_cityAlarmStat.includeInLayout = true;
			_cityAlarmStat.width = this._warnStatNew.width / 2;
			
			//地市一级告警统计列
			_cityAlarmStat.columns = _alarmStatParam.cityAlarmColumnsJson;
			_cityAlarmStat.count.initialize();
			//更新告警标题
			_cityAlarmStat.title = "地市一级告警统计（统计范围：";
			var d1:Date = new Date();
			
			var df:DateFormatter = new DateFormatter();
			df.formatString = "YYYY-MM-DD";
			var bt:String = df.format(d1);
			df.formatString = "JJ:NN:SS";
			var et:String = df.format(d1);
			_cityAlarmStat.title += bt + " 00:00:00～" + et + "，刷新周期：5分钟）";

			//本地运行
//			if (_alarmStatParam.local)
//			{
//				_cityAlarmStat.dataSource = AlarmStatTest.getRelaWarnStatData();
//				return;
//			}
			//服务器运行
			_countAlarmData.getCityAlarmStatInfoList(function(result:Object):void
			{
				_cityAlarmStat.dataSource = result;
			}, function():void
			{
				log.info("加载地市一级告警统计失败!");
			});
		}
		public function set alarmFlow(value:CountAlarmflowModuleNew):void
		{
			_alarmFlow = value;
		}

		public function set warnStat(value:Object):void
		{
			_warnStat = value;
		}

		public function set sheetStat(value:AlarmCountPanelNew):void
		{
			_sheetStat = value;
		}
		
		public function set cityAlarmStat(value:AlarmCountPanelNew):void
		{
			_cityAlarmStat = value;
		}
		
		public function set relationStat(value:RelationCountPanelNew):void
		{
			_relationStat = value;
		}

		public function set countAlarmflow(value:CountAlarmflowModuleNew):void
		{
			_countAlarmflow = value;
		}

		public function get warnStatNew():AlarmCountPanelNew
		{
			return _warnStatNew;
		}

		public function set warnStatNew(value:AlarmCountPanelNew):void
		{
			_warnStatNew = value;
		}

		public function get wm():WindowManager
		{
			return _wm;
		}

		public function set wm(value:WindowManager):void
		{
			_wm = value;
		}
	}
}

