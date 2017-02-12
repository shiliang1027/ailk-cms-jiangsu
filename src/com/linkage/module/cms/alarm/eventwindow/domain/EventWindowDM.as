package com.linkage.module.cms.alarm.eventwindow.domain
{
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;

	public class EventWindowDM
	{
		public var parameters:Object = new Object();
		
		public var timer:Timer = new Timer(30000);
		private var _remark:String;
		private var _eventName:String;
		
		private var _datas:ArrayCollection = new ArrayCollection();
		//地市
		private var _cityProvider:ArrayCollection = new ArrayCollection();
		//专业
		private var _specProvider:ArrayCollection = new ArrayCollection();
		//调度人
		private var _operatorProvider:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public function get datas():ArrayCollection
		{
			return _datas;
		}
		
		public function set datas(value:ArrayCollection):void
		{
			_datas = value;
		}
		
		[Bindable]
		public function get remark():String
		{
			return _remark;
		}
		
		public function set remark(value:String):void
		{
			_remark = value;
		}
		[Bindable]
		public function get eventName():String
		{
			return _eventName;
		}
		
		public function set eventName(value:String):void
		{
			_eventName = value;
		}

		[Bindable]
		public function get cityProvider():ArrayCollection
		{
			return _cityProvider;
		}
		public function set cityProvider(value:ArrayCollection):void
		{
			_cityProvider = value;
		}
		
		[Bindable]
		public function get specProvider():ArrayCollection
		{
			return _specProvider;
		}
		public function set specProvider(value:ArrayCollection):void
		{
			_specProvider = value;
		}
		
		[Bindable]
		public function get operatorProvider():ArrayCollection
		{
			return _operatorProvider;
		}
		public function set operatorProvider(value:ArrayCollection):void
		{
			_operatorProvider = value;
		}
		
	}
}