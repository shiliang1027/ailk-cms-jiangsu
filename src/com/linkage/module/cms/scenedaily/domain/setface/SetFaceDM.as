package com.linkage.module.cms.scenedaily.domain.setface
{

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-3
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SetFaceDM
	{
		//基本设置
		private var _baseSetMap:Object=new Object();

		//健康算法设置
		private var _healthSetMap:Object=new Object();

		[Bindable]
		public function get baseSetMap():Object
		{
			return _baseSetMap;
		}

		public function set baseSetMap(value:Object):void
		{
			_baseSetMap=value;
		}

		[Bindable]
		public function get healthSetMap():Object
		{
			return _healthSetMap;
		}

		public function set healthSetMap(value:Object):void
		{
			_healthSetMap=value;
		}


	}
}