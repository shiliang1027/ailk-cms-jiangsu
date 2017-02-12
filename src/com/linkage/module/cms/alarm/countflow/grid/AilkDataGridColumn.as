package com.linkage.module.cms.alarm.countflow.grid
{
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;


	/**
	 *
	 *表格展示列
	 * @author 孟强 (65453)
	 * @version 1.0
	 * @date 2012-7-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class AilkDataGridColumn extends AdvancedDataGridColumn
	{
		//是否行合并
		private var _isRowSpan:Boolean=false;

		public function get isRowSpan():Boolean
		{
			return _isRowSpan;
		}

		public function set isRowSpan(value:Boolean):void
		{
			_isRowSpan=value;
		}
	}
}