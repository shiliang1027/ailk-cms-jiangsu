package com.linkage.module.cms.gsscene.view.components.sheetstat
{
    import mx.collections.ArrayCollection;

    public class SheetStatDM
    {
        private var _sheetListCity:ArrayCollection = new ArrayCollection([{"cityname": "南京", "sheetnum": "102"},
                                                                          {"cityname": "苏州", "sheetnum": "87"},
                                                                          {"cityname": "无锡", "sheetnum": "66"},
                                                                          {"cityname": "常州", "sheetnum": "48"},
                                                                          {"cityname": "镇江", "sheetnum": "56"},
                                                                          {"cityname": "扬州", "sheetnum": "78"},
                                                                          {"cityname": "南通", "sheetnum": "90"},
                                                                          {"cityname": "泰州", "sheetnum": "45"},
                                                                          {"cityname": "徐州", "sheetnum": "39"},
                                                                          {"cityname": "淮安", "sheetnum": "55"},
                                                                          {"cityname": "盐城", "sheetnum": "71"},
                                                                          {"cityname": "连云港", "sheetnum": "69"},
                                                                          {"cityname": "宿迁", "sheetnum": "65"}]);
        private var _sheetListMotype:ArrayCollection = new ArrayCollection;
        private var _sheetAlarmsList:Object = new Object;
		
		private var _cityName:String;//统计的地市名称

		public function get cityName():String
		{
			return _cityName;
		}

		public function set cityName(value:String):void
		{
			_cityName = value;
		}

        [Bindable]
        public function get sheetListCity():ArrayCollection
        {
            return _sheetListCity;
        }

        public function set sheetListCity(value:ArrayCollection):void
        {
            _sheetListCity = value;
        }

        [Bindable]
        public function get sheetListMotype():ArrayCollection
        {
            return _sheetListMotype;
        }

        public function set sheetListMotype(value:ArrayCollection):void
        {
            _sheetListMotype = value;
        }

        [Bindable]
        public function get sheetAlarmsList():Object
        {
            return _sheetAlarmsList;
        }

        public function set sheetAlarmsList(value:Object):void
        {
            _sheetAlarmsList = value;
        }


    }
}
