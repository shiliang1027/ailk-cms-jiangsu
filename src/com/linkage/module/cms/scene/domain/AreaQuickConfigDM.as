package com.linkage.module.cms.scene.domain
{
    import mx.collections.ArrayCollection;

    /**
     *
     *
     * @author 华伟 (69088)
     * @version 1.0
     * @date 2012-12-13
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class AreaQuickConfigDM
    {
        private var _impList:ArrayCollection = new ArrayCollection();
        private var _selList:ArrayCollection = new ArrayCollection();
        private var _url:String = "";
        private var _motreeData:XML = new XML;
        private var _queryConList:ArrayCollection = new ArrayCollection([{"field": "地点", "value": "0"}, {"field": "网元", "value": "1"}]);

        private var _supportCustomFeelKpiList:ArrayCollection = new ArrayCollection();
        private var _configedCustomFeelKpiList:ArrayCollection = new ArrayCollection();

        private var _supportBussPmKpiList:ArrayCollection = new ArrayCollection();
        private var _configedBussPmKpiList:ArrayCollection = new ArrayCollection();

        private var _supportDevPmKpiList:ArrayCollection = new ArrayCollection();
        private var _configedDevPmKpiList:ArrayCollection = new ArrayCollection();

        private var _emgunselList:ArrayCollection = new ArrayCollection();

        private var _emgselList:ArrayCollection = new ArrayCollection();

        private var _chooseList:ArrayCollection = new ArrayCollection();

        private var _sceneNameList:ArrayCollection = new ArrayCollection();

        private var _scenePanelList:ArrayCollection = new ArrayCollection();

        private var _countRow:Number = 0;

        private var _treeData:XML = new XML();

        private var _cityList:ArrayCollection = new ArrayCollection();

        private var _picUrl:String = "/cms/cms/images/hurong.jpg";

        private var _path:String = "/cms/cms/images/";

        private var _cityListArr:ArrayCollection = new ArrayCollection();

        private var _sceneTypeList:ArrayCollection = new ArrayCollection();

        private var _motypeList:ArrayCollection = new ArrayCollection();

        private var _moTypeMap:Object = new Object;

        [Bindable]
        public function get queryConList():ArrayCollection
        {
            return _queryConList;
        }

        public function set queryConList(value:ArrayCollection):void
        {
            _queryConList = value;
        }

        [Bindable]
        public function get supportCustomFeelKpiList():ArrayCollection
        {
            return _supportCustomFeelKpiList;
        }

        public function set supportCustomFeelKpiList(value:ArrayCollection):void
        {
            _supportCustomFeelKpiList = value;
        }

        [Bindable]
        public function get configedCustomFeelKpiList():ArrayCollection
        {
            return _configedCustomFeelKpiList;
        }

        public function set configedCustomFeelKpiList(value:ArrayCollection):void
        {
            _configedCustomFeelKpiList = value;
        }

        [Bindable]
        public function get supportBussPmKpiList():ArrayCollection
        {
            return _supportBussPmKpiList;
        }

        public function set supportBussPmKpiList(value:ArrayCollection):void
        {
            _supportBussPmKpiList = value;
        }

        [Bindable]
        public function get configedBussPmKpiList():ArrayCollection
        {
            return _configedBussPmKpiList;
        }

        public function set configedBussPmKpiList(value:ArrayCollection):void
        {
            _configedBussPmKpiList = value;
        }

        [Bindable]
        public function get supportDevPmKpiList():ArrayCollection
        {
            return _supportDevPmKpiList;
        }

        public function set supportDevPmKpiList(value:ArrayCollection):void
        {
            _supportDevPmKpiList = value;
        }

        [Bindable]
        public function get configedDevPmKpiList():ArrayCollection
        {
            return _configedDevPmKpiList;
        }

        public function set configedDevPmKpiList(value:ArrayCollection):void
        {
            _configedDevPmKpiList = value;
        }

        [Bindable]
        public function get emgunselList():ArrayCollection
        {
            return _emgunselList;
        }

        public function set emgunselList(value:ArrayCollection):void
        {
            _emgunselList = value;
        }

        [Bindable]
        public function get emgselList():ArrayCollection
        {
            return _emgselList;
        }

        public function set emgselList(value:ArrayCollection):void
        {
            _emgselList = value;
        }

        [Bindable]
        public function get chooseList():ArrayCollection
        {
            return _chooseList;
        }

        public function set chooseList(value:ArrayCollection):void
        {
            _chooseList = value;
        }

        [Bindable]
        public function get sceneNameList():ArrayCollection
        {
            return _sceneNameList;
        }

        public function set sceneNameList(value:ArrayCollection):void
        {
            _sceneNameList = value;
        }

        [Bindable]
        public function get scenePanelList():ArrayCollection
        {
            return _scenePanelList;
        }

        public function set scenePanelList(value:ArrayCollection):void
        {
            _scenePanelList = value;
        }

        [Bindable]
        public function get picUrl():String
        {
            return _picUrl;
        }

        public function set picUrl(value:String):void
        {
            _picUrl = value;
        }

        [Bindable]
        public function get treeData():XML
        {
            return _treeData;
        }

        public function set treeData(value:XML):void
        {
            _treeData = value;
        }

        [Bindable]
        public function get cityList():ArrayCollection
        {
            return _cityList;
        }

        public function set cityList(value:ArrayCollection):void
        {
            _cityList = value;
        }

        [Bindable]
        public function get path():String
        {
            return _path;
        }

        public function set path(value:String):void
        {
            _path = value;
        }

        [Bindable]
        public function get sceneTypeList():ArrayCollection
        {
            return _sceneTypeList;
        }

        public function set sceneTypeList(value:ArrayCollection):void
        {
            _sceneTypeList = value;
        }

        [Bindable]
        public function get countRow():Number
        {
            return _countRow;
        }

        public function set countRow(value:Number):void
        {
            _countRow = value;
        }

        [Bindable]
        public function get cityListArr():ArrayCollection
        {
            return _cityListArr;
        }

        public function set cityListArr(value:ArrayCollection):void
        {
            _cityListArr = value;
        }

        [Bindable]
        public function get motypeList():ArrayCollection
        {
            return _motypeList;
        }

        public function set motypeList(value:ArrayCollection):void
        {
            _motypeList = value;
        }

        [Bindable]
        public function get motreeData():XML
        {
            return _motreeData;
        }

        public function set motreeData(value:XML):void
        {
            _motreeData = value;
        }

        [Bindable]
        public function get url():String
        {
            return _url;
        }

        public function set url(value:String):void
        {
            _url = value;
        }

        [Bindable]
        public function get selList():ArrayCollection
        {
            return _selList;
        }

        public function set selList(value:ArrayCollection):void
        {
            _selList = value;
        }

        [Bindable]
        public function get impList():ArrayCollection
        {
            return _impList;
        }

        public function set impList(value:ArrayCollection):void
        {
            _impList = value;
        }

        [Bindable]
        public function get moTypeMap():Object
        {
            return _moTypeMap;
        }

        public function set moTypeMap(value:Object):void
        {
            _moTypeMap = value;
        }


    }
}
