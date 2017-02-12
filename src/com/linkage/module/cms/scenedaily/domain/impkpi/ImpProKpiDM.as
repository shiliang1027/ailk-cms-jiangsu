package com.linkage.module.cms.scenedaily.domain.impkpi
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-21
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ImpProKpiDM
	{
		//重点性能指标结果集
		private var _kpiResultData:ArrayCollection = new ArrayCollection();
		//重点性能指标未选择结果集
		private var _kpiResultNoSelect:ArrayCollection = new ArrayCollection();
		//重点性能指标已选择结果集
		private var _kpiResultIsSelect:ArrayCollection = new ArrayCollection();
		//保存成功返回字符串
		private var _saveResultString:String;
//当前页索引
		private var _indexPage:int;
		//总页数
		private var _pageCounts:int;

		private var _counts:int;

		public function get kpiResultData():ArrayCollection
		{
			return _kpiResultData;
		}

		[Bindable]
		public function set kpiResultData(value:ArrayCollection):void
		{
			_kpiResultData = value;
		}

		public function get kpiResultNoSelect():ArrayCollection
		{
			return _kpiResultNoSelect;
		}

		[Bindable]
		public function set kpiResultNoSelect(value:ArrayCollection):void
		{
			_kpiResultNoSelect = value;
		}

		public function get kpiResultIsSelect():ArrayCollection
		{
			return _kpiResultIsSelect;
		}

		[Bindable]
		public function set kpiResultIsSelect(value:ArrayCollection):void
		{
			_kpiResultIsSelect = value;
		}

		public function get saveResultString():String
		{
			return _saveResultString;
		}

		public function set saveResultString(value:String):void
		{
			_saveResultString = value;
		}

		public function get indexPage():int
		{
			return _indexPage;
		}

		public function set indexPage(value:int):void
		{
			_indexPage = value;
		}

		public function get pageCounts():int
		{
			return _pageCounts;
		}

		public function set pageCounts(value:int):void
		{
			_pageCounts = value;
		}

		public function get counts():int
		{
			return _counts;
		}

		public function set counts(value:int):void
		{
			_counts = value;
		}


	}
}