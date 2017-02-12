package com.linkage.module.cms.oneline.domain.wireless
{

	public class User implements IUser
	{
		//用户帐号
		private var _account:String;

		//用户域
		private var _areaId:String;

		private var _context:String;


		public function set account(value:String):void
		{
			_account = value;
		}

		public function get account():String
		{
			return _account;
		}

		public function set areaId(value:String):void
		{
			_areaId = value;
		}

		public function get areaId():String
		{
			return _areaId;
		}

		public function get context():String
		{
			return _context;
		}

		public function set context(value:String):void
		{
			_context = value;
		}


	}
}