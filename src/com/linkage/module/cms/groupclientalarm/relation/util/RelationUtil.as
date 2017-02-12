package com.linkage.module.cms.groupclientalarm.relation.util
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.alarm.framework.common.util.AlarmUtil;
	import com.linkage.module.cms.groupclientalarm.relation.RelationContainer;

	/**
	 *关联关系Util
	 * @author mengqiang
	 *
	 */
	public class RelationUtil
	{
		/**
		 *验证矩阵是更新值 valuepc=:更新值
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixValuePc(str:String):Boolean
		{
			return str.indexOf("valuepc=") != -1;
		}

		/**
		 *验证矩阵是更新值 value=:更新值
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixValue(str:String):Boolean
		{
			return str.indexOf("value=") != -1;
		}

		/**
		 *验证矩阵是最高级别更新值 valueh=:更新值
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixValueh(str:String):Boolean
		{
			return str.indexOf("valueh=") != -1;
		}

		/**
		 *验证矩阵是告警分类
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixAlarmSort(str:String):Boolean
		{
			return str.indexOf(RelationContainer.WINDOW_WIRELESS_ALARMSORT) != -1 || str.indexOf(RelationContainer.WINDOW_SUBJECT_ALARMSORT) != -1;
		}

		/**
		 *验证矩阵是统计值 count=:更新值
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixCount(str:String):Boolean
		{
			return str.indexOf("count=") != -1;
		}

		/**
		 *验证矩阵是统计值 subject=:更新值
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixSubject(str:String):Boolean
		{
			return str.indexOf("subject=") != -1;
		}

		/**
		 *验证是否是客户级别
		 * @param str
		 * @return
		 *
		 */
		public static function checkBusinessLevel(str:String):Boolean
		{
			return str.indexOf("=businesslevel_label") != -1;
		}

		/**
		 *验证矩阵是故障根源 faultsource=alarmsort
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixFault(str:String):Boolean
		{
			return str.indexOf("faultsource=") != -1;
		}

		/**
		 *验证矩阵是无线侧设备原因 wireless=alarmsort
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixWireLess(str:String):Boolean
		{
			return str.indexOf("wireless=") != -1;
		}

		/**
		 *验证矩阵是bts bts=更新值
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixBTS(str:String):Boolean
		{
			return str.indexOf("bts=") != -1;
		}

		/**
		 *验证矩阵是bts bts=alarmsubtype
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixBTSOut(str:String):Boolean
		{
			return str.indexOf("btsout=") != -1;
		}

		/**
		 *验证矩阵是基站主告警 mainalarm=alarmsubtype
		 * @param str
		 * @return
		 *
		 */
		public static function checkMatrixMainAlarm(str:String):Boolean
		{
			return str.indexOf("mainalarm=") != -1;
		}

		/**
		 *验证矩阵是否是等级
		 * @param str
		 * @return
		 *
		 */
		public static function checkIsMatrixLevel(str:String):Boolean
		{
			return str.indexOf("_level") != -1;
		}

		/**
		 *验证矩阵是规则名称和告警标题、客户名称
		 * @param str
		 * @return
		 *
		 */
		public static function checkRuleTitle(str:String):Boolean
		{
			return str == 'value=rulename' || str == 'value=alarmtitle' || str == 'value=groupcustomer';
		}

		/**
		 *验证矩阵是时间
		 * @param str
		 * @return
		 *
		 */
		public static function checkRelationTime(str:String):Boolean
		{
			return str == 'value=eventtime_label' || str == 'value=daltime_label';
		}

		/**
		 *验证数值是否为空
		 * @param str
		 * @return
		 *
		 */
		public static function checkValueNull(str:String):Boolean
		{
			return str == null || str == "null" || str == "" || str == "undefined";
		}

		/**
		 *字符串转换为字符串
		 * @param str
		 * @return
		 *
		 */
		public static function strToStr(str:String):String
		{
			return str == null || str == "null" || str == "undefined" ? "" : str;
		}
		/**
		 *是否大面积基站退服
		 * @param data
		 * @return
		 *
		 */
		public static function checkIsBigBtsOut(data:Object):Boolean
		{
			return data[RelationContainer.WINDOW_RULENAME] == RelationContainer.WINDOWNAME_RULEBTSOUTBIG;
		}

		/**
		 *按客户级别排序函数
		 * @param obj1
		 * @param obj2
		 * @return
		 *
		 */
		public static function sortCustLevel(obj1:Object, obj2:Object):int
		{
			var custObj:Object=RelationContainer.CUST_BUSINESSLEVELOBJECT;
			var value1:Number=custObj[obj1["value=businesslevel_label"]];
			var value2:Number=custObj[obj2["value=businesslevel_label"]];
			if (value1 < value2)
			{
				return -1;
			}
			else if (value1 > value2)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}

		/**
		 *验证str1是否包含str2
		 * @param str1
		 * @param str2
		 * @return
		 *
		 */
		public static function checkIsHave(str1:String, str2:String):Boolean
		{
			return str2 == null ? true : str1.indexOf(str2) != -1;
		}

		/**
		 *获取矩阵统计背景颜色
		 * @param num 统计数据
		 * @return
		 *
		 */
		public static function getMatrixColorBgLevel(level:String):String
		{
			var color:String=null;
			switch (level)
			{
				case "1":
					color="0XFF0000";
					break;
				case "2":
					color="0XEE9800";
					break;
				case "3":
					color="0XFED701";
					break;
				case "4":
					color="0X4169E1";
			}
			return color;
		}

		/**
		 * 返回告警的较高等级
		 * @param level1
		 * @param level2
		 * @return
		 *
		 */
		public static function maxAlarmLevel(level1:String, level2:String):int
		{
			if (!AlarmUtil.checkStrIsNull(level1))
			{
				return int(level2);
			}
			if (!AlarmUtil.checkStrIsNull(level2))
			{
				return int(level1);
			}
			var level1Num:int=int(level1);
			var level2Num:int=int(level2);
			if (level1Num == 0)
			{
				return level2Num;
			}
			if (level2Num == 0)
			{
				return level1Num;
			}
			return level1Num < level2Num ? level1Num : level2Num;
		}

		/**
		 * 比较告警等级
		 * @param level1
		 * @param level2
		 * @return
		 *
		 */
		public static function compAlarmLevel(level1:String, level2:String):Boolean
		{
			if (!AlarmUtil.checkStrIsNull(level1))
			{
				return false;
			}
			if (!AlarmUtil.checkStrIsNull(level2))
			{
				return true;
			}
			return int(level1) < int(level2);
		}

		/**
		 *获取告警唯一序列ID数组过滤器
		 * @param uniqueIdArray 唯一序列ID数组
		 * @return
		 *
		 */
		public static function getAlarmUniqueIdFilter(uniqueIdArray:Array):String
		{
			var filter:String=ColumnConstants.KEY_AlarmUniqueId + " in(";
			var index:Boolean=true;
			for each (var uniqueId:String in uniqueIdArray)
			{
				if (!index)
				{
					filter+=",";
				}
				filter+=uniqueId;
				index=false;
			}
			filter+=")";
			return filter;
		}

		/**
		 *获取矩阵告警分类过滤规则
		 * @param rule 过滤规则
		 * @return
		 *
		 */
		public static function getMatrixSortFilterRule(rule:String):String
		{
			//1.如果为空直接返回空
			if (checkValueNull(rule))
			{
				return null;
			}

			//2.获取分类过滤规则
			if (rule == RelationContainer.WINDOW_WIRELESS_ALARMSORT)
			{
				return "alarmsort!=无线侧传输&alarmsort!=传输中断&alarmsort!=市电停电&alarmsort!=直流欠压&alarmsort!=一次下电&parentflag!=2";
			}
			var filterRule:String=rule.substr(8);
			var filterArray:Array=filterRule.split("/");
			if (filterArray == null || filterArray.length != 2)
			{
				return null;
			}
			return filterArray[0] + "=" + filterArray[1];
		}

		/**
		 *获取矩阵告警统计过滤规则
		 * @param rule 过滤规则
		 * @return
		 *
		 */
		public static function getMatrixCountFilterRule(rule:String):String
		{
			//1.如果为空直接返回空
			if (checkValueNull(rule))
			{
				return null;
			}

			//2.获取统计过滤规则
			var filterRule:String=rule.substr(6);
			var filterArray:Array=filterRule.split("/");
			if (filterArray == null || filterArray.length != 2)
			{
				return null;
			}
			return filterArray[0] + "=" + filterArray[1];
		}
	}
}