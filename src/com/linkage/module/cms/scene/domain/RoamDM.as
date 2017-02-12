package com.linkage.module.cms.scene.domain
{

	import mx.collections.ArrayCollection;

	/**
	 *漫游图表数据模型
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RoamDM
	{
		//漫游数据结果集
		private var _roamResultData:Object;
		//漫游数据arrray
		private var _roamArray:ArrayCollection = new ArrayCollection();

		public function get roamResultData():Object
		{
			return _roamResultData;
		}

		public function set roamResultData(value:Object):void
		{
			_roamResultData = value;
		}

		public function get roamArray():ArrayCollection
		{
			return _roamArray;
		}

		public function set roamArray(value:ArrayCollection):void
		{
			_roamArray = value;
		}


	}
}