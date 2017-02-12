package com.linkage.module.cms.groupclient.components
{
	import com.linkage.module.cms.common.GlowAnimal;
	
	import mx.controls.Image;
	
	import spark.components.Button;
	
	public class AlarmNumPrompt extends Button
	{
		[SkinPart(required="false")]
		public var bgImage:Image;
		private var _source:Object;
		private var _maxseverity:Number;
		private var _cityId:String;
		private var _glow:GlowAnimal;
		public function AlarmNumPrompt()
		{
			super();
			setStyle("skinClass",AlarmNumPromptSkin);
		}

		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			if(instance == bgImage){
				bgImage.source = _source;
			}
		}
		
		public function get source():Object{
			return _source;
		}
		
		public function set source(value:Object):void{
			this._source = value;
		}
		
		public function get maxseverity():Number{
			return _maxseverity;
		}
		public function set maxseverity(value:Number):void{
			_maxseverity = value;
		}
		public function get cityId():String{
			return _cityId;
		}
		public function set cityId(value:String):void{
			_cityId = value;
		}
		
		public function get glow():GlowAnimal
		{
			return _glow;
		}
		
		public function set glow(value:GlowAnimal):void
		{
			_glow = value;
		}

		public function startGlow():void{
			glow.startShine();
		}
	}
}