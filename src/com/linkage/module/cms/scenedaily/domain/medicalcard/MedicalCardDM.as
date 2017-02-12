package com.linkage.module.cms.scenedaily.domain.medicalcard
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MedicalCardDM
	{
		private var _title:String = "";

		//基础信息数据集
		private var _baseDataMap:Object=new Object();

		//指教劣化记录数据集
		private var _badDataList:ArrayCollection=new ArrayCollection();

		//近期工程记录数据集
		private var _projectDataList:ArrayCollection=new ArrayCollection();

		//近期告警记录数据集
		private var _alarmDataList:ArrayCollection=new ArrayCollection();




		[Bindable]
		public function get baseDataMap():Object
		{
			return _baseDataMap;
		}

		public function set baseDataMap(value:Object):void
		{
			_baseDataMap=value;
		}

		[Bindable]
		public function get badDataList():ArrayCollection
		{
			return _badDataList;
		}

		public function set badDataList(value:ArrayCollection):void
		{
			_badDataList=value;
		}

		[Bindable]
		public function get projectDataList():ArrayCollection
		{
			return _projectDataList;
		}

		public function set projectDataList(value:ArrayCollection):void
		{
			_projectDataList=value;
		}

		[Bindable]
		public function get alarmDataList():ArrayCollection
		{
			return _alarmDataList;
		}

		public function set alarmDataList(value:ArrayCollection):void
		{
			_alarmDataList=value;
		}

		[Bindable]
		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title=value;
		}


	}
}

