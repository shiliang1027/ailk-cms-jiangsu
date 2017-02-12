package com.linkage.module.cms.perfmonitornew.colorAlarm
{
	import mx.containers.GridItem;
	import mx.controls.Label;
	import mx.core.IVisualElement;
	import mx.graphics.GradientEntry;
	import mx.graphics.IFill;
	import mx.graphics.LinearGradient;
	
	import spark.components.Group;
	import spark.primitives.Rect;
	import spark.primitives.supportClasses.FilledElement;
	
	public class ColorAlarmGridItem extends GridItem
	{
		private var _alarmseverity:String = "";//告警级别（一级告警、二级告警、三级告警、四级告警、1,2,3,4）
		private var _cornerRadius:Number = 5;
		private var group:Group = new Group();
		public function ColorAlarmGridItem()
		{
			super();
			this.setStyle("cornerRadius",_cornerRadius);
			this.setStyle("verticalAlign", "middle");
			this.setStyle("horizontalAlign","center");
			this.setStyle("borderStyle", "outset");
			this.setStyle("borderColor", "0x3377D1");
			this.setStyle("borderAlpha", "0.4");
			this.height = 30;
	
		}
		public function set alarmseverity(value:String):void{
			this._alarmseverity = value;
			var colorArrs:Array;
			if("一级告警"==_alarmseverity||"1"==_alarmseverity){//红
				colorArrs = [0XFF0000,0XBD0207,0x773938];
			}else if("二级告警"==_alarmseverity||"2"==_alarmseverity){//橙
				colorArrs = [0XEE9800,0XDD6700,0xB3540C];
			}else if("三级告警"==_alarmseverity||"3"==_alarmseverity){//黄
				colorArrs = [0XFED701,0XE2CA03,0xCAA103];
			}else if("四级告警"==_alarmseverity||"4"==_alarmseverity){//蓝
				colorArrs = [0X4169E1,0X0049E1,0x011DBB];
			}else{//绿
				colorArrs = [0X58EE10,0X52D004,0x51B109];
			}
			
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
			group.addElement(rect);
			this.addElement(group);
		}
		
	 public function set labels(value:Label):void{
		 value.setStyle("verticalCenter", "0");
		 value.setStyle("horizontalCenter", "0");
		 group.addElement(value);
		}
	}
}