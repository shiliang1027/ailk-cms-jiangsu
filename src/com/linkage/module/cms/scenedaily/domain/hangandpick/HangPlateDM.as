package com.linkage.module.cms.scenedaily.domain.hangandpick
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangPlateDM
	{

		//挂牌信息
		private var _hangPlates:ArrayCollection = new ArrayCollection();

		public function get hangPlates():ArrayCollection
		{
			return _hangPlates;
		}

		[Bindable]
		public function set hangPlates(value:ArrayCollection):void
		{
			_hangPlates = value;
		}

	}
}