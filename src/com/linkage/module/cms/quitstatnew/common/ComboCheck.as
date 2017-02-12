/*
 * ComboCheck
 * v1.5.01
 * Arcadio Carballares Martín, 2011
 * http://www.arcadiocarballares.es
 * Creative Commons - http://creativecommons.org/licenses/by-sa/2.5/es/deed.en_GB
 */
package com.linkage.module.cms.quitstatnew.common
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;

	import mx.collections.IList;
	import mx.controls.CheckBox;
	import mx.controls.TextInput;
	import mx.core.mx_internal;
	import mx.events.CollectionEvent;
	import mx.events.ItemClickEvent;

	import spark.components.ComboBox;
	import spark.components.DataGroup;
	import spark.events.DropDownEvent;

	use namespace mx_internal;

	[Event("addItem", type="flash.events.Event")]
	[Event("removeItem", type="flash.events.Event")]

	public class ComboCheck extends ComboBox
	{

		private var _selectedItems:Vector.<Object>;

		public function ComboCheck()
		{
			super();
			setStyle("skinClass", ComboCheckSkin);
			addEventListener(ItemClickEvent.ITEM_CLICK, onItemClick);
		}



		override public function set dataProvider(value:IList):void
		{
			super.dataProvider = value;

			// Load initial selected items
			selectedItems = new Vector.<Object>;

			for each (var item:Object in dataProvider)
			{
				if (item.selected)
				{
					selectedItems.push(item);
				}
			}
		}

		[Bindable("change")]
		[Bindable("valueCommit")]
		[Bindable("collectionChange")]
		override public function set selectedItems(value:Vector.<Object>):void
		{
			_selectedItems = value;
		}

		override public function get selectedItems():Vector.<Object>
		{
			return _selectedItems;
		}

		override protected function keyDownHandler(event:KeyboardEvent):void
		{
			super.keyDownHandler(event);
			if (event.keyCode == Keyboard.ENTER && isDropDownOpen)
			{

				var currentItem:Object = getItem(textInput.text);

				if (currentItem != null)
				{
					currentItem.selected = !currentItem.selected;
					var e:ItemClickEvent = new ItemClickEvent(ItemClickEvent.ITEM_CLICK, true);
					e.item = currentItem;
					dispatchEvent(e);

					// Update items
					dataGroup.dataProvider.itemUpdated(currentItem, null, currentItem, e.item);
				}

			}
			trace(selectedItem);
		}

		override protected function capture_keyDownHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ENTER)
			{
				return;
			}
			super.capture_keyDownHandler(event);
		}

		private function getItem(text:String):Object
		{
			for each (var item:Object in dataProvider)
			{
				if (item[labelField] == text)
					return item;
			}

			return null;
		}

		override protected function item_mouseDownHandler(event:MouseEvent):void
		{
			trace(event);
		}

		private function onItemClick(event:ItemClickEvent):void
		{
			trace("item checked!");
			if (event.item.selected)
			{
				selectedItems.push(event.item);
				dispatchEvent(new Event("addItem"));
			}
			else
			{
				var index:int = selectedItems.indexOf(event.item);
				selectedItems.splice(index, 1);
				dispatchEvent(new Event("removeItem"));
			}

			dispatchEvent(new Event("valueCommit"));
		}
	}
}