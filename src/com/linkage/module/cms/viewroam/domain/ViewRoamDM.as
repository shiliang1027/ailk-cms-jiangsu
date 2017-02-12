package com.linkage.module.cms.viewroam.domain
{
	import mx.collections.ArrayCollection;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-11-03
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ViewRoamDM
	{
		public var parameters:Object = new Object();
		private var _selectIndex:int = 2;
		private var _viewRoamData:ArrayCollection=new ArrayCollection();//表格数据
		private var _viewRoamConfigData:ArrayCollection = new ArrayCollection();//表头
		private var _viewRoamCharData:ArrayCollection = new ArrayCollection();//图表数据
		private var _leftMenuData:ArrayCollection = new ArrayCollection();//左侧菜单
		
		[Bindable]
		public function get selectIndex():int
		{
			return _selectIndex;
		}

		public function set selectIndex(value:int):void
		{
			_selectIndex = value;
		}

		[Bindable]
		public function get viewRoamData():ArrayCollection
		{
			return _viewRoamData;
		}

		public function set viewRoamData(value:ArrayCollection):void
		{
			_viewRoamData = value;
		}

		[Bindable]
		public function get viewRoamConfigData():ArrayCollection
		{
			return _viewRoamConfigData;
		}

		public function set viewRoamConfigData(value:ArrayCollection):void
		{
			_viewRoamConfigData = value;
		}

		[Bindable]
		public function get viewRoamCharData():ArrayCollection
		{
			return _viewRoamCharData;
		}

		public function set viewRoamCharData(value:ArrayCollection):void
		{
			_viewRoamCharData = value;
		}

		[Bindable]
		public function get leftMenuData():ArrayCollection
		{
			return _leftMenuData;
		}

		public function set leftMenuData(value:ArrayCollection):void
		{
			_leftMenuData = value;
		}


	}
}