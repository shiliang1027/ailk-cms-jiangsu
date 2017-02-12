package com.linkage.module.cms.perfmonitor.monitor.alarm.common
{
	import flash.text.TextField;

	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.core.IFactory;
	import mx.events.DropdownEvent;

	public class UXDateField extends DateField
	{
		private var _value:Date;
		private var isShowTime:Boolean=false;

		public function UXDateField()
		{
			super();
			this.setStyle("paddingBottom", 30);
			this.dropdownFactory=new ClassFactory(UXDateTimeChooser);
			this.addEventListener(DropdownEvent.CLOSE, my_Close);
			this.addEventListener(DropdownEvent.OPEN, my_Open);
		}

		private function my_Open(e:DropdownEvent):void
		{
			if (isShowTime)
			{
				(this.dropdown as UXDateTimeChooser).ShowTime(_value);
				isShowTime=false;
			}
		}

		private function my_Close(e:DropdownEvent):void
		{
			if (stage)
			{
				if (stage.focus)
				{
					if (stage.focus is TextField)
					{
						e.stopImmediatePropagation();
						e.stopPropagation();
						this.open();
					}
				}
			}
		}

		override public function set selectedDate(value:Date):void
		{
			isShowTime=true;
			_value=value;
			super.selectedDate=value;
		}

		override public function get selectedDate():Date
		{
			if (isShowTime)
			{
				return _value;
			}
			return (this.dropdown as UXDateTimeChooser).selectedDate;
		}

	}
}