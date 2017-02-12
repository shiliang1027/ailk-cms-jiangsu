package com.linkage.module.cms.scenedaily.domain.kqikpipi
{
	import mx.collections.ArrayCollection;

	public class KQIKPIPIDM
	{
		private var _xmlData:XML;

		private var _moList:ArrayCollection = new ArrayCollection;

		private var _colorMap:Object;

		public function get xmlData():XML
		{
			return _xmlData;
		}

		[Bindable]
		public function set xmlData(value:XML):void
		{
			_xmlData = value;
		}

		public function get moList():ArrayCollection
		{
			return _moList;
		}

		[Bindable]
		public function set moList(value:ArrayCollection):void
		{
			_moList = value;
		}

		public function get colorMap():Object
		{
			return _colorMap;
		}

		public function set colorMap(value:Object):void
		{
			_colorMap = value;
		}


	}
}

