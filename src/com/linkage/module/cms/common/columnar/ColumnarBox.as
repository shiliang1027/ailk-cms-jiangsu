package com.linkage.module.cms.common.columnar
{

	public class ColumnarBox
	{
		private var _columnarArr:Array = new Array();

		/**
		 *添加元素到数组
		 * @param columnarNode
		 *
		 */
		public function add(obj:Object):void
		{
			_columnarArr.push(obj);
		}

		/**
		 *通过ID获取对象
		 * @param id
		 * @return
		 *
		 */
		public function getElementById(id:String):Object
		{
			for each (var data:Object in _columnarArr)
			{
				if (data.id == id)
				{
					return data;
				}
			}
			return null;
		}

		/**
		 *元素数组
		 */
		public function get columnarArr():Array
		{
			return _columnarArr;
		}

		/**
		 * @private
		 */
		public function set columnarArr(value:Array):void
		{
			_columnarArr = value;
		}
	}
}