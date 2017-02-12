package com.linkage.module.cms.groupclient.map
{
	import flash.events.MouseEvent;

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
		private var logger:ILogger=Log.getLogger("MapWork");

		//元素容器
		private var _elementBox:ElementBox;
		//地图位置数据
		private var _xmlData:XML;
		//地图元素数组
		private var _mapObjArray:Array;
		//当前地图区域
		private var _mapNode:MapNode=null;

		private var _mapNodeEvent:MapNodeEvent;

		public function MapWork()
		{
			if (_elementBox == null)
			{
				_elementBox=new ElementBox(this);
			}
			this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			this.addEventListener(MouseEvent.CLICK, onMouseClick);
		}

		private function onMouseMove(event:MouseEvent):void
		{
			var areaId:String=null;
			var mapNode:MapNode=findTargetMapNode(event.target);
			if (mapNode)
			{
				areaId=getAreaId(mapNode.id);
				var mapNodeA:MapNode=elementBox.getElementById(areaId + "_a") as MapNode;
				var mapNodeB:MapNode=elementBox.getElementById(areaId + "_b") as MapNode;
				var mapLabel:MapLabel=elementBox.getElementById(areaId + "_label") as MapLabel;
				mapNodeA.mouseOver();
				mapNodeB.mouseOver();
				mapLabel.mouseOver();
				_mapNodeEvent=new MapNodeEvent(MapNodeEvent.MAPNODE_MOUSEOVER);
				_mapNodeEvent.mapNode=mapNodeA;
				this.dispatchEvent(_mapNodeEvent);
				if (_mapNode && _mapNode.id != mapNodeB.id)
				{
					areaId=getAreaId(_mapNode.id);
					var mapNodeAM:MapNode=elementBox.getElementById(areaId + "_a") as MapNode;
					var mapNodeBM:MapNode=elementBox.getElementById(areaId + "_b") as MapNode;
					var mapLabelM:MapLabel=elementBox.getElementById(areaId + "_label") as MapLabel;
					mapNodeAM.mouseOut();
					mapNodeBM.mouseOut();
					mapLabelM.mouseOut();
					_mapNodeEvent=new MapNodeEvent(MapNodeEvent.MAPNODE_MOUSEOUT);
					_mapNodeEvent.mapNode=mapNodeAM;
					this.dispatchEvent(_mapNodeEvent);
				}
				_mapNode=mapNodeB
				return;
			}
			else
			{
				//地图名字
				var mapLabell:MapLabel=findTargetMapLabel(event.target);
				if (mapLabell)
				{
					areaId=getAreaId(mapLabell.id);
					var mapNodeAA:MapNode=elementBox.getElementById(areaId + "_a") as MapNode;
					var mapNodeBB:MapNode=elementBox.getElementById(areaId + "_b") as MapNode;
					var mapLabelC:MapLabel=elementBox.getElementById(areaId + "_label") as MapLabel;
					mapNodeAA.mouseOver();
					mapNodeBB.mouseOver();
					mapLabelC.mouseOver();
					_mapNodeEvent=new MapNodeEvent(MapNodeEvent.MAPNODE_MOUSEOVER);
					_mapNodeEvent.mapNode=mapNodeAA;
					this.dispatchEvent(_mapNodeEvent);
					if (_mapNode && _mapNode.id != mapNodeBB.id)
					{
						areaId=getAreaId(_mapNode.id);
						var mapNodeAAM:MapNode=elementBox.getElementById(areaId + "_a") as MapNode;
						var mapNodeBBM:MapNode=elementBox.getElementById(areaId + "_b") as MapNode;
						var mapLabelCM:MapLabel=elementBox.getElementById(areaId + "_label") as MapLabel;
						mapNodeAAM.mouseOut();
						mapNodeBBM.mouseOut();
						mapLabelCM.mouseOut();
						_mapNodeEvent=new MapNodeEvent(MapNodeEvent.MAPNODE_MOUSEOUT);
						_mapNodeEvent.mapNode=mapNodeAAM;
						this.dispatchEvent(_mapNodeEvent);
					}
					_mapNode=mapNodeBB;
					return;
				}
				if (_mapNode)
				{
					areaId=getAreaId(_mapNode.id);
					var mapNodeAAA:MapNode=elementBox.getElementById(areaId + "_a") as MapNode;
					var mapNodeBBB:MapNode=elementBox.getElementById(areaId + "_b") as MapNode;
					var mapLabelCC:MapLabel=elementBox.getElementById(areaId + "_label") as MapLabel;
					mapNodeAAA.mouseOut();
					mapNodeBBB.mouseOut();
					mapLabelCC.mouseOut();
					_mapNodeEvent=new MapNodeEvent(MapNodeEvent.MAPNODE_MOUSEOUT);
					_mapNodeEvent.mapNode=mapNodeAAA;
					this.dispatchEvent(_mapNodeEvent);
					_mapNode=null;
				}
			}
		}

		private function onMouseClick(event:MouseEvent):void
		{
			var areaId:String=null;
			var mapNode:MapNode=findTargetMapNode(event.target);
			if (mapNode)
			{
				areaId=getAreaId(mapNode.id);
				var mapNodeA:MapNode=elementBox.getElementById(areaId + "_a") as MapNode;
				_mapNodeEvent=new MapNodeEvent(MapNodeEvent.MAPNODE_CLICK);
				_mapNodeEvent.mapNode=mapNodeA;
				this.dispatchEvent(_mapNodeEvent);
			}
			else
			{
				//地图名字
				var mapLabell:MapLabel=findTargetMapLabel(event.target);
				if (mapLabell)
				{
					areaId=getAreaId(mapLabell.id);
					var mapNodeAA:MapNode=elementBox.getElementById(areaId + "_a") as MapNode;
					_mapNodeEvent=new MapNodeEvent(MapNodeEvent.MAPNODE_CLICK);
					_mapNodeEvent.mapNode=mapNodeAA;
					this.dispatchEvent(_mapNodeEvent);
				}
			}
		}

		public function findTargetMapNode(target:Object):MapNode
		{
			if (target == null)
			{
				return null;
			}

			while (!(target is MapNode))
			{
				target=target.parent;

				if (target == null || target == target.parent)
				{
					return null;
				}
			}
			return target as MapNode;
		}

		/**
		 * 查找目标对象(或其父对象)是那一种元素对象,找不到返回空
		 * @param target
		 * @return
		 *
		 */
		public function findTargetMapLabel(target:Object):MapLabel
		{
			if (target == null)
			{
				return null;
			}

			while (!(target is MapLabel))
			{
				target=target.parent;

				if (target == null || target == target.parent)
				{
					return null;
				}
			}
			return target as MapLabel;
		}

		public function get mapObjArray():Array
		{
			return _mapObjArray;
		}

		public function set mapObjArray(value:Array):void
		{
			_mapObjArray=value;
		}

		public function get xmlData():XML
		{
			return _xmlData;
		}

		public function set xmlData(value:XML):void
		{
			_xmlData=value;
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
				var mapNode:MapNode=new MapNode();
				mapNode.id=map.@k;
				mapNode.x=map.@x;
				mapNode.y=map.@y;
				mapNode.width=map.@w;
				mapNode.height=map.@h;
				mapNode.map=_mapObjArray[map.@k];
				mapNode.map.width=mapNode.width;
				mapNode.map.height=mapNode.height;
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
					var mapLabel:MapLabel=new MapLabel();
					mapLabel.id=getAreaId(map.@k) + "_label";
					mapLabel.text=map.@n;
					mapLabel.styleName="mapLabel";
					mapLabel.x=Number(map.@x) + Number(map.@xr);
					mapLabel.y=Number(map.@y) + Number(map.@yr);
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
				var mapNode:MapNode=_elementBox.getElementById(map.@k + "_a") as MapNode;
				if (mapNode != null)
				{
					var color:String=map.@color;
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

		public function fillMapById(mapId:String, color:uint):void
		{
			var mapNodeA:MapNode=_elementBox.getElementById(mapId + "_a") as MapNode;
			var mapNodeB:MapNode=_elementBox.getElementById(mapId + "_b") as MapNode;
			if (mapNodeA != null)
			{
				mapNodeA.fillColor(color);
				mapNodeB.fillColor(color);
			}
		}

		public function forEach(callback:Function=null):void
		{
			for each (var data:IData in _elementBox.elements)
			{
				if (callback != null)
				{
					callback.call(null, data);
				}
			}
		}

		public function getAreaId(mapId:String):String
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
			_elementBox=value;
		}

	}
}