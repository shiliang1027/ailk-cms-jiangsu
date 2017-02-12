package com.linkage.module.cms.scene.domain
{
	/**
	 * 
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-8-1
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneResumeDM
	{
		
		private var _data:Object = new Object();
		
		//场景名称
		private var _sceneName:String;
		
		
		
		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

		public function get sceneName():String
		{
			return _sceneName;
		}

		[Bindable]
		public function set sceneName(value:String):void
		{
			_sceneName = value;
		}


	}
}