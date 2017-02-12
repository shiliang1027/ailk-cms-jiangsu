package com.linkage.module.cms.common
{
	import flash.utils.clearInterval;
	import flash.utils.setInterval;

	import mx.effects.Glow;

	public class GlowAnimal
	{
		private var _color:uint;
		private var _interval:uint=0;
		private var _delayTime:uint=500;
		private var _times:uint;
		private var _glowTimes:uint=0;
		private var isShowLight:Boolean=false;
		private var _glow:Glow=new Glow();
		private var _unglow:Glow=new Glow();
		private var _target:Array;

		public function GlowAnimal(target:Array, color:uint=0xff0000, times:uint=0, delayTime:uint=500)
		{
			_target=target;
			_color=color;
			_times=times;
			_delayTime=delayTime;
			_glow.duration=_delayTime;
			_glow.alphaFrom=1.0;
			_glow.alphaTo=0.5;
			_glow.blurXFrom=0.0;
			_glow.blurXTo=35.0;
			_glow.blurYFrom=0.0;
			_glow.blurYTo=35.0;
			_glow.color=_color;
			_unglow.duration=_delayTime;
			_unglow.alphaFrom=0.5;
			_unglow.alphaTo=1.0;
			_unglow.blurXFrom=35.0;
			_unglow.blurXTo=0.0;
			_unglow.blurYFrom=35.0;
			_unglow.blurYTo=0.0;
			_unglow.color=_color;
		}


		public function startShine():void
		{
			isShowLight=true;
			if(_interval==0){
				_interval=setInterval(switchGlow, _delayTime);
			}
		}

		public function stopShine():void
		{
			isShowLight=false;
			if(_interval!=0){
				clearInterval(_interval);
			}
		}

		private function switchGlow():void
		{
			if (_times != 0 && _glowTimes == _times * 2)
			{
				stopShine();
				return;
			}
			if (isShowLight)
			{
				glow();
				isShowLight=false;
			}
			else
			{
				unGlow();
				isShowLight=true;
			}
			_glowTimes++;
		}

		private function glow():void
		{
			_glow.play(_target);
		}

		private function unGlow():void
		{
			_unglow.play(_target);
		}
	}
}