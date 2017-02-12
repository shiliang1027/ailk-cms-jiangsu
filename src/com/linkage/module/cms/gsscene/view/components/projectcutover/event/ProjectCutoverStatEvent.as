package com.linkage.module.cms.gsscene.view.components.projectcutover.event
{
    import flash.events.Event;

    public class ProjectCutoverStatEvent extends Event
    {

        public var param:Object = {};

        public function ProjectCutoverStatEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }


        public static const LOAD_PROJECTCUTOVER_DATA:String = "LOAD_PROJECTCUTOVER_DATA";
        public static const LOAD_PROJECTCUTOVER_DATA_SUCC:String = "LOAD_PROJECTCUTOVER_DATA_SUCC";
        public static const LOAD_PROJECTCUTOVER_DETAILS_DATA:String = "LOAD_PROJECTCUTOVER_DETAILS_DATA";
        public static const LOAD_PROJECTCUTOVER_DETAILS_DATA_SUCC:String = "LOAD_PROJECTCUTOVER_DETAILS_DATA_SUCC";
    }
}
