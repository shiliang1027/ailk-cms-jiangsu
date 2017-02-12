package com.linkage.module.cms.scenedaily.view.components.util
{
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.DropdownEvent;

	public class UXDateField extends DateField
	{
		private var isShowTime:Boolean=true;
		private var callBackInit:Boolean=false;

		public function UXDateField()
		{
			super();
			this.setStyle("paddingBottom", 30);
			this.dropdownFactory=new ClassFactory(UXDateTimeChooser);
			this.addEventListener(DropdownEvent.CLOSE, my_Close);
			this.addEventListener(DropdownEvent.OPEN, my_Open);
		}

		private function setTimeStr(str:String):void
		{
			this.text=str;
		}

		private function my_Open(e:DropdownEvent):void
		{
			(this.dropdown as UXDateTimeChooser).ShowTime(this.text);
			if (!callBackInit)
			{
				callBackInit=true;
				(this.dropdown as UXDateTimeChooser).stepperChangeCallBack=setTimeStr;
			}
		}

		private function my_Close(e:DropdownEvent):void
		{
			//不是失去焦点则不关闭选择组建
			if (e.triggerEvent == null)
			{
				e.stopImmediatePropagation();
				e.stopPropagation();
				this.open();
			}

			//关闭前更新日期显示
			this.text=this.labelFunction.call(null, (this.dropdown as UXDateTimeChooser).selectedDate);
		}

		override public function set selectedDate(value:Date):void
		{
			super.selectedDate=value;
		}

		override public function get selectedDate():Date
		{
			return (this.dropdown as UXDateTimeChooser).selectedDate;
		}

	}
}