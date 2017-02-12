package com.linkage.module.cms.scene.event
{
	import flash.events.Event;

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
	public class AreaQuickConifgEvent extends Event
	{
		public var param:Object;

		public var areaName:String;

		//加载基础书
		public static const LOAD_BASE_TREE:String="LOAD_BASE_TREE";

		//加载基础书完成
		public static const LOAD_BASE_TREE_COMP:String="LOAD_BASE_TREE_COMP";

		//加载分页树
		public static const LOAD_PAGE_TREE:String="LOAD_PAGE_TREE";
		//加载分页树完成
		public static const LOAD_PAGE_TREE_COMP:String="LOAD_PAGE_TREE_COMP";
		//查地市
		public static const QUERY_AREAQUICK_CITYS:String="QUERY_AREAQUICK_CITYS";
		//查询经纬度
		public static const QUERY_TUDE_BY_MOID:String="QUERY_TUDE_BY_MOID";

		//根据网元类型查询待选指标
		public static const QUERY_UNSELECTKPI_BY_MOTYPE:String="QUERY_UNSELECTKPI_BY_MOTYPE";

		//查询网元类型
		public static const QUERY_MOTYPE_LIST:String="QUERY_MOTYPE_LIST";

		//根据网元和网元类型查询经纬度
		public static const QUERY_TUDE_BY_MOID_AND_MOTYPEID:String="QUERY_TUDE_BY_MOID_AND_MOTYPEID";

		//根据网元和网元类型查询经纬度OK
		public static const QUERY_TUDE_BY_MOID_AND_MOTYPEID_COMP:String="QUERY_TUDE_BY_MOID_AND_MOTYPEID_COMP";

		//查询经纬度地名
		public static const QUERY_TUDE_BY_CITYNAME:String="QUERY_TUDE_BY_CITYNAME";

		//查询经纬度地名完成
		public static const QUERY_TUDE_BY_CITYNAME_COMP:String="QUERY_TUDE_BY_CITYNAME_COMP";

		//查询经纬度完成
		public static const QUERY_TUDE_BY_MOID_COMP:String="QUERY_TUDE_BY_MOID_COMP";

		//查询框选的网元
		public static const LOAD_MOS_BY_DRAW:String="LOAD_MOS_BY_DRAW";

		//查询框选的网元完成
		public static const LOAD_MOS_BY_DRAW_COMP:String="LOAD_MOS_BY_DRAW_COMP";

		//查询指标和应急资源
		public static const QUERY_KPIS_AND_EMERCYS:String="QUERY_KPIS_AND_EMERCYS";

		//加载场景
		public static const LOAD_SCENES_AREA:String="LOAD_SCENES_AREA";

		//加载场景完成
		public static const LOAD_SCENES_AREA_COMP:String="LOAD_SCENES_AREA_COMP";

		//加载场景类型
		public static const LOAD_SCENES_TYPE:String="LOAD_SCENES_TYPE";

		//加载场景地市
		public static const LOAD_CITY_NAMES:String="LOAD_CITY_NAMES";

		//加载场景地市完成
		public static const LOAD_CITY_NAMES_COMP:String="LOAD_CITY_NAMES_COMP";

		//加载场景类型完成
		public static const LOAD_SCENES_TYPE_COMP:String="LOAD_SCENES_TYPE_COMP";

		//加载区域缩略图
		public static const LOAD_AREA_PIC:String="LOAD_AREA_PIC";

		//加载导入数据
		public static const LOAD_IMPORT_DATAS:String="LOAD_IMPORT_DATAS";
		//加载导入数据成功
		public static const LOAD_IMPORT_DATAS_COMP:String="LOAD_IMPORT_DATAS_COMP";
		//保存配置
		public static const SAVE_AREA_CONFIG:String="SAVE_AREA_CONFIG";

		public function AreaQuickConifgEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}