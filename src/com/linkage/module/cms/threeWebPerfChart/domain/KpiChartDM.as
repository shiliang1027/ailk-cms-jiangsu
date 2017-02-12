package com.linkage.module.cms.threeWebPerfChart.domain
{
	import mx.collections.ArrayCollection;

	public class KpiChartDM
	{
		public function KpiChartDM()
		{
		}
		[Bindable]
		public var chartDatas:ArrayCollection = new ArrayCollection();
		
		private var _adminTreeData:XML = new XML(); //新树图-行政区域
		
		private var _specialTreeData:XML = new XML(); //新树图-特定区域

		[Bindable]
		public function get specialTreeData():XML
		{
			return _specialTreeData;
		}

		public function set specialTreeData(value:XML):void
		{
			_specialTreeData = value;
		}

		[Bindable]
		public function get adminTreeData():XML
		{
			return _adminTreeData;
		}

		public function set adminTreeData(value:XML):void
		{
			_adminTreeData = value;
		}


	}
}