package com.linkage.module.cms.scene.domain
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-11-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class NeRoomDM
	{
		private var _dataList:ArrayCollection=new ArrayCollection();

		[Bindable]
		public function get dataList():ArrayCollection
		{
			return _dataList;
		}

		public function set dataList(value:ArrayCollection):void
		{
			_dataList=value;
		}

	}
}