package com.linkage.module.cms.specialty.alarmSearch.common
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import mx.controls.Alert;
	import mx.controls.ProgressBar;
	import mx.controls.ProgressBarDirection;
	import mx.controls.ProgressBarMode;

	/**
	 *
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-9
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MyProgressBar extends ProgressBar
	{
		private var timer:Timer;
		private var timer1:Timer;

		private var i:int=0;
		private var rand:int=0;
		private var currentValue:int=0;
		[Bindable]
		public var maxTime:int=20;
		private var rate:Number;

		public function MyProgressBar()
		{
			super();
			this.mode=ProgressBarMode.MANUAL;
			this.direction=ProgressBarDirection.RIGHT;
			timer=new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
		}

		private function onTimer(event:TimerEvent):void
		{
			rand=int(Math.random() * rate);
			if (rand == 0)
			{
				rand++;
			}
			currentValue=int(this.value);
			i=0;
			if (currentValue + rand < maximum)
			{
				if (timer1)
				{
					timer1.removeEventListener(TimerEvent.TIMER, onTimer1);
					timer1=null;
				}
				timer1=new Timer(int(rate / 2 / rand));
				timer1.addEventListener(TimerEvent.TIMER, onTimer1);
				timer1.start();
			}
			else
			{
				timer.stop();
					//测试用
//				start();
			}
		}

		private function onTimer1(event:TimerEvent):void
		{
			if (i < rand)
			{
				this.setProgress(currentValue + i, maximum);
				i++;
			}
			else
			{
				timer1.stop();
			}
		}


		public function start():void
		{
			rate=maximum / maxTime;
//			Alert.show("maximum:" + maximum + ",maxTime:" + maxTime + "," + rate);
			this.setProgress(0, maximum);
			if (timer && !timer.running)
			{
				timer.start();
			}
		}

		public function stop():void
		{
			if (timer && timer.running)
			{
				timer.stop();
			}
			if (timer1 && timer1.running)
			{
				timer1.stop();
			}
			this.setProgress(maximum, maximum);
		}
	}
}