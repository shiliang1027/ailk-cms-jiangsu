package com.linkage.module.cms.scene.domain
{
    import mx.collections.ArrayCollection;

    public class WorstCellPanelDM
    {
        private var _cellList:ArrayCollection = new ArrayCollection;

		private var _currectSelectFlag:String = "2g";//查询最差小区类型。2g或者3g
		
        [Bindable]
        public function get cellList():ArrayCollection
        {
            return _cellList;
        }

        public function set cellList(value:ArrayCollection):void
        {
            _cellList = value;
        }
		public function get currectSelectFlag():String
		{
			return _currectSelectFlag;
		}
		public function set currectSelectFlag(value:String):void
		{
			_currectSelectFlag = value;
		}
    }
}
