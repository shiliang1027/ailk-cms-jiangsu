package com.linkage.module.cms.gsscene.view.components.scenetree
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
		
		private var _treeData:XML = new XML(); //原场景树图
		
		private var _adminTreeData:XML = new XML(); //新树图-行政区域
		
		private var _specialTreeData:XML = new XML(); //新树图-特定区域
		
		public function get specialTreeData():XML
		{
			return _specialTreeData;
		}
		[Bindable]
		public function set specialTreeData(value:XML):void
		{
			_specialTreeData = value;
		}
		public function get adminTreeData():XML
		{
			return _adminTreeData;
		}
		[Bindable]
		public function set adminTreeData(value:XML):void
		{
			_adminTreeData = value;
		}
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