package com.linkage.module.cms.scenedaily.domain.hangandpick
{
	import mx.collections.ArrayCollection;

	/**
	 *挂牌列表dm
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-11-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangPlateListDM
	{

		private var _hangPlateList:ArrayCollection = new ArrayCollection(); //挂牌列表

		public function get hangPlateList():ArrayCollection
		{
			return _hangPlateList;
		}

		[Bindable]
		public function set hangPlateList(value:ArrayCollection):void
		{
			_hangPlateList = value;
		}

	}
}