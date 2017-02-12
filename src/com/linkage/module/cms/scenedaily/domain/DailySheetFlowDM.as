package com.linkage.module.cms.scenedaily.domain
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DailySheetFlowDM
	{
		private var _sheetFlowData:Object = new Object();

		public function get sheetFlowData():Object
		{
			return _sheetFlowData;
		}

		public function set sheetFlowData(value:Object):void
		{
			_sheetFlowData = value;
		}

	}
}

