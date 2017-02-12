package com.linkage.module.cms.scene.domain
{
	import mx.collections.ArrayCollection;

	/**
	 * 指标概况数据模型
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KPISituationDM
	{
		//topN下拉列表
		private var _topNList:ArrayCollection = new ArrayCollection;
		//topN数据
		private var _topNData:ArrayCollection = new ArrayCollection;
		//kpi指标概况图表信息
		private var _kpiCharData:ArrayCollection = new ArrayCollection;

//		private var _busKPI:ArrayCollection = new ArrayCollection;
//		private var _driKPI:ArrayCollection = new ArrayCollection;
//		private var _custKPI:ArrayCollection = new ArrayCollection;
		private var _situationJWinfo:Object = new Object;
		private var _kpiSituationArr:ArrayCollection = new ArrayCollection;

		//topn劣化矩阵数据
		private var _badTopnMatrixList:ArrayCollection = new ArrayCollection();

		private var _topNum:String; //topn的n

		private var _topTempNum:String; //临时使用

		public var MAX_TOPNUM:String; //max_topn的n
		//重点指标未选择配置列表
		private var _kpiConfigNoSelectList:ArrayCollection = new ArrayCollection();
		//重点指标已选择配置列表
		private var _kpiConfigIsSelectList:ArrayCollection = new ArrayCollection();
		//指标配置保存返回结果
		private var _kpiConfigSaveResult:String;
		//阈值查询返回结果
		private var _queryThresholdList:ArrayCollection = new ArrayCollection();
		//查询场景列表
		private var _shareSceneList:ArrayCollection = new ArrayCollection();

		public var loadTopNDataEvent=null;


		public function get topNList():ArrayCollection
		{
			return _topNList;
		}

		[Bindable]
		public function set topNList(value:ArrayCollection):void
		{
			_topNList = value;
		}

		public function get topNData():ArrayCollection
		{
			return _topNData;
		}

		public function set topNData(value:ArrayCollection):void
		{
			_topNData = value;
		}

//		public function get busKPI():ArrayCollection
//		{
//			return _busKPI;
//		}
//
//		[Bindable]
//		public function set busKPI(value:ArrayCollection):void
//		{
//			_busKPI = value;
//		}
//
//		public function get driKPI():ArrayCollection
//		{
//			return _driKPI;
//		}
//
//		[Bindable]
//		public function set driKPI(value:ArrayCollection):void
//		{
//			_driKPI = value;
//		}
//
//		public function get custKPI():ArrayCollection
//		{
//			return _custKPI;
//		}
//
//		[Bindable]
//		public function set custKPI(value:ArrayCollection):void
//		{
//			_custKPI = value;
//		}

		public function get kpiCharData():ArrayCollection
		{
			return _kpiCharData;
		}

		public function set kpiCharData(value:ArrayCollection):void
		{
			_kpiCharData = value;
		}

		public function get situationJWinfo():Object
		{
			return _situationJWinfo;
		}

		public function set situationJWinfo(value:Object):void
		{
			_situationJWinfo = value;
		}

		public function get badTopnMatrixList():ArrayCollection
		{
			return _badTopnMatrixList;
		}

		public function set badTopnMatrixList(value:ArrayCollection):void
		{
			_badTopnMatrixList = value;
		}

		public function get kpiSituationArr():ArrayCollection
		{
			return _kpiSituationArr;
		}

		[Bindable]
		public function set kpiSituationArr(value:ArrayCollection):void
		{
			_kpiSituationArr = value;
		}

		public function get topNum():String
		{
			return _topNum;
		}

		[Bindable]
		public function set topNum(value:String):void
		{
			_topNum = value;
		}

		public function get topTempNum():String
		{
			return _topTempNum;
		}

		public function set topTempNum(value:String):void
		{
			_topTempNum = value;
		}

		public function get kpiConfigNoSelectList():ArrayCollection
		{
			return _kpiConfigNoSelectList;
		}

		[Bindable]
		public function set kpiConfigNoSelectList(value:ArrayCollection):void
		{
			_kpiConfigNoSelectList = value;
		}

		public function get kpiConfigIsSelectList():ArrayCollection
		{
			return _kpiConfigIsSelectList;
		}

		[Bindable]
		public function set kpiConfigIsSelectList(value:ArrayCollection):void
		{
			_kpiConfigIsSelectList = value;
		}

		public function get kpiConfigSaveResult():String
		{
			return _kpiConfigSaveResult;
		}

		public function set kpiConfigSaveResult(value:String):void
		{
			_kpiConfigSaveResult = value;
		}

		public function get queryThresholdList():ArrayCollection
		{
			return _queryThresholdList;
		}

		public function set queryThresholdList(value:ArrayCollection):void
		{
			_queryThresholdList = value;
		}

		public function get shareSceneList():ArrayCollection
		{
			return _shareSceneList;
		}

		[Bindable]
		public function set shareSceneList(value:ArrayCollection):void
		{
			_shareSceneList = value;
		}



	}
}