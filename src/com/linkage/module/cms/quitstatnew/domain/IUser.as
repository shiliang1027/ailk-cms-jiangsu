package com.linkage.module.cms.quitstatnew.domain
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

		/**
		 * 查询类型 1：实时查询  2:24小时查询
		 * */
		function get searchType():String;
		function set searchType(value:String):void;

	}
}