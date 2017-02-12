package com.linkage.module.cms.perfmonitor.common
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Mouse;
	
	import mx.controls.Alert;
	import mx.controls.ComboBox;
	import mx.core.ClassFactory;
	import mx.events.DropdownEvent;
	import mx.events.FlexEvent;
	import mx.events.ListEvent;
	

	public class MultiSelectComboBox extends ComboBox
	{
		private var mouseOut:Boolean=false;
		public var promptText:String=null;
		private var changeEvent:ListEvent;
		
		public var dpHeight:Number = -10;
		
		private var showDropDownFlag:Boolean = false;
		
		private var _selectedArray:Array=new Array();
		
		private var _promptDefault:String = "请选择";
		
		public function MultiSelectComboBox()
		{
			super();
			this.addEventListener(FlexEvent.CREATION_COMPLETE, onCreateCompleteHandle);
			this.addEventListener(DropdownEvent.OPEN, onOpen);
			
			this.itemRenderer=new ClassFactory(CheckBoxItemRenderer);
		}
		
		private function onCreateCompleteHandle(event:FlexEvent):void
		{
			dropdown.allowMultipleSelection=true;
			resetPrompt();
		}
		
		private function onOpen(event:DropdownEvent):void
		{
			if (dropdown)
			{
				dropdown.selectedItems=_selectedArray;
			}
		}
		
		public function set selectedItems(value:Array):void
		{
			if (dropdown)
			{
				dropdown.selectedItems=value;
			}
		}
		
		public function get selectedItems():Array
		{
			return dropdown ? dropdown.selectedItems : [];
		}
		
		public function set selectedIndices(value:Array):void
		{
			if (dropdown)
				dropdown.selectedIndices=value;
		}
		
		[Bindable("change")]
		public function get selectedIndices():Array
		{
			return dropdown ? dropdown.selectedIndices : [];
		}
		
		override public function close(trigger:Event=null):void
		{
			_selectedArray=selectedItems;
			resetPrompt();
		}
		
		override protected function focusOutHandler(event:FocusEvent):void
		{
			super.focusOutHandler(event);
			resetPrompt();
			showDropDownFlag = false;
			super.close();
		}
		
		override public function set prompt(value:String):void
		{
			promptText=value;
		}
		
		override protected function downArrowButton_buttonDownHandler(
			event:FlexEvent):void
		{
			
			super.downArrowButton_buttonDownHandler(event);
			if(showDropDownFlag)
				super.close();
			
			resetPrompt();
			showDropDownFlag = !showDropDownFlag;
		}
		
		public function set selectedArray(arr:Array):void
		{
			for each(var item:Object in _selectedArray)
			{
				item.selected=false;
			}
			
			_selectedArray = arr;
			
//			selectedItems = _selectedArray;
			if (dropdown)
			{
				dropdown.selectedItems=_selectedArray;
			}
			
			resetPrompt();
			for each(var item:Object in _selectedArray)
			{
				item.selected=true;
			}
		}
		
		public function resetPrompt():void{
			if (_selectedArray.length > 0)
			{
				var temp:String = "";
				for each(var item:Object in _selectedArray)
				{
					temp += item['label'] + " ";
				}
				
				promptText = temp;
			}
			else
			{
				promptText = promptDefault;
			}
			this.textInput.text=promptText;
			
			if(dpHeight >0)
				dropdown.height = dpHeight;
		}

		public function get promptDefault():String
		{
			return _promptDefault;
		}

		public function set promptDefault(value:String):void
		{
			_promptDefault = value;
		}

		public function get selectedArray():Array
		{
			return _selectedArray;
		}
	}
}