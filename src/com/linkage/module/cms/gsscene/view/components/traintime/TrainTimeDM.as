package com.linkage.module.cms.gsscene.view.components.traintime
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

	 */

	import mx.collections.ArrayCollection;

	public class TrainTimeDM
	{
		private var _TTdataList:ArrayCollection = new ArrayCollection(); //火车时间列表

		public function get TTdataList():ArrayCollection
		{
			return _TTdataList;
		}

		[Bindable]
		public function set TTdataList(value:ArrayCollection):void
		{
			_TTdataList = value;
		}
	}
}