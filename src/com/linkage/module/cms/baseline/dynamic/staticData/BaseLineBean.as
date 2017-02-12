package com.linkage.module.cms.baseline.dynamic.staticData
{
	public class BaseLineBean
	{
		public function BaseLineBean()
		{
		}
		public static var perfTypeId:String;
		public static var perfTypeName:String;
		public static var moTypeId:String;
		public static var moTypeName:String;
		public static var baselineId:String;
		public static var perfTable:String;//指标表名
		public static var perfTableTime:String;//指标表时间后缀
		public static var columnName:String;//指标表的 字段名
		public static var unit:String;//指标单位
		public static var evaltype:String;//基线算法类型
		public static var isActive:String;//是否启用
		/**
		 * 查询参数
		 **/
		public static var KPIParams:Object={};
		
		
		public static function getParams():Object{
			var params:Object = new Object();
			params.perfTypeId = BaseLineBean.perfTypeId;
			params.perfTypeName=BaseLineBean.perfTypeName;
			params.moTypeId=BaseLineBean.moTypeId;
			params.moTypeName=BaseLineBean.moTypeName;
			params.baselineId=BaseLineBean.baselineId;
			params.perfTable=BaseLineBean.perfTable;
			params.perfTableTime=BaseLineBean.perfTableTime;
			params.columnName=BaseLineBean.columnName;
			params.unit=BaseLineBean.unit;
			params.evaltype=BaseLineBean.evaltype;
			params.isActive=BaseLineBean.isActive;
			return params;
		}
		
		/**
		 *设置参数 
		 **/
		public static function setParams(params:Object):void
		{
			BaseLineBean.perfTypeId=params.perfTypeId;
			BaseLineBean.perfTypeName=params.perfTypeName;
			BaseLineBean.moTypeId=params.moTypeId;
			BaseLineBean.moTypeName=params.moTypeId;
			BaseLineBean.baselineId=params.baselineId;
			BaseLineBean.perfTable=params.perfTable;
			BaseLineBean.perfTableTime=params.perfTableTime;
			BaseLineBean.columnName=params.columnName;
			BaseLineBean.unit=params.unit;
			BaseLineBean.evaltype=params.evaltype;
			BaseLineBean.isActive=params.isActive;
			BaseLineBean.KPIParams = params;
		}
	}
}