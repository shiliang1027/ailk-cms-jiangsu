package com.linkage.module.cms.scenedaily.domain.threshold
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ThresHoldDM
	{
		//1: 采集粒度2:小时3:日4:周5:月
		//指标名称
		private var _proKpiNames1:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var proKpiNames2:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var proKpiNames3:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var proKpiNames4:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var proKpiNames5:ArrayCollection=new ArrayCollection();

		//1: 采集粒度2:小时3:日4:周5:月
		//指标名称
		[Bindable]
		public var cityKpiNames1:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var cityKpiNames2:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var cityKpiNames3:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var cityKpiNames4:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var cityKpiNames5:ArrayCollection=new ArrayCollection();

		//1: 采集粒度2:小时3:日4:周5:月
		//指标名称
		[Bindable]
		public var moKpiNames1:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var moKpiNames2:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var moKpiNames3:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var moKpiNames4:ArrayCollection=new ArrayCollection();

		//指标名称
		[Bindable]
		public var moKpiNames5:ArrayCollection=new ArrayCollection();

		//地市
		[Bindable]
		public var cityList:ArrayCollection=new ArrayCollection();

		//网元类型
		[Bindable]
		public var moTypeList1:ArrayCollection=new ArrayCollection();

		//网元类型
		[Bindable]
		public var moTypeList2:ArrayCollection=new ArrayCollection();

		//网元类型
		[Bindable]
		public var moTypeList3:ArrayCollection=new ArrayCollection();

		//网元类型
		[Bindable]
		public var moTypeList4:ArrayCollection=new ArrayCollection();

		//网元类型
		[Bindable]
		public var moTypeList5:ArrayCollection=new ArrayCollection();


		[Bindable]
		public function get proKpiNames1():ArrayCollection
		{
			return _proKpiNames1;
		}

		public function set proKpiNames1(value:ArrayCollection):void
		{
			_proKpiNames1=value;
		}

	}
}