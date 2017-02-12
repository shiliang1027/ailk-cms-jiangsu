package com.linkage.module.cms.groupmonitor.custscene.alarmSearch.domain
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2013-2-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class AlarmSignDM
	{
		private var _alarmSignList:ArrayCollection = new ArrayCollection();
		private var _CustServType:ArrayCollection = new ArrayCollection();
		private var _countTotal:int;
		private var _clearResult:String;

		public function get alarmSignList():ArrayCollection
		{
			return _alarmSignList;
		}

		[Bindable]
		public function set alarmSignList(value:ArrayCollection):void
		{
			_alarmSignList = value;
		}
		
		public function get countTotal():int
		{
			return _countTotal;
		}

		[Bindable]
		public function set countTotal(value:int):void
		{
			_countTotal = value;
		}

		public function get clearResult():String
		{
			return _clearResult;
		}

		public function set clearResult(value:String):void
		{
			_clearResult = value;
		}


	}
}