package com.linkage.module.cms.gsscene.view.components.mapvector
{

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MapVectorDM
	{
		private var _dyeMap:Object = new Object; //渲染数据，key是地市id value 是map对应相应的color和数字

		private var _loadMapShowKey:Object;//展示地图数据的样式，{eq:"true",perf:"false"}

		//加载地图数据的类型，1-表示查询设备，性能告警网元数；2-表示退服的2G，3G，4G网元数；3-表示查询区域相关信息;4-表示查询某项 指标的值。
		private var _loadMapInfoType:String = "1"; //默认为1，查询设备，性能告警网元数。
		
		public function get dyeMap():Object
		{
			return _dyeMap;
		}
		
		public function set dyeMap(value:Object):void
		{
			_dyeMap = value;
		}
		public function get loadMapShowKey():Object
		{
			return _loadMapShowKey;
		}

		public function set loadMapShowKey(value:Object):void
		{
			_loadMapShowKey = value;
		}

		public function get loadMapInfoType():String
		{
			return _loadMapInfoType;
		}
		
		public function set loadMapInfoType(value:String):void
		{
			_loadMapInfoType = value;
		}

	}
}