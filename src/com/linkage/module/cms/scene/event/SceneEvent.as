package com.linkage.module.cms.scene.event
{
    import flash.events.Event;

    public class SceneEvent extends Event
    {
        //加载场景配置数据
        public static const LOAD_SCENE_CFG:String = "LOAD_SCENE_CFG";
        //处理场景配置数据
        public static const DEAL_SCENE_CFG:String = "DEAL_SCENE_CFG";

        //加载场景下区域的缩略图数据
        public static const LOAD_SCENE_SNAPSHOTS:String = "LOAD_SCENE_SNAPSHOTS";

        //加载场景下区域的缩略图数据
        public static const LOAD_SCENE_SNAPSHOTS_ALL:String = "LOAD_SCENE_SNAPSHOTS_ALL";

        //加载场景下区域的缩略图数据
        public static const LOAD_SCENE_USERNUM:String = "LOAD_SCENE_USERNUM";

        //处理场景下单个区域的缩略图数据图层
        public static const DEAL_SCENE_SNAPSHOTS:String = "DEAL_SCENE_SNAPSHOTS";

        public static const DEAL_SCENE_JINGQUKPI:String = "DEAL_SCENE_JINGQUKPI";

        //处理场景下所有区域的缩略图数据图层  五一风景区场景用
        public static const DEAL_SCENE_SNAPSHOTS_ALL:String = "DEAL_SCENE_SNAPSHOTS_ALL";

        //处理场景下区域的缩略图数据 feature
        public static const DEAL_SCENE_SNAPSHOTS_FEATURE:String = "DEAL_SCENE_SNAPSHOTS_FEATURE";

        //显示场景下区域的缩略图数据
        public static const SHOW_SCENE_SNAPSHOTS:String = "SHOW_SCENE_SNAPSHOTS";

        //加载泰森多边形数据 
        public static const LOAD_SCENE_POLYGON:String = "LOAD_SCENE_POLYGON";

        //加载GIS 配置的图层
        public static const LOAD_SCENE_LAYER:String = "LOAD_SCENE_LAYER";

        //处理泰森多边形数据 图层
        public static const DEAL_SCENE_POLYGON:String = "DEAL_SCENE_POLYGON";

        //处理泰森多边形数据 feature
        public static const DEAL_SCENE_POLYGON_FEATURE:String = "DEAL_SCENE_POLYGON_FEATURE";

        //显示泰森多边形数据
        public static const SHOW_SCENE_POLYGON:String = "SHOW_SCENE_POLYGON";

        //区域缩略图点击事件  切换视图到相应的区域。  TODO
        public static const CHANGE_VIEW:String = "CHANGE_VIEW";

        //点击缩略图或者tree视图，切换地图，并抛出change_view事件
        public static const CHANGE_MAPVIEW:String = "CHANGE_MAPVIEW";

        //点击缩略图或者tree视图，切换地图，并抛出change_view事件
        public static const RENDER_VECTOR_MAP:String = "RENDER_VECTOR_MAP";

        //区域缩略图点击事件  切换视图到相应的区域。 刷新GIS视图。
        public static const CHANGE_VIEW_REFRESHGIS:String = "CHANGE_VIEW_REFRESHGIS";

        //GIS图层配置面板被点击 根据选择刷新图层  TODO
        public static const FILTER_LAYER:String = "FILTER_LAYER";

        //加载重点指标
        public static const LOAD_IMP_KPI:String = "LOAD_IMP_KPI";

        //处理重点指标
        public static const DEAL_IMP_KPI:String = "DEAL_IMP_KPI";

        //加载退服原因
        public static const LOAD_QUIT_TYPE:String = "LOAD_QUIT_TYPE";

        //GIS图层配置面板被 刷新
        public static const ENABLE_VIEW_CFG:String = "ENABLE_VIEW_CFG";

        //组件刷新数据的事件；
        public static const COMPONENT_REFRESH_DATA:String = "COMPONENT_REFRESH_DATA";

        //显示 区域图片 或者网元的 悬浮指标告警窗口
        public static const SHOW_PERFORMANCEINDEX:String = "SHOW_PERFORMANCEINDEX";
        //hide 区域图片 或者网元的 悬浮指标告警窗口
        public static const HIDE_PERFORMANCEINDEX:String = "HIDE_PERFORMANCEINDEX";

        //显示 区域图片 或者网元的 悬浮指标告警窗口
        public static const UPDATE_GISFEATURE:String = "UPDATE_GISFEATURE";

        public static const REFRESH_SCENE_POLYGON:String = "REFRESH_SCENE_POLYGON";

        public static const CREATE_SCENE_POLYGON:String = "CREATE_SCENE_POLYGON";

        public static const LOAD_TYPHOON_DATA:String = "LOAD_TYPHOON_DATA";

        public static const LOAD_CITY_LAYER:String = "LOAD_CITY_LAYER";

        public static const LOAD_ROAD_PERF_MSG:String = "LOAD_ROAD_PERF_MSG";
        public static const DEAL_ROAD_PERF_MSG:String = "DEAL_ROAD_PERF_MSG";
        public static const SHOW_ROAD_PERF_MSG:String = "SHOW_ROAD_PERF_MSG";

        public static const SHOW_TYPHOON:String = "SHOW_TYPHOON";

        public static const LOAD_TYPHOON_COVER_CITY:String = "LOAD_TYPHOON_COVER_CITY";

        public static const SHOW_TYPHOON_COVER_CITY:String = "SHOW_TYPHOON_COVER_CITY";

        public static const PANEL_MAXIMIZE:String = "PANEL_MAXIMIZE";

        public static const PANEL_CLOSE:String = "PANEL_CLOSE";
        public static const KPI_CHANGE:String = "KPI_CHANGE";
        public static const SHOW_CITY_LAYER:String = "SHOW_CITY_LAYER";

        public static const SHOWMO2GIS:String = "SHOWMO2GIS"; //地图定位网元gis位置
        public static const SHOW_MOGIS_LAYER:String = "SHOW_MOGIS_LAYER"; //在gis地图上撒相应的网元
        public static const SEARCH_MOGIS_LAYER:String = "SEARCH_MOGIS_LAYER"; //在gis地图上查找相应的网元，并且更新

        public static const DELETE_COMPARE_DATE:String = "DELETE_COMPARE_DATE";
        public static const COMPARE_DATE:String = "COMPARE_DATE";

        //BTS  NODEB加载传输管线信息
        public static const LOAD_LINE_INFO:String = "LOAD_LINE_INFO";
        public static const SHOW_LINE_INFO:String = "SHOW_LINE_INFO";
        public static const LOAD_LINE_GIS_INFO:String = "LOAD_LINE_GIS_INFO";
        public static const SHOW_LINE_GIS_INFO:String = "SHOW_LINE_GIS_INFO";

        //光路信息
        public static const LOAD_OPTIC_INFO:String = "LOAD_OPTIC_INFO";
        public static const SHOW_OPTIC_INFO:String = "SHOW_OPTIC_INFO";

        //机楼告警信息
        public static const LOAD_SITE_ALARM:String = "LOAD_SITE_ALARM";
        public static const SHOW_SITE_ALARM:String = "SHOW_SITE_ALARM";

        //暂停恢复滚动效果。
        public static const PAUSE_NEWS:String = "PAUSE_NEWS";
        public static const RESUME_NEWS:String = "RESUME_NEWS";

        //多网元gis坐标查询
        public static const MOIDS_COORDINATE_SEARCH:String = "MOIDS_COORDINATE_SEARCH";
        //多网元gis坐标定位
        public static const SHOW_MULT_MOGIS_LAYER:String = "SHOW_MULT_MOGIS_LAYER";

        //全选，全不选
        public static const CHECKBOX_ALL_SELECTED:String = "CHECKBOX_ALL_SELECTED";

        //区域网元地图数据切换
        public static const AREAORMO_DATACHANGE:String = "AREAORMO_DATACHANGE";
        public static const AREAORMO_MAPVECTOR_DATACHANGE:String = "AREAORMO_MAPVECTOR_DATACHANGE";
        public static const AREAORMO_GISMAP_DATACHANGE:String = "AREAORMO_GISMAP_DATACHANGE";

        //刷新topn数据
        public static const CMS_SCENE_DEGRADATIONTOPN_REFRESHTOPN:String = "CMS_SCENE_DEGRADATIONTOPN_REFRESHTOPN";

        //说明蒙版下一步
        public static const CMS_SCENE_MASK_NEXT:String = "CMS_SCENE_MASK_NEXT";
        //隐藏说明蒙版
        public static const CMS_SCENE_MASK_HIDE:String = "CMS_SCENE_MASK_HIDE";

        //gisfeature 图片加入右键菜单，悬浮窗
        public static const CMS_SCENE_MAPVIEW_SHOWKPIFLOAT:String = "CMS_SCENE_MAPVIEW_SHOWKPIFLOAT";

        //配置保存事件
        public static const CMS_SCENE_SCENEVIEW_CONFIGSAVE:String = "CMS_SCENE_SCENEVIEW_CONFIGSAVE";

        //保存完后将页面生效
        public static const CMS_SCENE_SCENEVIEW_CONFIGENABLE:String = "CMS_SCENE_SCENEVIEW_CONFIGENABLE";

        //根据坐标点加载资源信息
        public static const CMS_SCENE_SCENEVIEW_SOURCEBYPOINTS:String = "CMS_SCENE_SCENEVIEW_SOURCEBYPOINTS";
        //根据坐标点加载资源信息返回
        public static const CMS_SCENE_SCENEVIEW_SOURCEBYPOINTS_COMP:String = "CMS_SCENE_SCENEVIEW_SOURCEBYPOINTS_COMP";
        //框选加载资源信息
        public static const CMS_SCENE_SCENEVIEW_SOURCEBYDRAW:String = "CMS_SCENE_SCENEVIEW_SOURCEBYDRAW";
        //框选加载资源信息
        public static const CMS_SCENE_SCENEVIEW_SOURCEBYMO:String = "CMS_SCENE_SCENEVIEW_SOURCEBYMO";
        //框选加载资源信息完成
        public static const CMS_SCENE_SCENEVIEW_SOURCEBYMO_COMP:String = "CMS_SCENE_SCENEVIEW_SOURCEBYMO_COMP";
        //框选加载资源信息完成
        public static const CMS_SCENE_SCENEVIEW_SOURCETUDOCHANGE:String = "CMS_SCENE_SCENEVIEW_SOURCETUDOCHANGE";
        //框选加载资源信息完成
        public static const CMS_SCENE_SCENEVIEW_SOURCETUDOCHANGE_COMP:String = "CMS_SCENE_SCENEVIEW_SOURCETUDOCHANGE_COMP";
        //打开快速检索抽屉按钮
        public static const CMS_SCENE_SCENEVIEW_SEARCH_OPEN:String = "CMS_SCENE_SCENEVIEW_SEARCH_OPEN";
        public static const CMS_SCENE_SCENEVIEW_SHOW_MOLIST:String = "CMS_SCENE_SCENEVIEW_SHOW_MOLIST";
        public static const CMS_SCENE_SCENEINTRO_SHOWTISHI:String = "CMS_SCENE_SCENEINTRO_SHOWTISHI";

        public static const CMS_SCENE_TOPNDATA_TOPNDATALENGTH:String = "CMS_SCENE_TOPNDATA_TOPNDATALENGTH"; //topn长度大于零事件

        public static const CMS_SCENE_SCENEVIEW_BACKTOPFLOOR:String = "CMS_SCENE_SCENEVIEW_BACKTOPFLOOR"; //返回顶层

        public static const CMS_SCENE_SCENEVIEW_EFRESH:String = "CMS_SCENE_SCENEVIEW_EFRESH";
        public static const CMS_SCENE_SCENEVIEW_NOEFRESH:String = "CMS_SCENE_SCENEVIEW_NOEFRESH";

        public static const CMS_SCENE_MAPVIEW_CAMERALISTGETHANDLER:String = "CMS_SCENE_MAPVIEW_CAMERALISTGETHANDLER"; //摄像头

        public static const CMS_SCENE_MAPVIEW_CAMERAINFOGETHANDLER:String = "CMS_SCENE_MAPVIEW_CAMERAINFOGETHANDLER"; //摄像头

        public static const CMS_SCENE_MAPVIEW_CAMERACASTMAPHANDLER:String = "CMS_SCENE_MAPVIEW_CAMERACASTMAPHANDLER"; //摄像头

        public static const CMS_SCENE_SCENEVIEW_CAMERAFIXPOSITIONHANDLER:String = "CMS_SCENE_SCENEVIEW_CAMERAFIXPOSITIONHANDLER";

        public static const CMS_SCENE_CAMERALISTSHOWWIN_CAMERALISTSHOWHANDLER:String = "CMS_SCENE_CAMERALISTSHOWWIN_CAMERALISTSHOWHANDLER";


//		public static const PANEL_ADD:String = "PANEL_ADD";
//		public static const PANEL_REMOVE:String = "PANEL_REMOVE";
		
		public static const MAPVECTORCOMP_COMPLETE:String = "MAPVECTORCOMP_COMPLETE";
		
        private var _mouseX:int;
        private var _mouseY:int;


        private var _layerId:String;
        private var _layerShow:Boolean;

        private var _panelName:String;
        private var _panelIndex:String;
        private var _panellocation:String;
        private var _panelMaxFlag:Boolean;

        private var _kpiName:String;

        public var filterType:String = "mo";
        public var sceneIntroString:String = "";
        public var labelTypeId:String = "";

        public var param:Object = {};

        public function SceneEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }

        public function get layerId():String
        {
            return _layerId;
        }

        public function set layerId(value:String):void
        {
            _layerId = value;
        }

        public function get layerShow():Boolean
        {
            return _layerShow;
        }

        public function set layerShow(value:Boolean):void
        {
            _layerShow = value;
        }

        public function get mouseX():int
        {
            return _mouseX;
        }

        public function set mouseX(value:int):void
        {
            _mouseX = value;
        }

        public function get mouseY():int
        {
            return _mouseY;
        }

        public function set mouseY(value:int):void
        {
            _mouseY = value;
        }

        public function get panelName():String
        {
            return _panelName;
        }

        public function set panelName(value:String):void
        {
            _panelName = value;
        }

        public function get panelIndex():String
        {
            return _panelIndex;
        }

        public function set panelIndex(value:String):void
        {
            _panelIndex = value;
        }

        public function get panellocation():String
        {
            return _panellocation;
        }

        public function set panellocation(value:String):void
        {
            _panellocation = value;
        }

        public function get panelMaxFlag():Boolean
        {
            return _panelMaxFlag;
        }

        public function set panelMaxFlag(value:Boolean):void
        {
            _panelMaxFlag = value;
        }

        public function get kpiName():String
        {
            return _kpiName;
        }

        public function set kpiName(value:String):void
        {
            _kpiName = value;
        }


    }
}

