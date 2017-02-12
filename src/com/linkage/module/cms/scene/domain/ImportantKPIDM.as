package com.linkage.module.cms.scene.domain
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ImportantKPIDM
	{
		private var log:ILogger = Log.getLoggerByClass(ImportantKPIDM);

		private var _resultData:ArrayCollection = new ArrayCollection();

		private var _kpiList:ArrayCollection = new ArrayCollection();

		private var _kpiNameDataMap:Object;

		public function get resultData():ArrayCollection
		{
			return _resultData;
		}

		public function set resultData(value:ArrayCollection):void
		{
			_resultData = value;
		}

		public function get kpiList():ArrayCollection
		{
			return _kpiList;
		}

		[Bindable]
		public function set kpiList(value:ArrayCollection):void
		{
			_kpiList = value;
		}

		public function get kpiNameDataMap():Object
		{
			return _kpiNameDataMap;
		}

		public function set kpiNameDataMap(value:Object):void
		{
			_kpiNameDataMap = value;
		}


	}
}