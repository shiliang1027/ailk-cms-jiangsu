package com.linkage.module.cms.scenedaily.view.components.leaderattention
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.domain.leaderattention.LeaderAttentionPanelDM;
	import com.linkage.module.cms.scenedaily.event.SceneDailyEvent;
	import com.linkage.module.cms.scenedaily.event.leaderattention.LeaderAttentionPanelEvent;

	/**
	 * 
	 *
	 * @author xudx (Ailk No.69291)
	 * @version 1.0
	 * @date 2012-8-17
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LeaderAttentionPanelPM
	{
			private var log:ILogger = Log.getLoggerByClass(LeaderAttentionPanelPM);
			
			[Inject("leaderAttentionPanelDM")]
            [Bindable]
			public var leaderAttentionPanelDM:LeaderAttentionPanelDM;
            
			[MessageDispatcher]
			public var dispatchMsg:Function;
			
            public function loadData(param:Object):void
			{
				log.info("加载领导关注模块！");
				
				var e:LeaderAttentionPanelEvent = new LeaderAttentionPanelEvent(LeaderAttentionPanelEvent.SHOW_LEADERATTENTION);
				
				log.info("加载领导关注模块 event！" +　e);
				e.param = param;
				dispatchMsg(e);
				log.info("加载领导关注模块 event end！");
			}
			
			//领导关注详情
			public function leaderAttentionDetailClickHandler(param:Object):void
			{
				var e:LeaderAttentionPanelEvent = new LeaderAttentionPanelEvent(LeaderAttentionPanelEvent.CMS_SCENEDAILY_LEADERATTENTIONPANEL_LEADERATTENTIONDETAILCLICKHANDLER);
				e.param = param;
				dispatchMsg(e);
			}
			
			public function showLeaderInfoDetail(param:Object):void{
				var e:LeaderAttentionPanelEvent = new LeaderAttentionPanelEvent(LeaderAttentionPanelEvent.SHOW_LEADER_DETAIL_INFO);
				e.param = param;
				dispatchMsg(e);
			}
		}
	}