package com.linkage.module.cms.scenedaily.domain.healthreport
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HealthReportSetDM
	{
		//健康分类指标树
		private var _healthTreeData:XML = new XML;
		//健康分类指标结果集
		private var _healthReportInfo:ArrayCollection = new ArrayCollection;

		public function get healthReportInfo():ArrayCollection
		{
			return _healthReportInfo;
		}

		[Bindable]
		public function set healthReportInfo(value:ArrayCollection):void
		{
			_healthReportInfo = value;
		}

		public function get healthTreeData():XML
		{
			return _healthTreeData;
		}

		[Bindable]
		public function set healthTreeData(value:XML):void
		{
			_healthTreeData = value;
		}

	}
}