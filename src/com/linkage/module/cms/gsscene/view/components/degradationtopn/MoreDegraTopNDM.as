package com.linkage.module.cms.gsscene.view.components.degradationtopn
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-2
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MoreDegraTopNDM
	{


		private var _topnCharts:ArrayCollection = new ArrayCollection();


		private var _colNum:Number;
		
		private var _unrenders:ArrayCollection = new ArrayCollection();
		
		private var _renders:ArrayCollection = new ArrayCollection();

		/**
		 * topn的chart数据集
		 * */
		[Bindable]
		public function get topnCharts():ArrayCollection
		{
			return _topnCharts;
		}

		public function set topnCharts(value:ArrayCollection):void
		{
			_topnCharts = value;
		}

		/**
		 * 一行放入多少列的chart
		 * */
		[Bindable]
		public function get colNum():Number
		{
			return _colNum;
		}

		/**
		 * @private
		 */
		public function set colNum(value:Number):void
		{
			_colNum = value;
		}

		[Bindable]
		/**
		 * 未选中指标
		 * */
		public function get unrenders():ArrayCollection
		{
			return _unrenders;
		}

		/**
		 * @private
		 */
		public function set unrenders(value:ArrayCollection):void
		{
			_unrenders = value;
		}

		[Bindable]
		/**
		 * 已选中指标
		 * */
		public function get renders():ArrayCollection
		{
			return _renders;
		}

		/**
		 * @private
		 */
		public function set renders(value:ArrayCollection):void
		{
			_renders = value;
		}


	}
}