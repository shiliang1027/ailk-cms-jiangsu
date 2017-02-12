package com.linkage.module.cms.oneline.domain.wireless
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

	}
}