package com.linkage.module.cms.alarm.totalflow.core
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.alarm.totalflow.AlarmContainer;
	import com.linkage.module.cms.alarm.totalflow.data.DataManagerGD;
	import com.linkage.module.cms.alarm.totalflow.event.StatEvent;
	import com.linkage.module.cms.alarm.totalflow.param.StatParam;
	import com.linkage.module.cms.alarm.totalflow.util.TotalUtil;
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	import flash.events.TimerEvent;

	import mx.collections.ArrayList;

	/**
	 *告警统计管理
	 * @author mengqiang
	 *
	 */
	public class AlarmStatManagerGD extends AlarmStatManager
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.totalflowalarm.core.AlarmStatManagerGD");

		public function AlarmStatManagerGD(params:Object)
		{
			super(params);
		}

		//初始化参数
		override public function initParams(params:Object):void
		{
			//初始化参数
			_statParam=new StatParam(params);
			_dataManager=new DataManagerGD(_statParam.mapInfo);
			_loadStatTimer.addEventListener(TimerEvent.TIMER, loadStatData);
			_loadSheetStatTimer.addEventListener(TimerEvent.TIMER, loadSheetStatData);
		}

		/**
		 *初始化窗口监听器
		 *
		 */
		override public function initWinListener():void
		{
			//1.过滤属地专业数据
			_specCityStatPanel.addEventListener(StatEvent.STAT_CLICK, function(event:StatEvent):void
				{
					var column:Object=event.obj;
					var filterStr:String=null;
					//判断是否是超时工单
					if (column[StatEvent.YIDVALUE] == AlarmContainer.STATKEY_SUPERSHEET)
					{
						filterStr=ColumnConstants.KEY_SheetStatus + "=9";
					}
					else
					{
						filterStr=ColumnConstants.KEY_Specialty + "=" + column[StatEvent.YIDVALUE];
					}
					//不是总窗口加上属地过滤
					if (column[StatEvent.XIDVALUE] != AlarmContainer.STATKEY_CITY_TOTAL)
					{
						filterStr+="&" + ColumnConstants.KEY_AlarmRegion + "=\"" + column[StatEvent.XNAMEVALUE] + "\"";
					}
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
		}

		/**
		 *初始化区域树
		 *
		 */
		override public function initTreeDiv():void
		{
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
		override public function initSpecCityStat():void
		{
			log.info("【初始化专业+属地统计】");
			// 增加属地汇总列
			_specCityStatPanel.columns=_statParam.citys;
			var specArray:Array=_statParam.specs.concat([{id: AlarmContainer.STATKEY_SUPERSHEET, name: '超时工单'}]);
			// 专业行
			_specCityStatPanel.rows=specArray;
		}
	}
}