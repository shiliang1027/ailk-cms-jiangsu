package com.linkage.module.cms.groupclient.renderer
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.events.ContextMenuEvent;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Point;
	import flash.ui.ContextMenuItem;
	import flash.utils.Dictionary;

//	import flexlib.controls.iconLoaderClasses.IcnsParser;

	import mx.controls.AdvancedDataGrid;
	import mx.controls.Alert;
	import mx.controls.Menu;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridItemRenderer;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.events.MenuEvent;

	public class RightClickManager
	{
		private var rightClickTarget:DisplayObject; //右键点击的对象
		private var selectTarget:DisplayObject; //右键点击的对象
		private var rightClickMenuOwner:DisplayObject; //右键菜单的属主
		public const RIGHT_CLICK:String = "rightClick";
		public const javascript:XML = <script>
				<![CDATA[
					/**
					 * 
					 * Copyright 2007
					 * 
					 * Paulius Uza
					 * http://www.uza.lt
					 * 
					 * Dan Florio
					 * http://www.polygeek.com
					 * 
					 * Project website:
					 * http://code.google.com/p/custom-context-menu/
					 * 
					 * --
					 * RightClick for Flash Player. 
					 * Version 0.6.2
					 * 
					 */
					function(flashObjectId)
					{				
						var RightClick = {
							/**
							 *  Constructor
							 */ 
							init: function (flashObjectId) {
								this.FlashObjectID = flashObjectId;
								this.Cache = this.FlashObjectID;
								if(window.addEventListener){
									 window.addEventListener("mousedown", this.onGeckoMouse(), true);
								} else {
									document.getElementById(this.FlashObjectID).parentNode.onmouseup = function() { document.getElementById(RightClick.FlashObjectID).parentNode.releaseCapture(); }
									document.oncontextmenu = function(){ if(window.event.srcElement.id == RightClick.FlashObjectID) { return false; } else { RightClick.Cache = "nan"; }}
									document.getElementById(this.FlashObjectID).parentNode.onmousedown = RightClick.onIEMouse;
								}
							},
							/**
							 * GECKO / WEBKIT event overkill
							 * @param {Object} eventObject
							 */
							killEvents: function(eventObject) {
								if(eventObject) {
									if (eventObject.stopPropagation) eventObject.stopPropagation();
									if (eventObject.preventDefault) eventObject.preventDefault();
									if (eventObject.preventCapture) eventObject.preventCapture();
									if (eventObject.preventBubble) eventObject.preventBubble();
								}
							},
							/**
							 * GECKO / WEBKIT call right click
							 * @param {Object} ev
							 */
							onGeckoMouse: function(ev) {
								return function(ev) {
								if (ev.button != 0) {
									RightClick.killEvents(ev);
									if(ev.target.id == RightClick.FlashObjectID && RightClick.Cache == RightClick.FlashObjectID) {
										RightClick.call();
									}
									RightClick.Cache = ev.target.id;
								}
							  }
							},
							/**
							 * IE call right click
							 * @param {Object} ev
							 */
							onIEMouse: function() {
								if (event.button > 1) {
									if(window.event.srcElement.id == RightClick.FlashObjectID && RightClick.Cache == RightClick.FlashObjectID) {
										RightClick.call(); 
									}
									document.getElementById(RightClick.FlashObjectID).parentNode.setCapture();
									if(window.event.srcElement.id)
									RightClick.Cache = window.event.srcElement.id;
								}
							},
							/**
							 * Main call to Flash External Interface
							 */
							call: function() {
								document.getElementById(this.FlashObjectID).rightClick();
							}
						}
						
						RightClick.init(flashObjectId);
					}
				]]>
			</script>;

		private var menu:Menu;
		private var window:DisplayObjectContainer;

		public function RightClickManager(win:DisplayObjectContainer)
		{
//			window = win;
//			regist();
//			return;
		}

		public function addRightClickMenu(obj:UIComponent):void
		{
			obj.addEventListener(RIGHT_CLICK, rightClickHandler);
		}

		//右键触发事件
		private function rightClickHandler(event:ContextMenuEvent):void
		{
			//确定对象
			selectTarget = rightClickTarget;
			var tmp:InteractiveObject = rightClickTarget as InteractiveObject;
			while (tmp != null && tmp.contextMenu == null)
			{
				tmp = tmp.parent;
			}
			if (tmp != null)
			{
				rightClickMenuOwner = tmp;
			}
			else
			{
				rightClickMenuOwner == null;
			}

			if (rightClickMenuOwner != null)
			{
				//隐藏原有菜单
				if (menu != null)
				{
					menu.hide();
					menu.removeEventListener(MenuEvent.ITEM_CLICK, menuItemSelected);
					menu = null;
				}

				//特殊判断，如果是表格，并且选中项无数据，则也不显示
				if ((rightClickMenuOwner as AdvancedDataGrid) != null && (selectTarget as IDropInListItemRenderer) == null)
				{
					return;
				}

				menu = Menu.createMenu(window, createMenuItems(), true);
				//menu.iconField="itemIcon";//右键菜单的图标
				menu.labelField = "label"; //右键菜单的名称 
				menu.variableRowHeight = true;
				menu.addEventListener(MenuEvent.ITEM_CLICK, menuItemSelected); //右键菜单的事件
				var point:Point = new Point(rightClickTarget.x + rightClickTarget.mouseX, rightClickTarget.y + rightClickTarget.mouseY);
				point = FlexGlobals.topLevelApplication.localToGlobal(point);
				menu.show(point.x, point.y); //显示右键菜单
			}
		}

		//生成菜单项
		private function createMenuItems():Array
		{
			var menuItems:Array = new Array();
			var menuItem:Object;
			for each (var item:ContextMenuItem in(rightClickMenuOwner as InteractiveObject).contextMenu.customItems)
			{
				menuItem = new Object();
				menuItem.label = item.caption; //菜单项名称
				//menuItem.itemIcon = this.menu_SX;//菜单项图标

				var subMenuItems:Array = new Array();
				var submenuItem:Object = new Object();
				submenuItem.label = "子菜单1";
				subMenuItems.push(submenuItem);

				submenuItem = new Object();
				submenuItem.label = "子菜单2";
				subMenuItems.push(submenuItem);

				menuItem.children = subMenuItems;

				menuItems.push(menuItem);
			}



			return menuItems;
		}

		//事件响应
		private function menuItemSelected(event:MenuEvent):void
		{
			var menuItem:Object = event.menu.selectedItem as Object;

			var label:String = menuItem.label;
			var selectItem:ContextMenuItem;
			for each (var item:ContextMenuItem in(rightClickMenuOwner as InteractiveObject).contextMenu.customItems)
			{
				if (item.caption == label)
				{
					selectItem = item;
				}
			}

			if (selectItem != null)
			{
				var e:ContextMenuEvent = new ContextMenuEvent(ContextMenuEvent.MENU_ITEM_SELECT, true, false, selectTarget as InteractiveObject, rightClickMenuOwner as InteractiveObject);
				selectItem.dispatchEvent(e);
			}
		}

		//初始化
		public function regist():Boolean
		{
			if (ExternalInterface.available)
			{
				ExternalInterface.call(javascript, ExternalInterface.objectID);
				ExternalInterface.addCallback("rightClick", dispatchRightClickEvent);
				FlexGlobals.topLevelApplication.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
					//Application.application.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
			} // end if
			return true;
		}

		private function mouseOverHandler(event:MouseEvent):void
		{
			rightClickTarget = InteractiveObject(event.target);
			return;
		}

		private function dispatchRightClickEvent():void
		{
			var event:ContextMenuEvent;
			if (rightClickTarget != null)
			{
				event = new ContextMenuEvent(RIGHT_CLICK, true, false, rightClickTarget as InteractiveObject, rightClickTarget as InteractiveObject);
				rightClickTarget.dispatchEvent(event);
			} // end if
			return;
		}

	}
}