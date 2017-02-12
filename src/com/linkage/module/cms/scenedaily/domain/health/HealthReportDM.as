package com.linkage.module.cms.scenedaily.domain.health
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HealthReportDM
	{
		//GSM 指标数据
		private var _gsmKpiList:ArrayCollection=new ArrayCollection();

		//GSM 总结
		private var _gsmSumList:ArrayCollection=new ArrayCollection();

		//TD 指标数据
		private var _tdKpiList:ArrayCollection=new ArrayCollection();

		//TD 总结
		private var _tdSumList:ArrayCollection=new ArrayCollection();

		[Bindable]
		public function get gsmKpiList():ArrayCollection
		{
			return _gsmKpiList;
		}

		public function set gsmKpiList(value:ArrayCollection):void
		{
			_gsmKpiList = value;
		}

		[Bindable]
		public function get gsmSumList():ArrayCollection
		{
			return _gsmSumList;
		}

		public function set gsmSumList(value:ArrayCollection):void
		{
			_gsmSumList = value;
		}

		[Bindable]
		public function get tdKpiList():ArrayCollection
		{
			return _tdKpiList;
		}

		public function set tdKpiList(value:ArrayCollection):void
		{
			_tdKpiList = value;
		}

		[Bindable]
		public function get tdSumList():ArrayCollection
		{
			return _tdSumList;
		}

		public function set tdSumList(value:ArrayCollection):void
		{
			_tdSumList = value;
		}


	}
}