package com.linkage.module.cms.scenedaily.domain.leaderattention
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-8-28
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LeaderAttentionPanelDM
	{
		private var log:ILogger = Log.getLoggerByClass(LeaderAttentionPanelDM);
		//表中信息
		private var _importantIndexList:ArrayCollection = new ArrayCollection();
		private var _enUnhealthyList:ArrayCollection = new ArrayCollection();
		private var _enSubhealthyList:ArrayCollection = new ArrayCollection();
		private var _leaderDetailData:ArrayCollection = new ArrayCollection();
		private var _importantIndexCount:String;
		private var _enUnhealthyCount:String;
		private var _enSubhealthyCount:String;

		private var totalRowCount:String; //总条数

		public function get importantIndexList():ArrayCollection
		{
			return _importantIndexList;
		}

		[Bindable]
		public function set importantIndexList(value:ArrayCollection):void
		{
			_importantIndexList = value;
		}

		public function get enUnhealthyList():ArrayCollection
		{
			return _enUnhealthyList;
		}

		[Bindable]
		public function set enUnhealthyList(value:ArrayCollection):void
		{
			_enUnhealthyList = value;
		}

		public function get enSubhealthyList():ArrayCollection
		{
			return _enSubhealthyList;
		}

		[Bindable]
		public function set enSubhealthyList(value:ArrayCollection):void
		{
			_enSubhealthyList = value;
		}

		public function get importantIndexCount():String
		{
			return _importantIndexCount;
		}

		[Bindable]
		public function set importantIndexCount(value:String):void
		{
			_importantIndexCount = value;
		}

		public function get enUnhealthyCount():String
		{
			return _enUnhealthyCount;
		}

		[Bindable]
		public function set enUnhealthyCount(value:String):void
		{
			_enUnhealthyCount = value;
		}

		public function get enSubhealthyCount():String
		{
			return _enSubhealthyCount;
		}

		[Bindable]
		public function set enSubhealthyCount(value:String):void
		{
			_enSubhealthyCount = value;
		}

		public function get leaderDetailData():ArrayCollection
		{
			return _leaderDetailData;
		}

		[Bindable]
		public function set leaderDetailData(value:ArrayCollection):void
		{
			_leaderDetailData = value;
		}


	}
}

