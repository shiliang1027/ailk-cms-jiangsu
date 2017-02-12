package com.linkage.module.cms.scenedaily.event.healthreport
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HealthReportSetEvent extends Event
	{
		//获取健康报告分类树
		public static const GET_HEALTH_REPORT_TREE:String = "GET_HEALTH_REPORT_TREE";
		//加载健康报告分类树
		public static const SHOW_HEALTH_REPORT_TREE:String = "SHOW_HEALTH_REPORT_TREE";
		//展示健康指标设置信息
		public static const GET_HEALTH_REPORT_KPI_INFO:String = "GET_HEALTH_REPORT_KPI_INFO";
		//保存健康指标 设置信息
		public static const SAVE_HEALTH_REPORT_KPI_INFO:String = "SAVE_HEALTH_REPORT_KPI_INFO";
		//返回结果提示信息
		public static const RETURN_HEALTH_REPORT_KPI_INFO:String = "RETURN_HEALTH_REPORT_KPI_INFO";
		//树节点ID
		private var _treeNodeId:String;
		//指标分类Id
		private var _kpiTypeId:String;
		//保存健康指标信息
		private var _saveHealthObj:Object;
		//返回字符串
		private var _returnInfo:String;

		public function HealthReportSetEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function get treeNodeId():String
		{
			return _treeNodeId;
		}

		public function set treeNodeId(value:String):void
		{
			_treeNodeId = value;
		}

		public function get kpiTypeId():String
		{
			return _kpiTypeId;
		}

		public function set kpiTypeId(value:String):void
		{
			_kpiTypeId = value;
		}

		public function get saveHealthObj():Object
		{
			return _saveHealthObj;
		}

		public function set saveHealthObj(value:Object):void
		{
			_saveHealthObj = value;
		}

		public function get returnInfo():String
		{
			return _returnInfo;
		}

		public function set returnInfo(value:String):void
		{
			_returnInfo = value;
		}


	}
}