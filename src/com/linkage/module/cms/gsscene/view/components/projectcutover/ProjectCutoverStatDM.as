package com.linkage.module.cms.gsscene.view.components.projectcutover
{
    import mx.collections.ArrayCollection;

    public class ProjectCutoverStatDM
    {
        private var _projectListCity:ArrayCollection = new ArrayCollection([{"cityname": "南京", "projectnum": "102"},
                                                                          {"cityname": "苏州", "projectnum": "87"},
                                                                          {"cityname": "无锡", "projectnum": "66"},
                                                                          {"cityname": "常州", "projectnum": "48"},
                                                                          {"cityname": "镇江", "projectnum": "56"},
                                                                          {"cityname": "扬州", "projectnum": "78"},
                                                                          {"cityname": "南通", "projectnum": "90"},
                                                                          {"cityname": "泰州", "projectnum": "45"},
                                                                          {"cityname": "徐州", "projectnum": "39"},
                                                                          {"cityname": "淮安", "projectnum": "55"},
                                                                          {"cityname": "盐城", "projectnum": "71"},
                                                                          {"cityname": "连云港", "projectnum": "69"},
                                                                          {"cityname": "宿迁", "projectnum": "65"}]);
        private var _projectListMotype:ArrayCollection = new ArrayCollection;
        private var _projectAlarmsList:Object = new Object;

        [Bindable]
        public function get projectListCity():ArrayCollection
        {
            return _projectListCity;
        }

        public function set projectListCity(value:ArrayCollection):void
        {
            _projectListCity = value;
        }

        [Bindable]
        public function get projectListMotype():ArrayCollection
        {
            return _projectListMotype;
        }

        public function set projectListMotype(value:ArrayCollection):void
        {
            _projectListMotype = value;
        }

        [Bindable]
        public function get projectAlarmsList():Object
        {
            return _projectAlarmsList;
        }

        public function set projectAlarmsList(value:Object):void
        {
            _projectAlarmsList = value;
        }


    }
}
