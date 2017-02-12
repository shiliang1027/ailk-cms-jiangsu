package com.linkage.module.cms.groupclientalarm.map
{
	import spark.components.SkinnableContainer;

	/**
	 * 元素对象
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2010-11-25 上午11:06:10
	 * @category com.linkage.map.core
	 * @copyright 南京联创科技 网管开发部
	 */
	public class Element extends SkinnableContainer
	{
		/**
		 *元素属性数组
		 */
		private var _property:Array = new Array();

		public function Element()
		{
		}

		public function addProperty(key:String, value:*):void
		{
			_property[key] = value;
		}

		public function getProperty(key:String):*
		{
			return _property[key];
		}

		public function get property():Array
		{
			return _property;
		}

		public function set property(value:Array):void
		{
			_property = value;
		}
	}
}