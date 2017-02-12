package com.linkage.module.cms.scenedaily.event.impkpi
{
	import flash.events.Event;

	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ImpProKpiEvent extends Event
	{
		//展示重点性能指标概览数据
		public static const GET_IMP_PRO_KPI_DATA:String = "GET_IMP_PRO_KPI_DATA";
		//展示重点性能指标概览数据
		public static const SHOW_IMP_PRO_KPI_DATA:String = "SHOW_IMP_PRO_KPI_DATA";
		//展示重点性能指标未选择指标数据
		public static const GET_IMP_PRO_KPI_NOT_SELECT_DATA:String = "GET_IMP_PRO_KPI_NOT_SELECT_DATA";
		//展示重点性能指标已选择指标数据
		public static const GET_IMP_PRO_KPI_IS_SELECT_DATA:String = "GET_IMP_PRO_KPI_IS_SELECT_DATA";
		//增加性能指标设置
		public static const ADD_IMP_PRO_KPI_DATA:String = "ADD_IMP_PRO_KPI_DATA";
		//重新加载指标概览数据
		public static const RELOAD_IMP_PRO_KPI_DATA:String = "RELOAD_IMP_PRO_KPI_DATA";

		private var _noSelectDataList:ArrayCollection = new ArrayCollection();

		private var _isSelectDataList:ArrayCollection = new ArrayCollection();
		private var _status:int;
		//当前页索引
		private var _indexPage:int;
		//每页显示条数
		private var _perPageCount:int;

		private var _perfName:String;

		public function ImpProKpiEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function get noSelectDataList():ArrayCollection
		{
			return _noSelectDataList;
		}

		public function set noSelectDataList(value:ArrayCollection):void
		{
			_noSelectDataList = value;
		}

		public function get isSelectDataList():ArrayCollection
		{
			return _isSelectDataList;
		}

		public function set isSelectDataList(value:ArrayCollection):void
		{
			_isSelectDataList = value;
		}

		public function get status():int
		{
			return _status;
		}

		public function set status(value:int):void
		{
			_status = value;
		}

		public function get indexPage():int
		{
			return _indexPage;
		}

		public function set indexPage(value:int):void
		{
			_indexPage = value;
		}

		public function get perPageCount():int
		{
			return _perPageCount;
		}

		public function set perPageCount(value:int):void
		{
			_perPageCount = value;
		}

		public function get perfName():String
		{
			return _perfName;
		}

		public function set perfName(value:String):void
		{
			_perfName = value;
		}


	}
}

