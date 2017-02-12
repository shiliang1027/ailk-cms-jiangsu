package com.linkage.module.cms.scene.domain
{
	
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	

	/**
	 * 
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneTreeDM
	{
		private var log:ILogger = Log.getLoggerByClass(SceneTreeDM);
		
		private var _treeData:XML = new XML(); 
		
		public function get treeData():XML
		{
			return _treeData;
		}
		
		[Bindable]
		public function set treeData(value:XML):void
		{
			_treeData = value;
		}

	}
}