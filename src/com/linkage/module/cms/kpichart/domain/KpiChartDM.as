package com.linkage.module.cms.kpichart.domain
{
	import mx.collections.ArrayCollection;

	public class KpiChartDM
	{
		public function KpiChartDM()
		{
		}
		
		private var _charts:ArrayCollection = new ArrayCollection();

		[Bindable]
		/**
		 * 指标图表数据
		 * */
		public function get charts():ArrayCollection
		{
			return _charts;
		}

		/**
		 * @private
		 */
		public function set charts(value:ArrayCollection):void
		{
			_charts = value;
		}

	}
}