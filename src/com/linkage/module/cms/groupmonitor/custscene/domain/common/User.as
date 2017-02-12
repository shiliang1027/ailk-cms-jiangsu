package com.linkage.module.cms.groupmonitor.custscene.domain.common
{

	public class User implements IUser
	{
		//用户帐号
		private var _user:Object;

		private var _account:String;
		private var _context:String;

		public function get user():Object
		{
			return _user;
		}

		public function set user(value:Object):void
		{
			_user=value;
		}

		public function get account():String
		{
			return _account;
		}

		public function set account(value:String):void
		{
			_account=value;
		}

		public function get context():String
		{
			return _context;
		}

		public function set context(value:String):void
		{
			_context=value;
		}


	}
}

