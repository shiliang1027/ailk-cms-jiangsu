package com.linkage.module.cms.scene.domain
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import mx.collections.ArrayCollection;

	public class PerformanceIndexDM
	{
		private var _kpiDatas:Object;

		//业务性能指标
		private var _servPerfDP:ArrayCollection = new ArrayCollection();

		//设备性能指标
		private var _moPerfDP:ArrayCollection = new ArrayCollection();

		//客户感知性能指标
		private var _custPerfDP:ArrayCollection = new ArrayCollection();

		//告警信息
		private var _alarmDP:ArrayCollection = new ArrayCollection();

		//劣化指标信息
		private var _badKpiDP:ArrayCollection = new ArrayCollection();

		public function get kpiDatas():Object
		{
			return _kpiDatas;
		}

		[Bindable]
		public function set kpiDatas(value:Object):void
		{
			_kpiDatas = value;
		}

		public function get servPerfDP():ArrayCollection
		{
			return _servPerfDP;
		}

		[Bindable]
		public function set servPerfDP(value:ArrayCollection):void
		{
			_servPerfDP = value;
		}

		public function get moPerfDP():ArrayCollection
		{
			return _moPerfDP;
		}

		[Bindable]
		public function set moPerfDP(value:ArrayCollection):void
		{
			_moPerfDP = value;
		}

		public function get custPerfDP():ArrayCollection
		{
			return _custPerfDP;
		}

		[Bindable]
		public function set custPerfDP(value:ArrayCollection):void
		{
			_custPerfDP = value;
		}

		public function get alarmDP():ArrayCollection
		{
			return _alarmDP;
		}

		[Bindable]
		public function set alarmDP(value:ArrayCollection):void
		{
			_alarmDP = value;
		}

		public function get badKpiDP():ArrayCollection
		{
			return _badKpiDP;
		}

		[Bindable]
		public function set badKpiDP(value:ArrayCollection):void
		{
			_badKpiDP = value;
		}

	}
}

