package com.linkage.module.cms.perfmonitornew.colorAlarm
{
	import mx.containers.GridItem;
	import mx.controls.Label;
	import mx.core.IVisualElement;
	import mx.events.FlexEvent;
	import mx.graphics.GradientEntry;
	import mx.graphics.IFill;
	import mx.graphics.LinearGradient;
	
	import spark.components.Group;
	import spark.primitives.Rect;
	import spark.primitives.supportClasses.FilledElement;
	
	public class TitleGridItem extends GridItem
	{
		private var _cornerRadius:Number = 0;
		private var group:Group = new Group();
		public function TitleGridItem()
		{
			super();
			this.addEventListener(FlexEvent.CREATION_COMPLETE,setStyles);
			this.setStyle("verticalAlign", "middle");
			this.setStyle("horizontalAlign","center");
			this.setStyle("borderColor", "0x404141");
			this.setStyle("borderStyle", "outset");
			this.setStyle("borderAlpha", "0.1");
			this.height = 32;
/*			this.setStyle("cornerRadius",_cornerRadius);*/
		}
	 private function setStyles(event:FlexEvent):void{
//		 var colorArrs:Array = [0X4169E1,0x2453E1,0X0049E1,0x0124E6,0x011FC9];
		 var colorArrs:Array = [0XDBE4EE,0xDBE4EE,0XDBE4EE,0xDBE4EE,0xDBE4EE];
		 group.percentWidth = 100;
		 group.percentHeight = 100;
		 var rect:Rect = new Rect();
		 rect.percentWidth = 100;
		 rect.percentHeight = 100;
		 rect.radiusX = _cornerRadius;
		 rect.radiusY = _cornerRadius;
		 var GradientEntryArrs:Array = [];
		 for(var i:int;i<colorArrs.length;i++){
			 var color:uint = colorArrs[i];
			 var gradientEntry:GradientEntry = new GradientEntry(color,i/(colorArrs.length-1));
			 GradientEntryArrs.push(gradientEntry);
		 }
		 var linearGradient:LinearGradient = new LinearGradient();
		 linearGradient.rotation = 90;
		 linearGradient.entries = GradientEntryArrs;
		 rect.fill = linearGradient;
		 rect.depth = 1;
		 group.addElement(rect);
		 this.addElement(group);
	 }
	 public function set labels(value:Label):void{
		 value.setStyle("verticalCenter", "0");
		 value.setStyle("horizontalCenter", "0");
		 value.depth = 10;
		 group.addElement(value);
		}
	}
}