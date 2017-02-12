package demo
{
	import flash.events.Event;
	
	public class LinkMoveEvent extends Event
	{
		
		public static var MOVEEND:String = "MOVEEND";
		public var param:*;
		public function LinkMoveEvent(type:String, _param:*)
		{
			this.param = _param;
			super(type, false, false);
		}
	}
}