package com.linkage.module.cms.quitstatnew.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.domain.IUser;

	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-28
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class QuitStatDAO implements IQuitStatDAO
	{
		private var log:ILogger = Log.getLoggerByClass(QuitStatDAO);

		[Inject("remoteObject")]
		public var rmtObj:RemoteObject;
		[Inject("user")]
		public var user:IUser;

		//获取历史数据
		public function getHisQuitServiceStat(param:Object):AsyncToken
		{
			log.info("获取[退服统计列表]调用java接口getQuitServiceStat参数如下");
			log.info("name:{0},startTime:{1},endTime:{2},citys:{3}", user.account, param.startTime, param.endTime, param.citys);
			return rmtObj.getQuitServiceStat(user, param.startTime, param.endTime, param.citys);
		}

		//过期 获取列表数据 
		public function getQuitServiceStat(param:Object):AsyncToken
		{
			log.info("获取[退服统计列表]调用java接口getStatInfo参数如下");
			log.info(user);
			return rmtObj.getStatInfo(user);
		}

		//获取退服详情
		public function getQuitStatDetail(param:Object):AsyncToken
		{
			log.info("获取[退服详情]调用java接口getQuitStatDetail参数如下");
			log.info("name:{0},startTime:{1},endTime:{2},cityName:{3},col:{4}", user.account, param.startTime, param.endTime, param.cityName, param.col);
			return rmtObj.getQuitStatDetail(user, param.startTime, param.endTime, param.cityName, param.col, user.searchType);
		}

		//获取地市列表
		public function getcitys():AsyncToken
		{
			log.info("获取地市列表");
			log.info("name:{0}", user.account);
			return rmtObj.getcitys(user);
		}

		//获取地图渲染列表
		public function getMapRenderList(param:Object):AsyncToken
		{
			log.info("获取地图渲染列表");
			log.info("name:{0}", user.account);
			return rmtObj.getMapRenderList(user);
		}

		//获取Kpi属地数据列表
		public function getKpiCityDataList(param:Object):AsyncToken
		{
			log.info("获取Kpi属地数据列表");
			log.info("name:{0},searchType:{1}", user.account, user.searchType);
			return rmtObj.getKpiCityDataList(user);
		}

	}
}