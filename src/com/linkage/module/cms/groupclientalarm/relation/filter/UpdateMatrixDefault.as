package com.linkage.module.cms.groupclientalarm.relation.filter
{

	/**
	 *更新矩阵默认
	 * @author mengqiang
	 *
	 */
	public class UpdateMatrixDefault extends UpdateMatrix
	{
		public function UpdateMatrixDefault(key:String, alarm:Object, pAlarm:Object)
		{
			super(key, alarm, pAlarm);
		}

		override public function updateMatrixInfo(data:Object):Boolean
		{
			return true;
		}

		//初始化key对应的值
		override public function initValue(alarm:Object, pAlarm:Object):void
		{
			return;
		}
	}
}