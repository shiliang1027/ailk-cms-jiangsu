package com.linkage.module.cms.groupmonitor.custscene.domain.common
{

	public interface IUser
	{
		/**
		 * 用户帐号
		 */
		function set user(value:Object):void;
		function get user():Object;

		function set account(value:String):void;
		function get account():String;

		function get context():String;
		function set context(value:String):void;
	}
}

