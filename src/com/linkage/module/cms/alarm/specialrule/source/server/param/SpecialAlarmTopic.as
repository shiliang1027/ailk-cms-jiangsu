package com.linkage.module.cms.alarm.specialrule.source.server.param
{

	public class SpecialAlarmTopic
	{
		/**
		 * KEY: 确认告警:一级告警数量
		 */
		public static const KEY_K1:String="k1";
		/**
		 * KEY: 确认告警:二级告警数量
		 */
		public static const KEY_K2:String="k2";
		/**
		 * KEY: 确认告警:三级告警数量
		 */
		public static const KEY_K3:String="k3";
		/**
		 * KEY: 确认告警:四级告警数量
		 */
		public static const KEY_K4:String="k4";
		/**
		 * KEY: 自定义窗口告警统计数据TOPIC
		 */
		public static const KEY_ASN:String="asn";
		/**
		 * KEY: 未清除未确认窗口：未确认告警数
		 */
		public static const KEY_A_NAC:String="a_nac";
		/**
		 * KEY: 未清除未确认窗口：未清除告警数
		 */
		public static const KEY_A_AAC:String="a_aac";
		/**
		 * KEY: 未清除已确认窗口：未确认告警数
		 */
		public static const KEY_K_NAC:String="k_nac";
		/**
		 * KEY: 未清除已确认窗口：未清除告警数
		 */
		public static const KEY_K_AAC:String="k_aac";
		/**
		 * KEY: 已清除未确认窗口：未确认告警数
		 */
		public static const KEY_C_NAC:String="c_nac";
		/**
		 * KEY: 已清除未确认窗口未清除告警数
		 */
		public static const KEY_C_AAC:String="c_aac";
		/**
		 * KEY: 自定义窗口未清除未确认告警指令
		 */
		public static const KEY_OPER_NSNK:String="nsnk";
		/**
		 * KEY: 自定义窗口未清除已确认告警指令
		 */
		public static const KEY_OPER_NSYK:String="nsyk";
		/**
		 * KEY: 自定义窗口已清除未确认告警指令
		 */
		public static const KEY_OPER_YSNK:String="ysnk";
		/**
		 * KEY: 自定义窗口已清除告警移动指令
		 */
		public static const KEY_OPER_MTYS:String="mtys";
		/**
		 * KEY: 自定义窗口已确认告警移动指令
		 */
		public static const KEY_OPER_MTYK:String="mtyk";
		/**
		 * KEY: 自定义窗口已确认告警移动指令(确认到活动)
		 */
		public static const KEY_OPER_MTK2N:String="mtk2n";
		/**
		 * KEY: 自定义窗口已确认告警移动指令(清楚到活动)
		 */
		public static const KEY_OPER_MTS2N:String="mts2n";
		/**
		 * KEY: 自定义窗口未清除未确认告警删除指令
		 */
		public static const KEY_OPER_RNSNK:String="rnsnk";
		/**
		 * KEY: 自定义窗口未清除已确认告警删除指令
		 */
		public static const KEY_OPER_RNSYK:String="rnsyk";
		/**
		 * KEY: 自定义窗口已清除未确认告警删除指令
		 */
		public static const KEY_OPER_RYSNK:String="rysnk";
		/**
		 * KEY: 自定义窗口未清除未确认关联告警指令
		 */
		public static const KEY_OPER_RSNSNK:String="rsnsnk";
		/**
		 * KEY: 自定义窗口未清除已确认关联告警指令
		 */
		public static const KEY_OPER_RSNSYK:String="rsnsyk";
		/**
		 * KEY: 自定义窗口已清除未确认关联告警指令
		 */
		public static const KEY_OPER_RSYSNK:String="rsysnk";
	}
}