package com.linkage.module.cms.scene.domain
{

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MapVectorDM
	{
		private var _dyeMap:Object = new Object; //渲染数据，key是地市id value 是map对应相应的color和数字

		public function get dyeMap():Object
		{
			return _dyeMap;
		}

		public function set dyeMap(value:Object):void
		{
			_dyeMap = value;
		}

	}
}