package com.linkage.module.cms.scene.domain.common
{

    public interface IUser
    {
        /**
         * 用户帐号
         */
        function set account(value:String):void;
        function get account():String;
		
		function set isGisFinished(value:Boolean):void;
		function get isGisFinished():Boolean;
		
        /**
         * 用户域
         */
        function set areaId(value:String):void;
        function get areaId():String;

        function get context():String;
        function set context(value:String):void;

        function get sceneId():String;
        function set sceneId(value:String):void;

        function get sceneTypeId():String;
        function set sceneTypeId(value:String):void;

        function get level():String;
        function set level(value:String):void;

        function get alarmParam():String;
        function set alarmParam(value:String):void;

        function get isDrillDown():Boolean;
        function set isDrillDown(value:Boolean):void;
        /**
         * 0显示缩略图   1显示网元
         **/
        function get showMoLayer():String;
        function set showMoLayer(value:String):void;
        /**
         * 注：0：GIS地图  1：使用矢量图
         **/
        function get mapType():String;
        function set mapType(value:String):void;

        function get usinglayer():String;
        function set usinglayer(value:String):void;

        function get layerurl():String;
        function set layerurl(value:String):void;

        function get layerId():String;
        function set layerId(value:String):void;

        //当前的重点指标id
        function get kpiId():String;
        function set kpiId(value:String):void;

        //用于渲染图层的重点指标id列表
        function get kpiIdList():String;
        function set kpiIdList(value:String):void;
        //用于渲染图层的重点指标motypeid列表
        function get moTypeIdList():String;
        function set moTypeIdList(value:String):void;

        function get kpiName():String;
        function set kpiName(value:String):void;

        function get rn():String;
        function set rn(value:String):void;

        //悬浮目标的区域id或者网元id
        function get floatId():String;
        function set floatId(value:String):void;

        //悬浮目标的区域id或者网元id
        function get floatTime():String;
        function set floatTime(value:String):void;

        //悬浮目标：区域、网元
        function get floatLevel():String;
        function set floatLevel(value:String):void;

        //悬浮目标：区域、网元
        function get refreshPolygon():Boolean;
        function set refreshPolygon(value:Boolean):void;

        function get showBadMoPoints():Boolean;
        function set showBadMoPoints(value:Boolean):void;
        function get perfClass():int;
        function set perfClass(value:int):void;
        function get dateFlag():String;
        function set dateFlag(value:String):void;
        function get cityId():String;
        function set cityId(value:String):void;
        function get cityName():String;
        function set cityName(value:String):void;
        function get moTypeId():String;
        function set moTypeId(value:String):void;
        function get timeInterval():String;
        function set timeInterval(value:String):void;
        function get startTime():String;
        function set startTime(value:String):void;
        function get endTime():String;
        function set endTime(value:String):void;
        function get hisFlag():String;
        function set hisFlag(value:String):void;
        function get moId():String;
        function set moId(value:String):void;
        function get compareDate():String;
        function set compareDate(value:String):void;
        function get labelTypeId():String;
        function set labelTypeId(value:String):void;

        /**
         * 注：0：GIS地图  1：使用矢量图
         **/
        function get currentMapType():String;
        function set currentMapType(value:String):void;

        /**
         * 初始场景Id，第一次加载后不在变化
         * */
        function get initSceneId():String;
        function set initSceneId(value:String):void;

        /**
         *初始layerUrl layerId;
         * */
        function get initLayerId():String;
        function set initLayerId(value:String):void;
        function get initLayerUrl():String;
        function set initLayerUrl(value:String):void;
        function get isStaticres():String;
        function set isStaticres(value:String):void;

        /**
         * 区域还是网元渲染地图
         * */
        function get rendeType():String;
        function set rendeType(value:String):void;

        /**
         *
         * 是否使用蒙版，如果为1使用蒙版，否则不使用
         * */
        function get isNew():String;
        function set isNew(value:String):void
        function get configPerfClass():int;
        function set configPerfClass(value:int):void;


        /**
         * 是否从定制场景跳转过来
         * */
        function get newAdded():String;
        function set newAdded(value:String):void
        function get pointlongitude():String;
        function set pointlongitude(value:String):void
        function get pointlatitude():String;
        function set pointlatitude(value:String):void

        /**
         *判断是否gis定位
         * */
        function get isGisFlag():String;
        function set isGisFlag(value:String):void;

        /**
         *最后定时器刷新的时间戳
         *
         * */
        function get lastTimeStamp():Number;
        function set lastTimeStamp(value:Number):void;

    }
}

