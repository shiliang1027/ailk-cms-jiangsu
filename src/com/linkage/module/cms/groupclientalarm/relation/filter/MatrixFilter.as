package com.linkage.module.cms.groupclientalarm.relation.filter
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.groupclientalarm.relation.RelationContainer;
	import com.linkage.module.cms.groupclientalarm.relation.util.RelationUtil;

	/**
	 *矩阵过滤
	 * @author mengqiang
	 *
	 */
	public class MatrixFilter
	{
		/**
		 *更新矩阵接口
		 */
		private var _updateMatrix:IUpdateMatrix=null;

		//添加矩阵信息
		public function addMatrixInfo(alarm:Object, pAlarm:Object, data:Object):void
		{
			//循环遍历更新数据信息
			for (var key:String in data)
			{
				if (RelationUtil.checkIsMatrixLevel(key))
				{
					continue;
				}
				_updateMatrix=buildMatrixFactory(key, alarm, pAlarm);
				_updateMatrix.updateMatrixInfo(data);
			}
		}

		//添加矩阵信息
		public function updateMatrixInfo(alarm:Object, pAlarm:Object, data:Object):void
		{
			if (data[RelationContainer.MATRIXALARMID] == pAlarm[ColumnConstants.KEY_AlarmUniqueId])
			{
				//循环遍历更新数据信息
				for (var key:String in data)
				{
					if (RelationUtil.checkMatrixValue(key) || RelationUtil.checkMatrixValueh(key))
					{
						_updateMatrix=buildMatrixUpdateFactory(key, alarm, pAlarm);
						_updateMatrix.updateMatrixInfo(data);
					}
				}
			}
		}

		/**
		 *通过矩阵KEY获取告警信息
		 * @param key 矩阵KEY
		 * @param pAlarm 父告警信息
		 * @param pAlarm 子告警信息
		 * @return
		 *
		 */
		public function buildMatrixUpdateFactory(key:String, alarm:Object, pAlarm:Object):IUpdateMatrix
		{
			var updateMatrix:IUpdateMatrix=null;
			//更新值
			if (RelationUtil.checkMatrixValue(key))
			{
				updateMatrix=new UpdateMatrixUpValue(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixValueh(key))
			{
				updateMatrix=new UpdateMatrixUpValueh(key, alarm, pAlarm);
			}
			return updateMatrix;
		}

		/**
		 *通过矩阵KEY获取告警信息
		 * @param key 矩阵KEY
		 * @param pAlarm 父告警信息
		 * @param pAlarm 子告警信息
		 * @return
		 *
		 */
		public function buildMatrixFactory(key:String, alarm:Object, pAlarm:Object):IUpdateMatrix
		{
			var updateMatrix:IUpdateMatrix=null;
			//更新值
			if (RelationUtil.checkMatrixValue(key))
			{
				updateMatrix=new UpdateMatrixValue(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixValueh(key))
			{
				updateMatrix=new UpdateMatrixValueh(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixCount(key))
			{
				updateMatrix=new UpdateMatrixCount(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixSubject(key))
			{
				updateMatrix=new UpdateMatrixSubject(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixWireLess(key))
			{
				updateMatrix=new UpdateMatrixWireLess(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixFault(key))
			{
				updateMatrix=new UpdateMatrixFault(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixBTSOut(key))
			{
				updateMatrix=new UpdateMatrixOutBTS(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixMainAlarm(key))
			{
				updateMatrix=new UpdateMatrixMainAlarm(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixBTS(key))
			{
				updateMatrix=new UpdateMatrixBTS(key, alarm, pAlarm);
			}
			else if (RelationUtil.checkMatrixValuePc(key))
			{
				updateMatrix=new UpdateMatrixPcValue(key, alarm, pAlarm);
			}
			else
			{
				updateMatrix=new UpdateMatrixDefault(key, alarm, pAlarm);
			}
			return updateMatrix;
		}
	}
}