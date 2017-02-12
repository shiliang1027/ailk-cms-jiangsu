package com.linkage.module.cms.common
{
	import flash.events.MouseEvent;
	
	import mx.controls.Button;
	import mx.core.UIComponent;
	
	public class ExpandButton extends Button
	{
		[Embed(source="assets/expand.png")]
		public static const expand:Class;
		[Embed(source="assets/collapse.png")]
		public static const collapse:Class;
		
		private var _expandTarget:UIComponent;
		
		public function ExpandButton()
		{
			super();
			this.setStyle("cornerRadius",0);
			this.setStyle("textAlign","left");
			this.percentWidth=100;
		}
		
		public function set expandTarget(expandTarget:UIComponent):void{
			this._expandTarget=expandTarget;
			if(expandTarget){
				var isOpen:Boolean=expandTarget.visible;
				this.setStyle("icon",isOpen?expand:collapse);
			}
		}
		
		public function get expandTarget():UIComponent{
			return _expandTarget;
		}
		
		override protected function clickHandler(event:MouseEvent):void{
			super.clickHandler(event);
			if(expandTarget){
				var isOpen:Boolean=!expandTarget.visible;
				expandTarget.visible=isOpen;
				expandTarget.includeInLayout=isOpen;
				this.setStyle("icon",isOpen?expand:collapse);
			}
		}
	}
}