package com.linkage.module.cms.scenedaily.view.components.threshold
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-6
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ThresHoldDelPanelPM
	{
//		public var relation:Object={"1": "一", "2": "二", "3": "三", "4": "四", "5": "五", "6": "六", "7": "七", "8": "八", "9": "九", "10": "十", "11": "十一", "12": "十二", "13": "十三", "14": "十四", "15": "十五"};

		//符号
		[Bindable]
		public var characterList:ArrayCollection = new ArrayCollection([{"key": "-1", "character": "请选择"}, {"key": "1", "character": "<"}, {"key": "2", "character": "<="}, {"key": "3", "character": "="}, {"key": "4", "character": ">"}, {"key": "5", "character": ">="}]);

		//符号
		[Bindable]
		public var characterUpList:ArrayCollection = new ArrayCollection([{"key": "-1", "character": "请选择"}, {"key": "1", "character": "<"}, {"key": "2", "character": "<="}, {"key": "3", "character": "="}]);

		//符号
		[Bindable]
		public var characterDownList:ArrayCollection = new ArrayCollection([{"key": "-1", "character": "请选择"}, {"key": "3", "character": "="}, {"key": "4", "character": ">"}, {"key": "5", "character": ">="}]);


		//告警级别
		[Bindable]
		public var alarmLevelList:ArrayCollection = new ArrayCollection([{"key": "1", "level": "一级告警"}, {"key": "2", "level": "二级告警"}, {"key": "3", "level": "三级告警"}, {"key": "4", "level": "四级告警"},]);

		//系统常用颜色
		[Bindable]
		public var colorList:ArrayCollection = new ArrayCollection([{"key": "0XFF0000", "color": "红"}, {"key": "0XEE9800", "color": "橙"}, {"key": "0XFED701", "color": "黄"}, {"key": "0X4169E1", "color": "蓝"}]);

		//是否发告警
		[Bindable]
		public var sendAlarmList:ArrayCollection = new ArrayCollection([{"key": "0", "issend": "否"}, {"key": "1", "issend": "是"}]);

		/**
		 * 是否派单 0 否  1是
		 * */
		[Bindable]
		public var sendSheetList:ArrayCollection = new ArrayCollection([{"key": "0", "issend": "否"}, {"key": "1", "issend": "是"}]);
	}
}