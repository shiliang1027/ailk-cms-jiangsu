package com.linkage.module.cms.topo.util
{
	import com.linkage.module.cms.topo.event.LinkMoveEvent;
	import com.linkage.module.topo.framework.core.model.element.point.ITPPoint;
	import com.linkage.module.topo.framework.view.component.TopoCanvas;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	
	import flash.display.Graphics;
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.Image;
	import mx.events.EffectEvent;
	
	import spark.components.Group;
	import spark.effects.Move;
	
	public class LinkMove
	{
		private var logger:ILogger = Log.getLoggerByClass(LinkMove);
		private var _opt:*;
		private var _eidsL:Array;
		private var _topoCanvas:TopoCanvas;
		private var _move:Move;
		private var _index:uint=0;
		private var _params:*;
		private var _groupX:Group;
		private var _group:Group;
		private var _pointXY:Array;
		private var _color:uint;
		private var _topoCanvasParent:Group;
		
		private var _img:Image = new Image();
		[Embed(source="/com/linkage/module/cms/topo/assets/images/Catch.png")]
		public static  var catchIcon:Class;
		
		[Embed(source="/com/linkage/module/cms/topo/assets/images/Catch94E2.png")]
		public static  var catch94E2Icon:Class;
		
		
		public function LinkMove(opt:*,topoCanvas:TopoCanvas)
		{
			this._opt = opt;
			this._eidsL = String(opt.eids).split(",");
			this._topoCanvas = topoCanvas;
//			this._topoCanvasParent = topoCanvas.parent as Group;
			this._params = parseParams(opt.params);
			this._group = new Group();
			this._groupX = new Group();
			this._img.source  =  catchIcon;
			this._img.width = 14;
			this._img.height = 14;
			this._img.x = -7;
			this._img.y=-7;
			this._img.alpha = 1;
			this._pointXY = new Array();
			this._color= 0xff0000;
			if(this._params.color){
				this._color = uint(this._params.color);
			}
			if(this._params.image && this._params.image=="1"){
				this._img.source  =  catch94E2Icon;
			}
			var size:uint = 10;
			if(this._params.size){
				size = uint(this._params.size);
			}
			if(_opt.flag){
				this._topoCanvas.addEventListener(LinkMoveEvent.MOVEEND,moveend);
			}
			this._group.visible=false;
			this._groupX.visible=false;
			this._group.addElement(this._img);
			this._topoCanvas.addElement(this._group);
			this._topoCanvas.addElementAt(this._groupX,0);
			for (var i:Number = 0; i < this._eidsL.length - 1; i++) {
				drawCirclePoint(this._groupX.graphics,_eidsL[i],_eidsL[i+1]);
			}
			this._move = new Move();
			this._move.target = this._group;
			this._move.duration=100;
			this._move.addEventListener(EffectEvent.EFFECT_END,function(event:EffectEvent):void{
				if(_index<_pointXY.length-2){
					_index++;
					play();
				}else{
					_index=0;
					_group.x= _group.y=0;
					_group.visible=false;
					_groupX.visible=false;
					if(!_opt.flag){
						play();
					}else{
						_topoCanvas.dispatchEvent(new LinkMoveEvent(LinkMoveEvent.MOVEEND,_opt));
					}
				}
			});
			if(!this._opt.parentid || this._opt.parentid=="" || this._opt.parentid=="-1"){
				play();
			}
		}
		
		private function moveend(event:LinkMoveEvent):void{
//			logger.info("moveend:{0}",event);
			if(this._opt.parentid === event.param.id){
				play();
			}else if(this._opt.id===event.param.parentid){
				play();
			}
		}  
		
//		//暂停
//		public function pause():void{
//			this._move.pause();
//		}
//		public function resume():void{
//			this._move.resume();
//		}
//		
		public function play():void{
			if(!this._move){
				return;
			}
			if(this._pointXY.length == 0){
				return;
			}
			this._group.visible=true;
			this._groupX.visible=true;
			var fromPoint:Object = _pointXY[_index];
			var toPoint:Object = _pointXY[_index + 1];
			this._move.xFrom = fromPoint.x;
			this._move.yFrom = fromPoint.y;
			this._move.xTo = toPoint.x;
			this._move.yTo = toPoint.y;
			this._move.play();
		}
		
		private function parseParams(value:String):*{
			var params:*={};
			var values:Array = value.split(",");
			for(var i:uint=0;i<values.length;i++){
				var p:Array = String(values[i]).split("=");
				params[p[0]]=[p[1]];
			}
			return params;
		}
		public function drawCirclePoint(g:Graphics,from:*,to:*):void{
			var fromElement:ITPPoint = _topoCanvas.findElementById(String(from)) as ITPPoint;
			var fromPoint:Point =  _topoCanvas.xyToLocal(fromElement.feature, fromElement.x, fromElement.y);
			var toElement:ITPPoint = _topoCanvas.findElementById(String(to)) as ITPPoint;
			var toPoint:Point =  _topoCanvas.xyToLocal(toElement.feature, toElement.x, toElement.y);
			
			var newCenter:Object = getNewCenter(fromPoint,toPoint);
			var rL:Number = newCenter.r;
			var rS:Number = rL;
			var x0:Number = newCenter.x;
			var y0:Number = newCenter.y;
			var alpa:Number = 600/rL;
			//计算起始角度
			var alpaFrom:Number = Math.acos((fromPoint.x-x0)/rL)*180/3.14;//90度
			if(y0 < fromPoint.y){
					alpaFrom = -1*alpaFrom;
			}
			//计算终止角度
			var alpaTo:Number = Math.acos((toPoint.x-x0)/rL)*180/3.14;
			if(y0 < toPoint.y){
				alpaTo = -1 * alpaTo;
			}
			if(alpaFrom < alpaTo){
				alpaFrom = alpaFrom + 360;
			}
			for(var i:Number = alpaFrom; i > alpaTo;i-= alpa){
				var x11:Number = x0 + rL*1*Math.cos(i*3.14/180);
				var y11:Number = y0 - rS*1*Math.sin(i*3.14/180);
				this._pointXY.push({x:x11,y:y11});
				this._groupX.graphics.beginFill(this._color);
				this._groupX.graphics.drawCircle(x11,y11,1.5);
				this._groupX.graphics.endFill();
			}
		}
		//获取虚拟中心坐标
		public function getNewCenter(objA:Object,objB:Object):Object{
			var result:Object = new Object();
			var r:Number = Math.sqrt(Math.pow(objA.x - objB.x,2)+Math.pow(objA.y - objB.y,2))/2;
			var x0:Number = (objA.x+ objB.x)/2;
			var y0:Number = (objA.y+ objB.y)/2;
			var alpaa:Number = Math.acos((objA.x-x0)/r)*180/3.14;//90度
			if(y0 < objA.y){
				alpaa = -1 * alpaa;
			}
			var i:Number = alpaa + 90 + 180;
			var x11:Number = x0 - 4*r*1*Math.cos(i*3.14/180);
			var y11:Number = y0 + 4*r*1*Math.sin(i*3.14/180);
			var rNew:Number = r*Math.sqrt(17);
//			this._groupX.graphics.beginFill(this._color);
//			this._groupX.graphics.drawCircle(x11,y11,10);
//			this._groupX.graphics.endFill();
			result.x = x11;
			result.y = y11;
			result.r = rNew;
			return result;
		}
		
		
		
		public function destroy():void{
			if(this._move){
				this._move.end();
				this._move = null;
			}
			if(this._topoCanvas.contains(this._group)){
				this._topoCanvas.removeElement(this._group);
			}
			if(this._topoCanvas.contains(this._groupX)){
				this._topoCanvas.removeElement(this._groupX);
			}
			this._group = null;
			this._groupX = null;
			this._topoCanvas.removeEventListener(LinkMoveEvent.MOVEEND,moveend);
		}
	}
}