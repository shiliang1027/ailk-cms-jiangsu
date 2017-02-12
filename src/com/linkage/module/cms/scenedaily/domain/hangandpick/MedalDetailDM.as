package com.linkage.module.cms.scenedaily.domain.hangandpick
{
	import mx.collections.ArrayCollection;

	/**
	 *挂牌网元详情
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MedalDetailDM
	{
		//挂牌网元基本信息
		private var _baseInfoData:ArrayCollection = new ArrayCollection;
		//挂牌网元历史信息
		private var _historyInfoData:ArrayCollection = new ArrayCollection;
		//挂牌网元性能信息
		private var _propertyInfoData:ArrayCollection = new ArrayCollection;
		//挂牌网元工单信息
		private var _workOrderInfoData:ArrayCollection = new ArrayCollection;
		//摘牌信息
		private var _pickOffMedalInfo:ArrayCollection = new ArrayCollection;
		//摘牌图表信息
		private var _pickOffMedalChar:ArrayCollection = new ArrayCollection;

		public function get baseInfoData():ArrayCollection
		{
			return _baseInfoData;
		}

		[Bindable]
		public function set baseInfoData(value:ArrayCollection):void
		{
			_baseInfoData = value;
		}

		public function get historyInfoData():ArrayCollection
		{
			return _historyInfoData;
		}

		[Bindable]
		public function set historyInfoData(value:ArrayCollection):void
		{
			_historyInfoData = value;
		}

		public function get propertyInfoData():ArrayCollection
		{
			return _propertyInfoData;
		}

		[Bindable]
		public function set propertyInfoData(value:ArrayCollection):void
		{
			_propertyInfoData = value;
		}

		public function get workOrderInfoData():ArrayCollection
		{
			return _workOrderInfoData;
		}

		[Bindable]
		public function set workOrderInfoData(value:ArrayCollection):void
		{
			_workOrderInfoData = value;
		}

		public function get pickOffMedalChar():ArrayCollection
		{
			return _pickOffMedalChar;
		}

		public function set pickOffMedalChar(value:ArrayCollection):void
		{
			_pickOffMedalChar = value;
		}

		public function get pickOffMedalInfo():ArrayCollection
		{
			return _pickOffMedalInfo;
		}

		[Bindable]
		public function set pickOffMedalInfo(value:ArrayCollection):void
		{
			_pickOffMedalInfo = value;
		}


	}
}