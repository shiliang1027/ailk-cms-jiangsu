package com.linkage.module.cms.general.monitor.base.core
{
	import com.linkage.module.cms.common.columnar.ColumnarLabel;
	import com.linkage.module.cms.common.columnar.ColumnarNode;
	import com.linkage.module.cms.general.monitor.Params;
	import com.linkage.module.cms.general.monitor.base.core.container.component.PerfPromptComponent;
	import com.linkage.module.cms.general.monitor.base.core.container.component.PromptComponent;
	import com.linkage.module.cms.general.monitor.base.core.container.component.ShowTipWindow;
	import com.linkage.module.cms.general.monitor.base.core.data.DataManager;
	import com.linkage.module.cms.general.monitor.base.core.data.IDataManager;
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.utils.FlexViewUtil;
	import com.linkage.module.cms.general.monitor.common.map.MapLabel;
	import com.linkage.module.cms.general.monitor.common.map.MapNode;
	import com.linkage.system.utils.StringUtils;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.controls.Label;
	import mx.core.UIComponent;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.managers.PopUpManager;

	public class UIListener
	{
		//定时器key
		private var outKey:uint = 0;
		//定时器key
		private var timeKey:uint = 0;
		//是否发光
		private var isShineLight:Boolean = false;
		//是否发外光
		private var isOutLight:Boolean = false;
		//变色的地图
		private var _mapNode:MapNode = null;
		// 舞台容器
		private var _viewSlice:ViewSlice = null;
		// 交互数据管理器
		private var _dataManager:IDataManager = null;
		//提示信息框
		private var _prompt:PromptComponent = null;
		//性能提示框
		private var _perfPrompt:PerfPromptComponent = null;
		//悬浮提示窗
		private var tipWindow:ShowTipWindow = null;
		//当前选择的类型
		private var curType:String = null;
		//当前选择的属地
		private var curAreaId:String = null;
		
		//日志
		public var log:ILogger = Log.getLogger("com.linkage.module.cms.general.monitor.base.core.UIListener");
		
		public function UIListener(viewSlice:ViewSlice)
		{
			_viewSlice = viewSlice;
			_dataManager = new DataManager();
			initEventRegisters();
		}

		/**
		 * 初始化事件监听器
		 *
		 */
		private function initEventRegisters():void
		{
			_viewSlice.addEventListener(MouseEvent.CLICK, handler_MouseClick);
			_viewSlice.addEventListener(MouseEvent.MOUSE_MOVE, handler_MouseMove);
		}

		/**
		 * 捕获鼠标点击事件
		 *
		 * @param event
		 *
		 */
		private function handler_MouseClick(event:MouseEvent):void
		{
			//点击属地进入下一级菜单
			var mapNode:MapNode = FlexViewUtil.findTargetMapNode(event.target);
			if (mapNode && !StringUtils.isEmpty(mapNode.id))
			{
				_viewSlice.switchView(mapNode.id);
			}
			
			//点击告警标记
			var areaMark:IAreaMark = FlexViewUtil.findTargetElement(event.target);
			if (areaMark && !StringUtils.isEmpty(areaMark.areaId))
			{
				//Alert.show("进入显示地市告警信息" + areaMark.areaId);
			}
		}

		/**
		 *鼠标悬浮事件
		 * @param event
		 *
		 */
		public function handler_MouseMove(event:MouseEvent):void
		{
			MouseMoveMapChange(event);
			mapMoveTipInfo(event);
		}

		/**
		 *鼠标移动提示信息
		 * @param event
		 *
		 */
		private function mapMoveTipInfo(event:MouseEvent):void
		{
			//查找标记按钮
			var areaMark:IAreaMark = FlexViewUtil.findTargetElement(event.target);
			if (areaMark && !StringUtils.isEmpty(areaMark.areaId))
			{
				var point:Point = FlexViewUtil.findMousePoint(event, _viewSlice);
				//通过标记类型展示不同的提示框
				switch (areaMark.type)
				{
					case "1":
						showTipWindow(areaMark.type, areaMark.areaId, point);
						break;
					case "7":
						showTipWindow(areaMark.type, areaMark.areaId, point);
						break;
					default:
						//清缓存
						curType = "";
						curAreaId = "";
				}
			}
			else
			{
				if (tipWindow != null)
				{
					tipWindow.visible = false;
				}
				
				//清缓存
				curType = "";
				curAreaId = "";
			}
		}

		/**
		 *地图移动变色
		 * @param event
		 *
		 */
		private function MouseMoveMapChange(event:MouseEvent):void
		{
			var areaId:String = null;
			var mapNode:MapNode = FlexViewUtil.findTargetMapNode(event.target);
			if (mapNode)
			{
				areaId = getAreaId(mapNode.id);
				var mapNodeA:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
				var mapNodeB:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_b") as MapNode;
				var mapLabel:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaId + "_label") as MapLabel;
				mapNodeA.mouseOver();
				mapNodeB.mouseOver();
				mapLabel.mouseOver();
				_viewSlice.curAreaMarkOver(areaId);
				if (_mapNode && _mapNode.id != mapNodeB.id)
				{
					areaId = getAreaId(_mapNode.id);
					var mapNodeAM:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
					var mapNodeBM:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_b") as MapNode;
					var mapLabelM:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaId + "_label") as MapLabel;
					mapNodeAM.mouseOut();
					mapNodeBM.mouseOut();
					mapLabelM.mouseOut();
					_viewSlice.curAreaMarkOut(areaId);
				}
				_mapNode = mapNodeB
				return;
			}
			else
			{
				//查找标记按钮
				var areaMark:IAreaMark = FlexViewUtil.findTargetElement(event.target);
				if (areaMark && !StringUtils.isEmpty(areaMark.areaId))
				{
					var mapNodeAK:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaMark.areaId + "_a") as MapNode;
					var mapNodeBK:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaMark.areaId + "_b") as MapNode;
					var mapLabelK:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaMark.areaId + "_label") as MapLabel;
					mapNodeAK.mouseOver();
					mapNodeBK.mouseOver();
					mapLabelK.mouseOver();
					_viewSlice.curAreaMarkOver(areaMark.areaId);
					if (_mapNode && _mapNode.id != mapNodeBK.id)
					{
						areaId = getAreaId(_mapNode.id);
						var mapNodeAMK:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
						var mapNodeBMK:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_b") as MapNode;
						var mapLabelMK:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaId + "_label") as MapLabel;
						mapNodeAMK.mouseOut();
						mapNodeBMK.mouseOut();
						mapLabelMK.mouseOut();
						_viewSlice.curAreaMarkOut(areaId);
					}
					_mapNode = mapNodeBK
					return;
				}
				//地图名字
				var mapLabell:MapLabel = FlexViewUtil.findTargetMapLabel(event.target);
				if (mapLabell)
				{
					areaId = getAreaId(mapLabell.id);
					var mapNodeAA:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
					var mapNodeBB:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_b") as MapNode;
					var mapLabelC:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaId + "_label") as MapLabel;
					mapNodeAA.mouseOver();
					mapNodeBB.mouseOver();
					mapLabelC.mouseOver();
					_viewSlice.curAreaMarkOver(areaId);
					if (_mapNode && _mapNode.id != mapNodeBB.id)
					{
						areaId = getAreaId(_mapNode.id);
						var mapNodeAAM:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
						var mapNodeBBM:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_b") as MapNode;
						var mapLabelCM:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaId + "_label") as MapLabel;
						mapNodeAAM.mouseOut();
						mapNodeBBM.mouseOut();
						mapLabelCM.mouseOut();
						_viewSlice.curAreaMarkOut(areaId);
					}
					_mapNode = mapNodeBB
					return;
				}
				//地图柱状图
				var columnarNode:ColumnarNode = FlexViewUtil.findTargetColumnarNode(event.target);
				if (columnarNode)
				{
					var mapNodeAN:MapNode = _viewSlice.mapWork.elementBox.getElementById(columnarNode.id + "_a") as MapNode;
					var mapNodeBN:MapNode = _viewSlice.mapWork.elementBox.getElementById(columnarNode.id + "_b") as MapNode;
					var mapLabelN:MapLabel = _viewSlice.mapWork.elementBox.getElementById(columnarNode.id + "_label") as MapLabel;
					mapNodeAN.mouseOver();
					mapNodeBN.mouseOver();
					mapLabelN.mouseOver();
					_viewSlice.curAreaMarkOver(areaId);
					if (_mapNode && _mapNode.id != mapNodeBN.id)
					{
						areaId = getAreaId(_mapNode.id);
						var mapNodeANM:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
						var mapNodeBNM:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_b") as MapNode;
						var mapLabelNM:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaId + "_label") as MapLabel;
						mapNodeANM.mouseOut();
						mapNodeBNM.mouseOut();
						mapLabelNM.mouseOut();
						_viewSlice.curAreaMarkOut(areaId);
					}
					_mapNode = mapNodeBN
					return;
				}
				//地图柱状图标签
				var columnarLabel:ColumnarLabel = FlexViewUtil.findTargetColumnarLabel(event.target);
				if (columnarLabel)
				{
					areaId = getAreaId(columnarLabel.id);
					var mapNodeANL:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
					var mapNodeBNL:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_b") as MapNode;
					var mapLabelNL:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaId + "_label") as MapLabel;
					mapNodeANL.mouseOver();
					mapNodeBNL.mouseOver();
					mapLabelNL.mouseOver();
					_viewSlice.curAreaMarkOver(areaId);
					if (_mapNode && _mapNode.id != mapNodeBNL.id)
					{
						areaId = getAreaId(_mapNode.id);
						var mapNodeANML:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
						var mapNodeBNML:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_b") as MapNode;
						var mapLabelNML:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaId + "_label") as MapLabel;
						mapNodeANML.mouseOut();
						mapNodeBNML.mouseOut();
						mapLabelNML.mouseOut();
						_viewSlice.curAreaMarkOut(areaId);
					}
					_mapNode = mapNodeBNL
					return;
				}
				if (_mapNode)
				{
					areaId = getAreaId(_mapNode.id);
					var mapNodeAAA:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
					var mapNodeBBB:MapNode = _viewSlice.mapWork.elementBox.getElementById(areaId + "_b") as MapNode;
					var mapLabelCC:MapLabel = _viewSlice.mapWork.elementBox.getElementById(areaId + "_label") as MapLabel;
					mapNodeAAA.mouseOut();
					mapNodeBBB.mouseOut();
					mapLabelCC.mouseOut();
					_viewSlice.curAreaMarkOut(areaId);
					_mapNode = null;
				}
			}
		}

		/**
		 *获取属地ID
		 * @param mapId
		 * @return
		 *
		 */
		private function getAreaId(mapId:String):String
		{
			if (mapId == null || mapId.indexOf("_") == -1)
			{
				return null;
			}
			return mapId.split("_")[0];
		}

		/**
		 *查看类型详细信息
		 * @param areaId
		 * @param type
		 * @param specId
		 *
		 */
		private function showDeviceWarnInfo(areaId:String, type:int, specId:int):void
		{
			var url:String = "../level3/frame.action?specId=" + specId + "&cityId=" + areaId + "&type=" + type;
			navigateToURL(new URLRequest(url));
		}

		/**
		 *显示提示信息
		 * @param type 类型
		 * @param areaId 区域ID
		 * @param point 鼠标
		 *
		 */
		private function showTipWindow(type:String, areaId:String, point:Point):void
		{
			if (type != curType || curAreaId != areaId)
			{
				newTipWindow(point);
				var obj:Object = _viewSlice.getAreaMarkTipInfo(type, areaId);
				tipWindow.initData(type, obj);
				
				//初始化结束后，重新定位
				if (tipWindow.height == 0)
				{
					initTipPosition(tipWindow, 300, 200, point);
				}
				else
				{
					initTipPosition(tipWindow, tipWindow.width, tipWindow.height, point);
				}
				tipWindow.visible = true;
				
				curType = type;
				curAreaId = areaId;
			}
		}
		
		private function newTipWindow(point:Point):void
		{
			if (tipWindow == null)
			{
				tipWindow = new ShowTipWindow();
				tipWindow.visible = false;
				_viewSlice.addElement(tipWindow);
			}
		}
		
		/**
		 *初始化提示框位置
		 * @param point
		 *
		 */
		public function initTipPosition(uicComp:UIComponent, width:int, height:int, point:Point):void
		{
			var x:int = point.x;
			var y:int = point.y;
			
			if (y < 120)
			{
				if ((x + width) > (520 - 10))
				{
					uicComp.x = 520 - width;
				}
				else
				{
					uicComp.x = x + 10;
				}
				
				uicComp.y = y + 10;
			}
			else
			{
				if ((x + width) > (750 - 10))
				{
					uicComp.x = x - width;
				}
				else
				{
					uicComp.x = x + 10;
				}
				if ((y + height) > (400 - 10))
				{
					uicComp.y = y - height;
				}
				else
				{
					uicComp.y = y + 10;
				}
			}
		}
	}
}