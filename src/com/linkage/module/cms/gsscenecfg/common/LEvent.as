package com.linkage.module.cms.gsscenecfg.common
{
    import flash.events.Event;

    public class LEvent extends Event
    {
        public static var CHECKBOXCLICKED:String = "CHECKBOXCLICKED";
        public static var DELETECLICKED:String = "DELETECLICKED";
        public static var EDITCLICKED:String = "EDITCLICKED";
		
		public static var QUERYLIST:String = "QUERYLIST";
		
		public static var TREECHANGE:String = "TREECHANGE";
		
        public var dt:Object;

        public function LEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }
    }
}
