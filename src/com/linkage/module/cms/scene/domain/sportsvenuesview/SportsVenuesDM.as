package com.linkage.module.cms.scene.domain.sportsvenuesview
{
	import mx.collections.ArrayCollection;

	public class SportsVenuesDM
	{
		//表格数据
		private var _dataMap:Object = new Object();
		
		private var _dataList:ArrayCollection = new ArrayCollection();
		
		//表格列
		private var _groColumns:Array=[];

		[Bindable]
		public function get dataMap():Object
		{
			return _dataMap;
		}

		public function set dataMap(value:Object):void
		{
			_dataMap = value;
		}

		[Bindable]
		public function get groColumns():Array
		{
			return _groColumns;
		}
		
		public function set groColumns(value:Array):void
		{
			_groColumns = value;
		}

		public function get dataList():ArrayCollection
		{
			return _dataList;
		}

		[Bindable]
		public function set dataList(value:ArrayCollection):void
		{
			_dataList = value;
		}

	}
}