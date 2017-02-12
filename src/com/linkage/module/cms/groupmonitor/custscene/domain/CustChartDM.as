package com.linkage.module.cms.groupmonitor.custscene.domain
{
	import mx.collections.ArrayCollection;

	public class CustChartDM
	{
		private var _speLineFaultList:ArrayCollection=new ArrayCollection();
		
		private var _speLineCompList:ArrayCollection=new ArrayCollection();
		
		private var _totalComplaintCount:String = "";
		private var _totalComplaintTime:String = "";
		private var _totalFaultTime:String = "";
		private var _totalFaultCount:String = "";

		[Bindable]
		public function get speLineFaultList():ArrayCollection
		{
			return _speLineFaultList;
		}
		
		public function set speLineFaultList(value:ArrayCollection):void
		{
			_speLineFaultList=value;
		}
		
		[Bindable]
		public function get speLineCompList():ArrayCollection
		{
			return _speLineCompList;
		}
		
		public function set speLineCompList(value:ArrayCollection):void
		{
			_speLineCompList=value;
		}
		
		[Bindable]
		public function get totalComplaintCount():String
		{
			return _totalComplaintCount;
		}
		
		public function set totalComplaintCount(value:String):void
		{
			_totalComplaintCount = value;
		}
		
		[Bindable]
		public function get totalComplaintTime():String
		{
			return _totalComplaintTime;
		}
		
		public function set totalComplaintTime(value:String):void
		{
			_totalComplaintTime = value;
		}
		
		[Bindable]
		public function get totalFaultTime():String
		{
			return _totalFaultTime;
		}
		
		public function set totalFaultTime(value:String):void
		{
			_totalFaultTime = value;
		}
		
		[Bindable]
		public function get totalFaultCount():String
		{
			return _totalFaultCount;
		}
		
		public function set totalFaultCount(value:String):void
		{
			_totalFaultCount = value;
		}
	}
}