package com.linkage.module.cms.scene.domain
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-7-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ResMatrixDM
	{

		//资源矩阵数据
		private var _resData:ArrayCollection = new ArrayCollection();

		//劣化矩阵数据
		private var _badData:ArrayCollection = new ArrayCollection();

		//资源矩阵详情
		private var _equipmentDetailList:ArrayCollection = new ArrayCollection();

		private var _areaList:ArrayCollection=new ArrayCollection();
		//设备资源网元详细信息
		private var _moInfoList:ArrayCollection = new ArrayCollection();

		public function get resData():ArrayCollection
		{
			return _resData;
		}

		[Bindable]
		public function set resData(value:ArrayCollection):void
		{
			_resData = value;
		}

		public function get badData():ArrayCollection
		{
			return _badData;
		}

		public function set badData(value:ArrayCollection):void
		{
			_badData = value;
		}

		public function get equipmentDetailList():ArrayCollection
		{
			return _equipmentDetailList;
		}

		public function set equipmentDetailList(value:ArrayCollection):void
		{
			_equipmentDetailList = value;
		}

		public function get moInfoList():ArrayCollection
		{
			return _moInfoList;
		}

		public function set moInfoList(value:ArrayCollection):void
		{
			_moInfoList = value;
		}

		[Bindable]
		public function get areaList():ArrayCollection
		{
			return _areaList;
		}

		public function set areaList(value:ArrayCollection):void
		{
			_areaList=value;
		}
	}
}