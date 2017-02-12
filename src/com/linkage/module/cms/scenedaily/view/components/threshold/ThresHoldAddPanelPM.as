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
	public class ThresHoldAddPanelPM
	{

		//符号
		[Bindable]
		public var characterUpList:ArrayCollection=new ArrayCollection([{"key": "-1", "character": "请选择"}, {"key": "1", "character": "<"}, {"key": "2", "character": "<="}, {"key": "3", "character": "="}]);

		//符号
		[Bindable]
		public var characterDownList:ArrayCollection=new ArrayCollection([{"key": "-1", "character": "请选择"}, {"key": "3", "character": "="}, {"key": "4", "character": ">"}, {"key": "5", "character": ">="}]);

		//告警级别
		[Bindable]
		public var alarmLevelList:ArrayCollection=new ArrayCollection([{"key": "1", "level": "一级告警"}, {"key": "2", "level": "二级告警"}, {"key": "3", "level": "三级告警"}, {"key": "4", "level": "四级告警"},]);

		//是否发告警
		[Bindable]
		public var sendAlarmList:ArrayCollection=new ArrayCollection([{"key": "0", "issend": "否"}, {"key": "1", "issend": "是"}]);
	}
}