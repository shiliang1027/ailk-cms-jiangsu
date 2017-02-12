package com.linkage.module.cms.gsscene.view.components.quitservice
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	import mx.collections.ArrayCollection;

	public class QuitServiceDM
	{
		private var _dataList:ArrayCollection = new ArrayCollection();
		//概括统计
		private var _gktjList:ArrayCollection = new ArrayCollection();

		private var _cityQuitDataList:ArrayCollection = new ArrayCollection(); //
		//退服统计详情
		private var _quitServiceDetail:Object = new Object();

		private var _qssDetail:ArrayCollection = new ArrayCollection();

		public function get dataList():ArrayCollection
		{
			return _dataList;
		}

		[Bindable]
		public function set dataList(value:ArrayCollection):void
		{
			_dataList = value;
		}

		public function get cityQuitDataList():ArrayCollection
		{
			return _cityQuitDataList;
		}

		[Bindable]
		public function set cityQuitDataList(value:ArrayCollection):void
		{
			_cityQuitDataList = value;
		}

		public function get quitServiceDetail():Object
		{
			return _quitServiceDetail;
		}

		public function set quitServiceDetail(value:Object):void
		{
			_quitServiceDetail = value;
		}

		public function get gktjList():ArrayCollection
		{
			return _gktjList;
		}

		[Bindable]
		public function set gktjList(value:ArrayCollection):void
		{
			_gktjList = value;
		}

		[Bindable]
		/**
		 * 地市查询详情列表
		 * */
		public function get qssDetail():ArrayCollection
		{
			return _qssDetail;
		}

		/**
		 * @private
		 */
		public function set qssDetail(value:ArrayCollection):void
		{
			_qssDetail = value;
		}


	}
}