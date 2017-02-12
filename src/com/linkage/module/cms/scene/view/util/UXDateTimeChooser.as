package com.linkage.module.cms.scene.view.util
{
	import flash.events.FocusEvent;
	
	import mx.controls.Alert;
	import mx.controls.DateChooser;
	import mx.controls.HRule;
	import mx.controls.Label;
	import mx.controls.NumericStepper;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.NumericStepperEvent;
	import mx.formatters.DateFormatter;
	

	public class UXDateTimeChooser extends DateChooser
	{
		private var hrule:HRule;
		
		private static var dateFormatter:DateFormatter = new DateFormatter();
		dateFormatter.formatString="YYYY-MM-DD JJ:NN:SS";
		
		private var houreNS:NumericStepper;
		private var houreLabel:Label;
		private var minuteNS:NumericStepper;
		private var minuteLabel:Label;
		private var secondNS:NumericStepper;
		
		private var _stepperChangeCallBack:Function;

		[Bindable]
		private var startTime:uint = 0;
		[Bindable]
		private var startHoure:uint = 0;
		[Bindable]
		private var startSecond:uint = 0;

		[Bindable]
		private var dateMs:Date = new Date();

		public function UXDateTimeChooser()
		{
			super();
			this.width = 180;
			this.height = 260;
			this.setStyle("paddingBottom", 30);
		}
			
		override public function get selectedDate():Date
		{
			var d:Date = (super.selectedDate) ? super.selectedDate : dateMs;
			if (houreNS && minuteNS)
			{
				d.hours = (houreNS.value >= 0) ? houreNS.value : dateMs.getHours();
				d.minutes = (minuteNS.value >= 0) ? minuteNS.value : dateMs.getMinutes();
				d.seconds = (secondNS.value >= 0) ? secondNS.value : dateMs.getSeconds();
			}
			super.selectedDate = d;
			return d;
		}

		public function ShowTime(timeStr:String):void
		{
			if(dateFormatter.format(timeStr) == "")
			{
				var _d:Date = new Date();
				startHoure = _d.hours;
				startTime = _d.minutes;
				startSecond = _d.seconds;
				if (houreNS)
					houreNS.value = startHoure;
				if (minuteNS)
					minuteNS.value = startTime;
				if (secondNS)
					secondNS.value = startSecond;
			}
			else
			{
				if (houreNS)
					houreNS.value = timeStr.split(' ')[1].toString().split(':')[0];
				if (minuteNS)
					minuteNS.value = timeStr.split(' ')[1].toString().split(':')[1];
				if (secondNS)
					secondNS.value = timeStr.split(' ')[1].toString().split(':')[2];
			}
		}

		override public function set selectedDate(value:Date):void
		{
			if (value)
			{
				super.selectedDate = value;
				dateMs.hours = value.getHours();
				dateMs.minutes = value.getMinutes();
				dateMs.seconds = value.getSeconds();
			}
		}

		private function feedBackStr(e:NumericStepperEvent):void
		{
			var d:Date = (super.selectedDate) ? super.selectedDate : dateMs;
			if (houreNS && minuteNS)
			{
				d.hours = (houreNS.value >= 0) ? houreNS.value : dateMs.getHours();
				d.minutes = (minuteNS.value >= 0) ? minuteNS.value : dateMs.getMinutes();
				d.seconds = (secondNS.value >= 0) ? secondNS.value : dateMs.getSeconds();
			}
			
			_stepperChangeCallBack.call(null, dateFormatter.format(d));
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			//实时时间初始化
			initDateMS();

			if (!houreNS)
			{
				houreNS = new NumericStepper();
				houreNS.maximum = 23;
				houreNS.minimum = 0;
				houreNS.stepSize = 1;
				houreNS.value = startHoure;
				addChild(houreNS);
				
				houreNS.addEventListener(NumericStepperEvent.CHANGE, feedBackStr);

			}
			if (!minuteNS)
			{
				minuteNS = new NumericStepper();
				minuteNS.maximum = 59;
				minuteNS.minimum = 0;
				minuteNS.stepSize = 1;
				minuteNS.value = startTime;
				addChild(minuteNS);
				
				minuteNS.addEventListener(NumericStepperEvent.CHANGE, feedBackStr);
			}
			if (!secondNS)
			{
				secondNS = new NumericStepper();
				secondNS.maximum = 59;
				secondNS.minimum = 0;
				secondNS.stepSize = 1;
				secondNS.value = startSecond;
				addChild(secondNS);
				
				secondNS.addEventListener(NumericStepperEvent.CHANGE, feedBackStr);
			}

			if (!houreLabel)
			{
				houreLabel = new Label();
				houreLabel.setStyle("fontSize", 13);
				houreLabel.setStyle("fontWeight", "bold");
				houreLabel.text = ":";
				addChild(houreLabel);
			}
			if (!minuteLabel)
			{
				minuteLabel = new Label();
				minuteLabel.setStyle("fontSize", 13);
				minuteLabel.setStyle("fontWeight", "bold");
				minuteLabel.text = ":";
				addChild(minuteLabel);
			}

			if (!hrule)
			{
				hrule = new HRule();
				addChild(hrule);
			}
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			var borderThickness:Number = getStyle("borderThickness");
			var cornerRadius:Number = getStyle("cornerRadius");
			var borderColor:Number = getStyle("borderColor");

			var w:Number = unscaledWidth - borderThickness * 2;
			var h:Number = unscaledHeight - borderThickness * 2;
			var _h:Number = h - 25;
			secondNS.setActualSize(45, 20);
			secondNS.move(w - 50, _h);

			minuteLabel.setActualSize(14, 20);
			minuteLabel.move(secondNS.x - 13, _h);
			minuteNS.setActualSize(45, 20);
			minuteNS.move(minuteLabel.x - 48, _h);

			houreLabel.setActualSize(14, 20);
			houreLabel.move(minuteNS.x - 13, _h);
			houreNS.setActualSize(45, 20);
			houreNS.move(houreLabel.x - 48, _h);

			hrule.setActualSize(170, 2);
			hrule.move(5, _h - 5);
		}

		private function initDateMS():void
		{

			startTime = dateMs.getMinutes();
			startHoure = dateMs.getHours();
			startSecond = dateMs.getSeconds();
		}

		public function set stepperChangeCallBack(value:Function):void
		{
			_stepperChangeCallBack = value;
		}


	}
}