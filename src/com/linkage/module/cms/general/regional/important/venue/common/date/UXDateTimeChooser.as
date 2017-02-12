package com.linkage.module.cms.general.regional.important.venue.common.date
{
	import mx.controls.DateChooser;
	import mx.controls.HRule;
	import mx.controls.Label;
	import mx.controls.NumericStepper;

	public class UXDateTimeChooser extends DateChooser
	{
		private var minuteNS:NumericStepper;
		private var minuteLabel:Label;
		private var houreNS:NumericStepper;
		private var houreLabel:Label;
		private var secondNS:NumericStepper;

		private var hrule:HRule;

		[Bindable]
		private var startTime:uint=0;
		[Bindable]
		private var startHoure:uint=0;
		[Bindable]
		private var startSecond:uint=0;

		[Bindable]
		private var dateMs:Date=new Date();

		public function UXDateTimeChooser()
		{
			super();
			this.width=180;
			this.height=260;
			this.setStyle("paddingBottom", 30);
		}

		override public function get selectedDate():Date
		{
			//			var d:Date = (super.selectedDate) ? super.selectedDate : new Date();
			var d:Date=(super.selectedDate) ? super.selectedDate : dateMs;
			if (houreNS && minuteNS)
			{
				d.hours=(houreNS.value) ? houreNS.value : dateMs.getHours();
				d.minutes=(minuteNS.value) ? minuteNS.value : dateMs.getMinutes();
				d.seconds=(secondNS.value) ? secondNS.value : dateMs.getSeconds();
			}
			super.selectedDate=d;
			return d;
		}

		public function ShowTime(_d:Date):void
		{
			if (_d)
			{
				startTime=_d.minutes;
				startHoure=_d.hours;
				startSecond=_d.seconds;
				if (minuteNS)
					minuteNS.value=startTime;
				if (houreNS)
					houreNS.value=startHoure;
				if (secondNS)
					secondNS.value=startSecond;
			}
		}

		override public function set selectedDate(value:Date):void
		{
			if (value)
			{
				super.selectedDate=value;
			}
		}

		override protected function createChildren():void
		{
			super.createChildren();
			//实时时间初始化

			initDateMS();

			if (!houreNS)
			{
				houreNS=new NumericStepper();
				houreNS.maximum=23;
				houreNS.minimum=0;
				houreNS.stepSize=1;
				houreNS.value=startHoure;
				addChild(houreNS);

			}
			if (!minuteNS)
			{
				minuteNS=new NumericStepper();
				minuteNS.maximum=59;
				minuteNS.minimum=0;
				minuteNS.stepSize=1;
				minuteNS.value=startTime;
				addChild(minuteNS);
			}
			if (!secondNS)
			{
				secondNS=new NumericStepper();
				secondNS.maximum=59;
				secondNS.minimum=0;
				houreNS.stepSize=1;
				secondNS.value=startSecond;
				addChild(secondNS);
			}

			if (!houreLabel)
			{
				houreLabel=new Label();
				houreLabel.setStyle("fontSize", 13);
				houreLabel.setStyle("fontWeight", "bold");
				houreLabel.text=":";
				addChild(houreLabel);
			}
			if (!minuteLabel)
			{
				minuteLabel=new Label();
				minuteLabel.setStyle("fontSize", 13);
				minuteLabel.setStyle("fontWeight", "bold");
				minuteLabel.text=":";
				addChild(minuteLabel);
			}

			if (!hrule)
			{
				hrule=new HRule();
				addChild(hrule);
			}
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			var borderThickness:Number=getStyle("borderThickness");
			var cornerRadius:Number=getStyle("cornerRadius");
			var borderColor:Number=getStyle("borderColor");

			var w:Number=unscaledWidth - borderThickness * 2;
			var h:Number=unscaledHeight - borderThickness * 2;
			var _h:Number=h - 25;
			secondNS.setActualSize(40, 20);
			secondNS.move(w - 50, _h);

			minuteLabel.setActualSize(14, 20);
			minuteLabel.move(secondNS.x - 16, _h);
			minuteNS.setActualSize(40, 20);
			minuteNS.move(minuteLabel.x - 40, _h);

			houreLabel.setActualSize(14, 20);
			houreLabel.move(minuteNS.x - 16, _h);
			houreNS.setActualSize(40, 20);
			houreNS.move(houreLabel.x - 40, _h);

			hrule.setActualSize(170, 2);
			hrule.move(5, _h - 5);


		}

		private function initDateMS():void
		{

			startTime=dateMs.getMinutes();
			startHoure=dateMs.getHours();
			startSecond=dateMs.getSeconds();
		}

	}
}