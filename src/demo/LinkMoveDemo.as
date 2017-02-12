package demo
{
	import com.linkage.module.topo.framework.core.model.element.point.ITPPoint;
	import com.linkage.module.topo.framework.view.component.TopoCanvas;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.controls.Image;
	import mx.events.EffectEvent;
	
	import spark.components.Group;
	import spark.effects.Move;

	public class LinkMoveDemo
	{
		private var logger:ILogger = Log.getLoggerByClass("com.linkage.module.cms.topo.LinkMoveDemo");
		private var _opt:*;
		private var _eidsL:Array;
		private var _topoCanvas:TopoCanvas;
		private var move:Move;
		private var _index:uint=0;
		private var _params:*;
		private var _groupX:Group;
		private var _group:Group;
		private var _pointXY:ArrayCollection;
		private var _color:uint;
		
		private var _img:Image = new Image();
		[Embed(source="/com/linkage/module/cms/topo/assets/images/Catch.png")]
		public static  var catchIcon:Class;
		
		[Embed(source="/com/linkage/module/cms/topo/assets/images/Catch94E2.png")]
		public static  var catch94E2Icon:Class;
		
		
		public function LinkMoveDemo(opt:*,topoCanvas:TopoCanvas)
		{
			this._opt = opt;
			this._eidsL = String(opt.eids).split(",");
			this._topoCanvas = topoCanvas;
			this._params = parseParams(opt.params);
			this._group = new Group();
			this._groupX = new Group();
			this._img.source  =  catchIcon;
			this._img.width = 14;
			this._img.height = 14;
			this._img.x = -7;
			this._img.y=-7;
			this._img.alpha = 1;
			this._pointXY = new ArrayCollection();
			this._color= 0xff0000;
			if(this._params.color){
				this._color = uint(this._params.color);
			}
			
			
			for (var i:Number = 0; i < this._eidsL.length - 1; i++) {
				drawCirclePoint(this._groupX.graphics,_eidsL[i],_eidsL[i+1]);
//				break;
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
			this._group.addElement(this._img);
			topoCanvas.addElement(this._group);
			topoCanvas.addElement(this._groupX);
			move = new Move();
			move.target = this._group;
			move.duration=10;
			move.addEventListener(EffectEvent.EFFECT_END,function(event:EffectEvent):void{
				if(_index<_pointXY.length-2){
					_index++;
					move.startDelay=0;
					play();
				}else{
					_index=0;
					move.startDelay=0;
					_group.x=_group.y=0;
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
			if(this._opt.parentid === event.param.id){
				play();
			}else if(this._opt.id===event.param.parentid){
				play();
			}
		}  
		public function play():void{
			var fromPoint:Object = _pointXY[_index];
			var toPoint:Object = _pointXY[_index + 1];
			move.xFrom = fromPoint.x;
			move.yFrom = fromPoint.y;
			move.xTo = toPoint.x;
			move.yTo = toPoint.y;
			move.play();
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
//		private var color:uint = 0xff0000;
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
				alpaFrom = 360-alpaFrom;
			}
			//计算终止角度
			var alpaTo:Number = Math.acos((toPoint.x-x0)/rL)*180/3.14;
			if(y0 < toPoint.y){
				alpaTo = 360-alpaTo;
			}
			if(alpaFrom > alpaTo){
				alpaFrom = alpaFrom - 360;
			}
			for(var i:Number = alpaFrom; i < alpaTo;i+= alpa){
				var x11:Number = x0 + rL*1*Math.cos(i*3.14/180);
				var y11:Number = y0 - rS*1*Math.sin(i*3.14/180);
				this._pointXY.addItem({x:x11,y:y11});
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
			var i:Number = alpaa + 90;
			var x11:Number = x0 - 4*r*1*Math.cos(i*3.14/180);
			var y11:Number = y0 + 4*r*1*Math.sin(i*3.14/180);
			var rNew:Number = r*Math.sqrt(17);
//			this._groupX.graphics.beginFill(color);
//			this._groupX.graphics.drawCircle(x11,y11,10);
//			this._groupX.graphics.endFill();
			result.x = x11;
			result.y = y11;
			result.r = rNew;
			return result;
		}
	}
}