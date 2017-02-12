package com.linkage.module.cms.viewperformance.domain
{
	import mx.collections.ArrayCollection;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-11-03
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ViewPerformanceDM
	{
		public var queryParam:*=new Object();
		
		public var parameters:Object = new Object();
		
		[Bindable]
		public var _gatherTime:String = new String();
		
		[Bindable]
		public var _selectIndex:int = new int();
		
		[Bindable]
		public var _lineOrAreaChart:int = new int();
		
		[Bindable]
		public var _viewPerfData:ArrayCollection=new ArrayCollection();
		
		[Bindable]
		public var _viewPerfConfidData:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public var _viewPerfCharData:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public var _rateKeyNameData:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public var _leftMenuData:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public var _newViewPerfChartData:ArrayCollection = new ArrayCollection();
		
		public function get viewPerfData():ArrayCollection
		{
			return _viewPerfData;
		}

		[Bindable]
		public function set viewPerfData(value:ArrayCollection):void
		{
			_viewPerfData = value;
		}
		
		public function get viewPerfConfidData():ArrayCollection
		{
			return _viewPerfConfidData;
		}
		
		[Bindable]
		public function set viewPerfConfidData(value:ArrayCollection):void
		{
			_viewPerfConfidData= value;
		}
		
		public function get viewPerfCharData():ArrayCollection
		{
			return _viewPerfCharData;
		}
		
		[Bindable]
		public function set viewPerfCharData(value:ArrayCollection):void
		{
			_viewPerfCharData = value;
		}
		public function get rateKeyNameData():ArrayCollection
		{
			return _rateKeyNameData;
		}
		
		[Bindable]
		public function set rateKeyNameData(value:ArrayCollection):void
		{
			_rateKeyNameData=value;
		}
		
		public function get gatherTime():String
		{
			return _gatherTime;
		}
		
		[Bindable]
		public function set gatherTime(value:String):void
		{
			_gatherTime=value;
		}
		
		
		public function get selectIndex():int
		{
			return _selectIndex;
		}
		
		[Bindable]
		public function set selectIndex(value:int):void
		{
			_selectIndex=value;
		}
		
		public function get lineOrAreaChart():int
		{
			return _lineOrAreaChart;
		}
		
		[Bindable]
		public function set lineOrAreaChart(value:int):void
		{
			_lineOrAreaChart=value;
		}
		
		
		public function get leftMenuData():ArrayCollection
		{
			return _leftMenuData;
		}
		
		[Bindable]
		public function set leftMenuData(value:ArrayCollection):void
		{
			_leftMenuData=value;
		}
		
		public function get newViewPerfChartData():ArrayCollection
		{
			return _newViewPerfChartData;
		}
		[Bindable]
		public function set newViewPerfChartData(value:ArrayCollection):void
		{
			_newViewPerfChartData = value;
		}
		
	}
}