package com.linkage.module.cms.alarm.specialrule.source.server.core
{
	import com.linkage.module.cms.alarm.framework.common.event.AlarmViewEvent;
	import com.linkage.module.cms.alarm.framework.common.event.MenuEvent;
	import com.linkage.module.cms.alarm.framework.common.event.SoundEvent;
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.alarm.framework.common.util.AlarmOperator;
	import com.linkage.module.cms.alarm.framework.common.util.AlarmUtil;
	import com.linkage.module.cms.alarm.framework.controller.AlarmAction;
	import com.linkage.module.cms.alarm.framework.module.server.core.WindowController;
	import com.linkage.module.cms.alarm.framework.module.server.param.AlarmTransTopic;
	import com.linkage.module.cms.alarm.framework.module.server.source.ICollection;
	import com.linkage.module.cms.alarm.specialrule.source.server.param.SpecialAlarmTopic;
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	import mx.controls.Alert;
	import mx.events.CloseEvent;

	public class SpecialWindow extends WindowController
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.specialrule.source.server.core.SpecialWindow");
		/**
		 *确认窗口类型：2
		 */
		protected var _windowTypeAck:int=2;
		[Bindable]
		/**
		 *确认告警容器
		 */
		private var _ackAlarmSource:ICollection=null;

		public function SpecialWindow(windowId:String, alarmAction:AlarmAction, collectClass:Class)
		{
			super(windowId, alarmAction, collectClass);
		}

		//初始化告警容器
		override public function initAlarmSource(collectClass:Class):void
		{
			_ackAlarmSource=new collectClass(_windowId, _windowTypeAck, _alarmAction);
			_activeAlarmSource=new collectClass(_windowId, _windowTypeAct, _alarmAction);
			_clearAlarmSource=new collectClass(_windowId, _windowTypeCle, _alarmAction);
		}

		//捕获菜单事件 确认告警
		override public function handlerAlarmMenuEventAckAlarm(event:MenuEvent):void
		{
			AlarmOperator.handlerAlarmDealEvent(event.url, event.selectedNums, _alarmParamFo.sessionId, "确认告警", function(alarm:Object):void
				{
					log.warn("捕获菜单事件 确认告警");
				//dealWitchHandlerAckAlarm(alarm);
				});
		}

		//处理手工确认告警
		private function dealWitchHandlerAckAlarm(alarm:Object):void
		{
			//1.更新告警确认字段
			updateAlarm(alarm);

			//2.移动
			var mvAlarm:Object=_activeAlarmSource.getAlarmByAlarmId(alarm[ColumnConstants.KEY_AlarmUniqueId]);
			if (mvAlarm != null)
			{
				if (AlarmUtil.checkTreeAllAckAlarm(mvAlarm))
				{
					var tpAlarm:Object=AlarmUtil.findTopParentAlarm(mvAlarm);
					activeToAckAlarm(tpAlarm);
				}
			}
			else
			{
				var rmAlarm:Object=_clearAlarmSource.getAlarmByAlarmId(alarm[ColumnConstants.KEY_AlarmUniqueId]);
				if (rmAlarm != null)
				{
					if (AlarmUtil.checkTreeAllAckAlarm(rmAlarm))
					{
						var pAlarm:Object=AlarmUtil.findTopParentAlarm(rmAlarm);
						removeClearAlarm(pAlarm);
					}
				}
			}

			//3.通知视图刷新页面
			_alarmAction.dispatchEvent(new AlarmViewEvent(_windowId + AlarmViewEvent.REFRESH_VIEW));
		}

		//捕获菜单事件 清除告警
		override public function handlerAlarmMenuEventClearAlarm(event:MenuEvent):void
		{
			AlarmUtil.showMessage("您是否确定清除告警！", "提示", Alert.OK | Alert.CANCEL, null, function(ce:CloseEvent):void
				{
					if (ce.detail == Alert.OK)
					{
						AlarmOperator.handlerAlarmDealEvent(event.url, event.selectedNums, _alarmParamFo.sessionId, "清除告警", function(alarm:Object):void
							{
								log.warn("捕获菜单事件 清除告警");
							//dealWitchHandlerClearAlarm(alarm);
							});
					}
				});
		}

		//处理手工清除告警
		private function dealWitchHandlerClearAlarm(alarm:Object):void
		{
			//1.更新告警清除字段
			updateAlarm(alarm);

			//2.移除活动告警到清除告警
			var udAlarm:Object=_activeAlarmSource.getAlarmByAlarmId(alarm[ColumnConstants.KEY_AlarmUniqueId]);
			if (udAlarm != null)
			{
				if (AlarmUtil.checkTreeAllClearAlarm(udAlarm))
				{
					var tpAlarm:Object=AlarmUtil.findTopParentAlarm(udAlarm);
					activeToClearAlarm(tpAlarm);
				}
			}
			else
			{
				var rmAlarm:Object=_ackAlarmSource.getAlarmByAlarmId(alarm[ColumnConstants.KEY_AlarmUniqueId]);
				if (rmAlarm != null)
				{
					if (AlarmUtil.checkTreeAllClearAlarm(rmAlarm))
					{
						var pAlarm:Object=AlarmUtil.findTopParentAlarm(rmAlarm);
						removeAckAlarm(pAlarm);
					}
				}
			}

			//3.通知视图刷新页面
			_alarmAction.dispatchEvent(new AlarmViewEvent(_windowId + AlarmViewEvent.REFRESH_VIEW));
		}

		//处理告警
		override public function handlerAlarmDeal(alarm:Object):void
		{
			//log.info("接受告警主题和信息=" + alarm[AlarmTransTopic.KEY_MSG_TOPIC] + "/" + alarm[ColumnConstants.KEY_AlarmUniqueId]);
			switch (alarm[AlarmTransTopic.KEY_MSG_TOPIC])
			{
				case SpecialAlarmTopic.KEY_OPER_NSNK: //未清除未确认新增
					addNoClearNoAckAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_NSYK: //未清除已确认新增
					addNoClearYesAckAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_YSNK: //已清除未确认新增
					addYesClearNoAckAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_MTYS: //已清除告警移动
					activeToClearAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_MTYK: //已确认告警移动
					activeToAckAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_MTK2N: //已确认告警移动到活动窗口
					ackToActiveAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_MTS2N: //已清楚告警移动活动窗口
					clearToActiveAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_RNSNK: //未清除未确认删除
					removeActiveAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_RNSYK: //未清除已确认删除
					removeAckAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_RYSNK: //已清除未确认删除
					removeClearAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_RSNSNK: //未清除未确认关联关系
					addActiveRelationShip(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_RSNSYK: //未清除已确认关联关系
					addAckRelationShip(alarm);
					break;
				case SpecialAlarmTopic.KEY_OPER_RSYSNK: //已清除未确认关联关系
					addClearRelationShip(alarm);
					break;
				case AlarmTransTopic.KEY_OPER_AU: //告警更新
					updateAlarm(alarm);
					break;
				case SpecialAlarmTopic.KEY_ASN: //自定义窗口告警统计
					statisticsAlarm(alarm);
					break;
				case AlarmTransTopic.KEY_OPER_STARTREV: //告警开始接受
					alarmStartRev();
					break;
				case AlarmTransTopic.KEY_ELH: //告警同步结束
					alarmSyncEndNodify();
					break;
				case AlarmTransTopic.KEY_LHE: //告警同步异常
					alarmSyncErrorNodify();
					break;
				case AlarmTransTopic.KEY_PLE: //告警预装结束
					alarmLoadEndNodify();
					break;
				case AlarmTransTopic.KEY_EPL: //告警预装异常
					alarmLoadErrorNodify();
					break;
			}
		}

		//告警统计
		private function statisticsAlarm(alarm:Object):void
		{
			//1.更新告警统计数量
			var sl:int=alarm[AlarmTransTopic.KEY_SL];
			var a1:int=alarm[AlarmTransTopic.KEY_A1];
			var a2:int=alarm[AlarmTransTopic.KEY_A2];
			var a3:int=alarm[AlarmTransTopic.KEY_A3];
			var a4:int=alarm[AlarmTransTopic.KEY_A4];
			var c1:int=alarm[AlarmTransTopic.KEY_C1];
			var c2:int=alarm[AlarmTransTopic.KEY_C2];
			var c3:int=alarm[AlarmTransTopic.KEY_C3];
			var c4:int=alarm[AlarmTransTopic.KEY_C4];
			var k1:int=alarm[SpecialAlarmTopic.KEY_K1];
			var k2:int=alarm[SpecialAlarmTopic.KEY_K2];
			var k3:int=alarm[SpecialAlarmTopic.KEY_K3];
			var k4:int=alarm[SpecialAlarmTopic.KEY_K4];
			var anac:int=alarm[SpecialAlarmTopic.KEY_A_NAC];
			var aaac:int=alarm[SpecialAlarmTopic.KEY_A_AAC];
			var cnac:int=alarm[SpecialAlarmTopic.KEY_C_NAC];
			var caac:int=alarm[SpecialAlarmTopic.KEY_C_AAC];
			var knac:int=alarm[SpecialAlarmTopic.KEY_K_NAC];
			var kaac:int=alarm[SpecialAlarmTopic.KEY_K_AAC];

			//2.告警最高等级发声
			//log.debug("获取最大等级【level】=" + sl);
			if(_soundEnabled)
			{
				_alarmAction.dispatchEvent(new SoundEvent(SoundEvent.VOICE_LEVEL, _windowId, sl));
			}

			//3.更新告警等级和未确认、未清除数量
			_activeAlarmSource.updateAlarmNum(a1, a2, a3, a4, anac, aaac);
			_clearAlarmSource.updateAlarmNum(c1, c2, c3, c4, cnac, caac);
			_ackAlarmSource.updateAlarmNum(k1, k2, k3, k4, knac, kaac);
		}

		//告警更新
		private function updateAlarm(alarm:Object):void
		{
			//log.debug("告警信息变更=" + alarm[ColumnConstants.KEY_AlarmUniqueId]);
			_activeAlarmSource.updateAlarm(alarm);
			_clearAlarmSource.updateAlarm(alarm);
			_ackAlarmSource.updateAlarm(alarm);
		}

		//未清除未确认告警新增
		private function addNoClearNoAckAlarm(alarm:Object):void
		{
			//log.debug("新增未清除未确认告警:" + alarm[ColumnConstants.KEY_AlarmUniqueId]);

			//1.增加告警未读标识
			alarm[ColumnConstants.KEY_ReadFlag]=0;

			//2.增加未清除未确认告警
			_activeAlarmSource.addAlarm(alarm);
		}

		//未清除已确认告警新增
		private function addNoClearYesAckAlarm(alarm:Object):void
		{
			//log.debug("新增未清除已确认告警:" + alarm[ColumnConstants.KEY_AlarmUniqueId]);

			//1.增加告警未读标识
			alarm[ColumnConstants.KEY_ReadFlag]=0;

			//2.增加未清除已确认告警
			_ackAlarmSource.addAlarm(alarm);
		}

		//已清除未确认告警新增
		private function addYesClearNoAckAlarm(alarm:Object):void
		{
			//log.debug("新增已清除未确认告警:" + alarm[ColumnConstants.KEY_AlarmUniqueId]);

			//1.增加告警未读标识
			alarm[ColumnConstants.KEY_ReadFlag]=0;

			//2.增加已清除未确认告警
			_clearAlarmSource.addAlarm(alarm);
		}

		//未清除未确认容器-->已清除未确认容器
		private function activeToClearAlarm(alarm:Object):void
		{
			var alarmId:String=alarm[ColumnConstants.KEY_AlarmUniqueId];
			//log.debug("未清除未确认容器-->已清除未确认容器=" + alarmId);
			//1.删除活动告警
			var mtAlarm:Object=_activeAlarmSource.removeAlarm(alarm);

			//2.增加清除告警
			if (mtAlarm != null)
			{
				if (mtAlarm is Array)
				{
					var alarmArray:Array=mtAlarm as Array;
					for each (var mvalarm:Object in alarmArray)
					{
						_clearAlarmSource.addAlarm(mvalarm);
					}
				}
				else
				{
					_clearAlarmSource.addAlarm(mtAlarm);
				}
			}
		}

		//未清除未确认容器-->未清除已确认容器
		private function activeToAckAlarm(alarm:Object):void
		{
			var alarmId:String=alarm[ColumnConstants.KEY_AlarmUniqueId];
			//log.debug("未清除未确认容器-->未清除已确认容器=" + alarmId);
			//1.删除活动告警
			var mtAlarm:Object=_activeAlarmSource.removeAlarm(alarm);

			//2.增加确认告警
			if (mtAlarm != null)
			{
				if (mtAlarm is Array)
				{
					var alarmArray:Array=mtAlarm as Array;
					for each (var mvalarm:Object in alarmArray)
					{
						_ackAlarmSource.addAlarm(mvalarm);
					}
				}
				else
				{
					_ackAlarmSource.addAlarm(mtAlarm);
				}
			}
		}

		//未清除已确认容器-->未清除未确认容器
		private function ackToActiveAlarm(alarm:Object):void
		{
			var alarmId:String=alarm[ColumnConstants.KEY_AlarmUniqueId];
			//log.debug("未清除已确认容器-->未清除未确认容器=" + alarmId);
			//1.删除活动告警
			var mtAlarm:Object=_ackAlarmSource.removeAlarm(alarm);
			
			//2.增加确认告警
			if (mtAlarm != null)
			{
				if (mtAlarm is Array)
				{
					var alarmArray:Array=mtAlarm as Array;
					for each (var mvalarm:Object in alarmArray)
					{
						_activeAlarmSource.addAlarm(mvalarm);
					}
				}
				else
				{
					_activeAlarmSource.addAlarm(mtAlarm);
				}
			}
		}
		
		//已清除未确认容器-->未清除未确认容器
		private function clearToActiveAlarm(alarm:Object):void
		{
			var alarmId:String=alarm[ColumnConstants.KEY_AlarmUniqueId];
			//log.debug("已清除未确认容器-->未清除未确认容器=" + alarmId);
			//1.删除活动告警
			var mtAlarm:Object=_clearAlarmSource.removeAlarm(alarm);
			
			//2.增加确认告警
			if (mtAlarm != null)
			{
				if (mtAlarm is Array)
				{
					var alarmArray:Array=mtAlarm as Array;
					for each (var mvalarm:Object in alarmArray)
					{
						_activeAlarmSource.addAlarm(mvalarm);
					}
				}
				else
				{
					_activeAlarmSource.addAlarm(mtAlarm);
				}
			}
		}
		
		//未清除未确认告警移除
		private function removeActiveAlarm(alarm:Object):void
		{
			//log.debug("未清除未确认告警移除=" + alarm[ColumnConstants.KEY_AlarmUniqueId]);
			_activeAlarmSource.removeAlarm(alarm);
		}

		//已清除未确认告警移除
		private function removeClearAlarm(alarm:Object):void
		{
			//log.debug("已清除未确认告警移除=" + alarm[ColumnConstants.KEY_AlarmUniqueId]);
			_clearAlarmSource.removeAlarm(alarm);
		}

		//未清除已确认告警移除
		private function removeAckAlarm(alarm:Object):void
		{
			//log.debug("未清除已确认告警移除=" + alarm[ColumnConstants.KEY_AlarmUniqueId]);
			_ackAlarmSource.removeAlarm(alarm);
		}

		//未清除未确认关联关系新增
		private function addActiveRelationShip(alarm:Object):void
		{
			//log.debug("未清除未确认关联关系新增");
			_activeAlarmSource.addRelationShip(alarm);
		}

		//已清除未确认关联关系新增
		private function addClearRelationShip(alarm:Object):void
		{
			//log.debug("已清除未确认关联关系新增");
			_clearAlarmSource.addRelationShip(alarm);
		}

		//未清除已确认关联关系新增
		private function addAckRelationShip(alarm:Object):void
		{
			//log.debug("未清除已确认关联关系新增");
			_ackAlarmSource.addRelationShip(alarm);
		}

		//清空窗口告警容器
		override public function clearWindowSource(clearCache:Boolean=true):void
		{
			//清空缓存
			if (clearCache)
			{
				_cacheAlarmArray=new Array();
			}
			//清空容器
			_ackAlarmSource.clearWindowSource();
			_activeAlarmSource.clearWindowSource();
			_clearAlarmSource.clearWindowSource();
		}

		//获取告警数据源
		override public function alarmSource(windowType:int):ICollection
		{
			//已确认未清除窗口数据源
			if (windowType == 2 || windowType == 4)
			{
				log.info("已确认未清除窗口数据源:" + windowType);
				return _ackAlarmSource;
			}
			//未确认未清除窗口数据源
			if (windowType == 1 || windowType == 3 || windowType == 5)
			{
				log.info("未确认未清除窗口数据源:" + windowType);
				return _activeAlarmSource;
			}
			//未确认已清除窗口数据源
			log.info("未确认已清除窗口数据源:" + windowType);
			return _clearAlarmSource;
		}

		//通过窗口ID获取告警数
		override public function getAlarmNumByWindowId(windowId:String):int
		{
			return _activeAlarmSource.dataArray.length + _clearAlarmSource.dataArray.length + _ackAlarmSource.dataArray.length;
		}
	}
}