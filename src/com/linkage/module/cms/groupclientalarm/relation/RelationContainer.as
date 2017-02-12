package com.linkage.module.cms.groupclientalarm.relation
{

	/**
	 *关联窗口容器
	 * @author mengqiang
	 *
	 */
	public class RelationContainer
	{
		/**
		 *横坐标key值
		 */
		public static const XID:String="x_id";
		/**
		 *横坐标Name值
		 */
		public static const XNAME:String="x_name";
		/**
		 *横坐标值
		 */
		public static const XVALUE:String="x_value";
		/**
		 *矩阵告警ID 
		 */		
		public static const MATRIXALARMID:String = "matrixAlarmId";
		/**
		 *告警发生时间
		 */
		public static const ALARMEVENTTIME:String="value=eventtime";
		/**
		 *派单状态
		 */
		public static const ALARMSHEETSTATUS:String="value=sheetsendstatus_label";
		/**
		 *矩阵树唯一标识
		 */
		public static const MATRIXTREEUNIQUE:String="matrix_tree";
		/**
		 *关联矩阵总窗口
		 */
		public static const WINDOWNAME_RELATIONTOTAL:String="relationTotal";
		/**
		 * 集客监控专题
		 */
		public static const WINDOWNAME_RELATIONCUST:String="relationCust";
		/**
		 * 基站跨专业专题(基站跨专业监控专题)
		 */
		public static const WINDOWNAME_RELATIONBTS:String="relationBts";
		/**
		 * 数据-传输专业专题(集中性能监控专题)
		 */
		public static const WINDOWNAME_RELATIONDATATRANS:String="relationDataTrans";
		/**
		 * 核心-传输专业专题(其他跨专业监控专题)
		 */
		public static const WINDOWNAME_RELATIONCORETRANS:String="relationCoreTrans";
		/**
		 * 核心-承载专业专题(故障关联预判专题)
		 */
		public static const WINDOWNAME_RELATIONCORECARRY:String="relationCoreCarry";
		/**
		 * 跨专业监控专题
		 */
		public static const WINDOWNAME_ACROSSSPECRELATION:String="acrossSpecRelation";
		/**
		 * 专业内监控专题
		 */
		public static const WINDOWNAME_SPECIALTYINNER:String="specialtyInner";
		/**
		 *大面积基站退服
		 */
		public static const WINDOWNAME_RULEBTSOUTBIG:String="[衍生关联]大面积基站退服关联";
		/**
		 *规则名称
		 */
		public static const WINDOW_RULENAME:String="value=rulename";
		/**
		 *无线侧设备
		 */
		public static const WINDOW_WIRELESS_ALARMSORT:String="wireless=alarmsort";
		/**
		 *无线侧传输、传输中断、市电停电、直流欠压、一次下电
		 */
		public static const WINDOW_SUBJECT_ALARMSORT:String="subject=alarmsort";
		/**
		 *基站退服值
		 */
		public static const Alarm_Column_OutBtsValue1:String="69";
		/**
		 *基站退服值
		 */
		public static const Alarm_Column_OutBtsValue2:String="71";
		/**
		 * 无线侧传输原因
		 */
		public static const wireLessTrans:String="无线侧传输";
		/**
		 *一次下电
		 */
		public static const powerCut1:String="一次下电";
		/**
		 *市电停电
		 */
		public static const powerCut2:String="市电停电";
		/**
		 *一次下电
		 */
		public static const powerCut3:String="直流欠压";
		/**
		 *传输中断
		 */
		public static const tranAlarm:String="传输中断";
		/**
		 *传输
		 */
		public static const alarmTran:String="传输";
		/**
		 * 停电
		 */
		public static const stopPower:String="停电";
		/**
		 * 无线
		 */
		public static const wireLess:String="无线";
		/**
		 *客户级别映射关系
		 */
		public static const CUST_BUSINESSLEVELOBJECT:Object={'砖石服务': '1', '金牌服务': '2', '银牌服务': '3', '铜牌服务': '4', '标准服务': '5'};
	}
}