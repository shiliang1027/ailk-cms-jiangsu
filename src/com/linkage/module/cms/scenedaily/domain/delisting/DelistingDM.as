package com.linkage.module.cms.scenedaily.domain.delisting
{
	import mx.collections.ArrayCollection;

	/**
	 * 
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DelistingDM
	{
		//摘牌列表数据
		private var _delistingMoList:ArrayCollection = new ArrayCollection();

		[Bindable]
		public function get delistingMoList():ArrayCollection
		{
			return _delistingMoList;
		}

		public function set delistingMoList(value:ArrayCollection):void
		{
			_delistingMoList = value;
		}

	}
}