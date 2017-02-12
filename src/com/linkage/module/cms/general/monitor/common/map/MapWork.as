package com.linkage.module.cms.general.monitor.common.map
{
	import mx.controls.Alert;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import spark.components.Group;

	/**
	 * 地图画布
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2010-11-24 下午06:38:18
	 * @category com.linkage.map.core
	 * @copyright 南京联创科技 网管开发部
	 */
	public class MapWork extends Group
	{
		private var logger:ILogger = Log.getLogger("MapWork");
		
		//元素容器
		private var _elementBox:ElementBox;
		//地图位置数据
		private var _xmlData:XML;
		//地图元素数组
		private var _mapObjArray:Array;

		public function MapWork()
		{
			if (_elementBox == null)
			{
				_elementBox = new ElementBox(this);
			}
		}

		public function get mapObjArray():Array
		{
			return _mapObjArray;
		}

		public function set mapObjArray(value:Array):void
		{
			_mapObjArray = value;
		}

		public function get xmlData():XML
		{
			return _xmlData;
		}

		public function set xmlData(value:XML):void
		{
			_xmlData = value;
		}

		//显示地图
		public function showMap():void
		{
			try
			{
				buildMap();
				buildLabel();
			}
			catch (e:Error)
			{
				logger.debug("构建地图出错!", e.getStackTrace());
			}
		}

		//根据位置数据定位地图区域
		private function buildMap():void
		{
			for each (var map:XML in _xmlData.map)
			{
				var mapNode:MapNode = new MapNode();
				mapNode.id = map.@k;
				mapNode.x = map.@x;
				mapNode.y = map.@y;
				mapNode.width = map.@w;
				mapNode.height = map.@h;
				mapNode.map = _mapObjArray[map.@k];
				mapNode.map.width = mapNode.width;
				mapNode.map.height = mapNode.height;
				mapNode.addChild(mapNode.map);
				_elementBox.add(mapNode);
			}
		}

		//根据位置数据定位地图名称
		private function buildLabel():void
		{
			for each (var map:XML in _xmlData.map)
			{
				if (map.@n != "")
				{
					var mapLabel:MapLabel = new MapLabel();
					mapLabel.id = getAreaId(map.@k) + "_label";
					mapLabel.text = map.@n;
					mapLabel.styleName = "mapLabel";
					mapLabel.x = Number(map.@x) + Number(map.@xr);
					mapLabel.y = Number(map.@y) + Number(map.@yr);
					_elementBox.add(mapLabel);
				}
			}
		}

		//刷新地图画板(颜色还原)
		public function refleshMap():void
		{
			forEach(function(data:IData):void
				{
					if (data is MapNode)
					{
						(data as MapNode).reset();
					}
				});
		}

		//根据指标数据填充地图颜色
		public function fillMap(xml:XML):void
		{
			for each (var map:XML in xml.map)
			{
				var mapNode:MapNode = _elementBox.getElementById(map.@k + "_a") as MapNode;
				if (mapNode != null)
				{
					var color:String = map.@color;
					if (color == "0")
					{
						mapNode.reset();
					}
					else
					{
						mapNode.fillColor(Number(color));
					}
				}
			}
		}

		public function forEach(callback:Function = null):void
		{
			for each (var data:IData in _elementBox.elements)
			{
				if (callback != null)
				{
					callback.call(null, data);
				}
			}
		}

		private function getAreaId(mapId:String):String
		{
			if (mapId == null || mapId.indexOf("_") == -1)
			{
				return null;
			}
			return mapId.split("_")[0];
		}

		public function get elementBox():ElementBox
		{
			return _elementBox;
		}

		public function set elementBox(value:ElementBox):void
		{
			_elementBox = value;
		}

	}
}