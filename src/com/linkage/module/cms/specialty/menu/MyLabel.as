package com.linkage.module.cms.specialty.menu
{
	import spark.components.Label;
	
	public class MyLabel extends Label
	{
		public function MyLabel()
		{
			
		}
		
		private var _moId:String = null;
		private var _moName:String = null;

		public function get moName():String
		{
			return _moName;
		}

		public function set moName(value:String):void
		{
			_moName = value;
		}

		public function get moId():String
		{
			return _moId;
		}

		public function set moId(value:String):void
		{
			_moId = value;
		}

	}
}