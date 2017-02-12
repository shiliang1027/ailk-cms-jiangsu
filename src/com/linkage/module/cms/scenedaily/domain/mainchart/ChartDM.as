package com.linkage.module.cms.scenedaily.domain.mainchart
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	import mx.collections.ArrayCollection;

	public class ChartDM
	{
		private var log:ILogger = Log.getLoggerByClass(ChartDM);

		//劣化排名数据
		private var _topNList:ArrayCollection = new ArrayCollection();

		//历史时间的劣化排名
		private var _popupTopNList:ArrayCollection = new ArrayCollection();

		//指标趋势
		private var _kpiTrendList:ArrayCollection = new ArrayCollection();
		//弹出窗口的历史数据
		private var _kpiHistoryList:ArrayCollection = new ArrayCollection();


		public function get popupTopNList():ArrayCollection
		{
			return _popupTopNList;
		}

		[Bindable]
		public function set popupTopNList(value:ArrayCollection):void
		{
			_popupTopNList = value;
		}


		public function get kpiHistoryList():ArrayCollection
		{
			return _kpiHistoryList;
		}

		[Bindable]
		public function set kpiHistoryList(value:ArrayCollection):void
		{
			_kpiHistoryList = value;
		}


		public function get kpiTrendList():ArrayCollection
		{
			return _kpiTrendList;
		}

		[Bindable]
		public function set kpiTrendList(value:ArrayCollection):void
		{
			_kpiTrendList = value;
		}

		public function get topNList():ArrayCollection
		{
			return _topNList;
		}

		[Bindable]
		public function set topNList(value:ArrayCollection):void
		{
			_topNList = value;
		}

	}
}

