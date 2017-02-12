package com.linkage.module.cms.scene.domain
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import mx.collections.ArrayCollection;

	public class SceneIntroDM
	{
		private var _sceneImgUrl:String = '';

		private var _activities:ArrayCollection = new ArrayCollection();
		private var _kpiData:Object = {};
		//private var _sceneIntroStr:String = '';
		private var _sceneIntroStr:String = 'yayayayayayayayayayay';

		private var _sceneInfo:String = '';

		private var _sportMeetTodayArr:ArrayCollection = new ArrayCollection;
		private var _areaNums:int = 0;
		private var _areaBadNums:int = 0;
		private var _moBadNums:int = 0;
		private var _areaBadList:ArrayCollection = new ArrayCollection;
		private var _moBadList:ArrayCollection = new ArrayCollection;

		[Bindable]
		public var sceneDetail:String="";

		public function get sceneImgUrl():String
		{
			return _sceneImgUrl;
		}

		[Bindable]
		public function set sceneImgUrl(value:String):void
		{
			_sceneImgUrl = value;
		}

		public function get activities():ArrayCollection
		{
			return _activities;
		}

		[Bindable]
		public function set activities(value:ArrayCollection):void
		{
			_activities = value;
		}

		public function get sceneInfo():String
		{
			return _sceneInfo;
		}

		[Bindable]
		public function set sceneInfo(value:String):void
		{
			_sceneInfo = value;
		}

		public function get sportMeetTodayArr():ArrayCollection
		{
			return _sportMeetTodayArr;
		}

		[Bindable]
		public function set sportMeetTodayArr(value:ArrayCollection):void
		{
			_sportMeetTodayArr = value;
		}

		[Bindable]
		public function get kpiData():Object
		{
			return _kpiData;
		}

		public function set kpiData(value:Object):void
		{
			_kpiData = value;
		}

		public function get areaNums():int
		{
			return _areaNums;
		}

		[Bindable]
		public function set areaNums(value:int):void
		{
			_areaNums = value;
		}

		public function get areaBadNums():int
		{
			return _areaBadNums;
		}

		[Bindable]
		public function set areaBadNums(value:int):void
		{
			_areaBadNums = value;
		}

		public function get moBadNums():int
		{
			return _moBadNums;
		}

		[Bindable]
		public function set moBadNums(value:int):void
		{
			_moBadNums = value;
		}

		public function get areaBadList():ArrayCollection
		{
			return _areaBadList;
		}

		[Bindable]
		public function set areaBadList(value:ArrayCollection):void
		{
			_areaBadList = value;
		}

		public function get moBadList():ArrayCollection
		{
			return _moBadList;
		}

		[Bindable]
		public function set moBadList(value:ArrayCollection):void
		{
			_moBadList = value;
		}
		public function get sceneIntroStr():String
		{
			return _sceneIntroStr;
		}
		public function set sceneIntroStr(value:String):void
		{
			_sceneIntroStr = value;
		}
	}
}