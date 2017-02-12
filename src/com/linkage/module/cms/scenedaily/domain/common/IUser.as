package com.linkage.module.cms.scenedaily.domain.common
{

	public interface IUser
	{
		/**
		 * 用户帐号
		 */
		function set account(value:String):void;
		function get account():String;

		/**
		 * 用户域
		 */
		function set areaId(value:String):void;
		function get areaId():String;

		function get context():String;
		function set context(value:String):void;

		//当前的重点指标id
		function get kpiId():String;
		function set kpiId(value:String):void;

		function get kpiName():String;
		function set kpiName(value:String):void;

		//指标值
		function get kpiValue():String;
		function set kpiValue(value:String):void;

		//统计粒度type
		function get interval():String;
		function set interval(value:String):void;

		//网元类型Id
		function get moTypeId():String;
		function set moTypeId(value:String):void;

		//资源Id
		function get resId():String;
		function set resId(value:String):void;

		//0为健康度数据， 1为阈值劣化
		function get isHealthOrThreshold():String;
		function set isHealthOrThreshold(value:String):void;

		//资源类型 1:resId为省份Id 2:resId为地市Id3:resId为网元Id
		function get resType():String;
		function set resType(value:String):void;

		//视图层次(1:领导,2:管理,3:一线)
		function get viewType():String;
		function set viewType(value:String):void;

		//统计时间
		function get gatherTime():String;
		function set gatherTime(value:String):void;

		//城市id
		function get cityId():String;
		function set cityId(value:String):void;

		function get perfTypeId():String;
		function set perfTypeId(value:String):void;

		function get timeGranular():String;
		function set timeGranular(value:String):void;

		function get stateTime():String;
		function set stateTime(value:String):void;

		function get isLeaderPef():String;
		function set isLeaderPef(value:String):void;

		function get kpiCurrentSelectIndex():int;
		function set kpiCurrentSelectIndex(value:int):void;

		function get kpiCurrentPageIndex():int;
		function set kpiCurrentPageIndex(value:int):void;

		function get kpiClickPageIndex():int;
		function set kpiClickPageIndex(value:int):void;

		function get kpiClickSelectIndex():int;
		function set kpiClickSelectIndex(value:int):void;

		function get kpiMapClickFlag():Boolean;
		function set kpiMapClickFlag(value:Boolean):void;

		function get isHis():String;
		function set isHis(value:String):void;

		function get perfName():String;
		function set perfName(value:String):void;
	}
}

