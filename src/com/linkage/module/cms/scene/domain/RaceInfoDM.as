package com.linkage.module.cms.scene.domain
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-24
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RaceInfoDM
	{
		/**
		 * 赛事详情列表数据
		 * */
		private var _raceInfoList:ArrayCollection = new ArrayCollection();

		public function get raceInfoList():ArrayCollection
		{
			return _raceInfoList;
		}

		[Bindable]
		public function set raceInfoList(value:ArrayCollection):void
		{
			_raceInfoList = value;
		}

	}
}