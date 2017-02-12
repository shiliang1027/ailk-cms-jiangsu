package com.linkage.module.cms.scene.domain
{
	import mx.collections.ArrayCollection;

	/**
	 * 应急资源数据模型
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-1
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class EmgyResourceDM
	{
		private var _emgyResourceTotal:ArrayCollection;
		private var _emgyResourceDetail:ArrayCollection = new ArrayCollection;

		public function get emgyResourceTotal():ArrayCollection
		{
			return _emgyResourceTotal;
		}

		[Bindable]
		public function set emgyResourceTotal(value:ArrayCollection):void
		{
			_emgyResourceTotal = value;
		}

		public function get emgyResourceDetail():ArrayCollection
		{
			return _emgyResourceDetail;
		}

		[Bindable]
		public function set emgyResourceDetail(value:ArrayCollection):void
		{
			_emgyResourceDetail = value;
		}

	}
}