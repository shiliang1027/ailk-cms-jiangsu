package com.linkage.module.cms.groupclient.map
{

	/**
	 * 放元素的BOX
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2010-11-24 下午07:02:35
	 * @category com.linkage.map.core
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ElementBox
	{
		/**
		 *元素数组
		 */
		private var _elements:Array = new Array();
		/**
		 *画布
		 */
		private var _mw:MapWork;

		public function ElementBox(mw:MapWork)
		{
			_mw = mw;
		}

		public function get elements():Array
		{
			return _elements;
		}

		public function set elements(value:Array):void
		{
			_elements = value;
		}

		public function add(data:IData):void
		{
			_elements.push(data);
			if (data is MapNode)
			{
				var mapNode:MapNode = data as MapNode;
				_mw.addElement(mapNode);
			}
			else if (data is MapLabel)
			{
				var mapLabel:MapLabel = data as MapLabel;
				_mw.addElement(mapLabel);
			}
		}

		public function getElementById(id:String):IData
		{
			for each (var data:IData in _elements)
			{
				if (data.id == id)
				{
					return data;
				}
			}
			return null;
		}
	}
}