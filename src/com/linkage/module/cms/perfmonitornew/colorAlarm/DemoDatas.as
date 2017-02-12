package com.linkage.module.cms.perfmonitornew.colorAlarm
{
	import mx.collections.ArrayCollection;

	public class DemoDatas
	{
		public function DemoDatas()
		{
		}
		//1.红橙黄蓝告警列表
		public static var alarmDatas:Object = [{"name":"南京",
			"datas":[{"mo_type_name":"MSC",
				"mos":[{"mo_name":"NJGS10","mo_id":"0.mss.7","mo_type_id":"5","mo_type_name":"MSC","alarmregion":"","specialty":"","alarmseverity":"一级告警"},
					{"mo_name":"NJGS18","mo_id":"0.mss.33","mo_type_id":"5","mo_type_name":"MSC","alarmregion":"","specialty":"","alarmseverity":"三级告警"},
					{"mo_name":"NJGS32","mo_id":"0.mss.36","mo_type_id":"5","mo_type_name":"MSC","alarmregion":"","specialty":"","alarmseverity":"三级告警"},
					{"mo_name":"NJGS33","mo_id":"0.mss.37","mo_type_id":"5","mo_type_name":"MSC","alarmregion":"","specialty":"","alarmseverity":"三级告警"},
					{"mo_name":"NJGS45","mo_id":"0.mss.90","mo_type_id":"5","mo_type_name":"MSC","alarmregion":"","specialty":"","alarmseverity":"三级告警"},
					{"mo_name":"NJGS84","mo_id":"0.mss.144","mo_type_id":"5","mo_type_name":"MSC","alarmregion":"","specialty":"","alarmseverity":"三级告警"}
				]},
				{"mo_type_name":"BSC/RNC",
					"mos":[{"mo_name":"WUXGS6","mo_id":"0.mss.5","mo_type_id":"5","mo_type_name":"BSC/RNC","alarmregion":"","specialty":"","alarmseverity":"一级告警"},
						{"mo_name":"SUZGM46","mo_id":"0.mgw.51","mo_type_id":"7","mo_type_name":"BSC/RNC","alarmregion":"","specialty":"","alarmseverity":"二级告警"}
					]}
			]},
			{"name":"苏州",
				"datas":[{"mo_type_name":"MSC",
					"mos":[{"mo_name":"SZDRHLR11HW","mo_id":"1234","mo_type_id":"13","mo_type_name":"MSC","alarmregion":"","specialty":"","alarmseverity":"一级告警"},
						{"mo_name":"SZDRHLTESTQ","mo_id":"4567","mo_type_id":"13","mo_type_name":"MSC","alarmregion":"","specialty":"","alarmseverity":"二级告警"},
						{"mo_name":"SZDRHL102HW","mo_id":"7890","mo_type_id":"13","mo_type_name":"MSC","alarmregion":"","specialty":"","alarmseverity":"三级告警"}
					]},
					{"mo_type_name":"BSC/RNC",
						"mos":[{"mo_name":"GZSSA3","mo_id":"14567","mo_type_id":"11","mo_type_name":"BSC/RNC","alarmregion":"","specialty":"","alarmseverity":"二级告警"}
						]}
				]}
		];
		//2.资源属性
		public static var moInfoDataGridData:ArrayCollection = new ArrayCollection(
			[{fieldCN:"所属城市",fieldValue:"南京"},
			 {fieldCN:"网元名称",fieldValue:"NJGS18"},
			 {fieldCN:"网元类型",fieldValue:"MSC Server"},
			 {fieldCN:"设备厂家",fieldValue:"华为"},
			 {fieldCN:"所在机房",fieldValue:"幕府山机房二层"},
			 {fieldCN:"经度",fieldValue:"118.755311"},
			 {fieldCN:"纬度",fieldValue:"32.04898"},
			 {fieldCN:"工程状态",fieldValue:"在网(在网运行) "},
			 {fieldCN:"设备型号",fieldValue:"G9MSC"},
			 {fieldCN:"软件版本",fieldValue:"R007C03"},
			 {fieldCN:"归属POOL",fieldValue:"NJ-MSCPOOL-03"}]
		);
		
		//3.应急预案
		private static var redPlanData1:Object = {"triggeringConditions":"触发条件:\r\n交换机CPU过载>95%",
			"schedulingProcess":"调度流程:",
			"emergencyMeasures":"应急措施:" +
				"\r\n1.华为：取消和智能网之间CAMEL消息交互(需要和智能网专业共同商定)。" +
				"\r\n2.爱立信：取消和智能网之间CAMEL消息交互(需要和智能网专业共同商定)。",
				"rewindProcess":"倒回流程：",
				"actionScript":"操作脚本：" +
				"\r\n1.华为：SET MAPACCFG: CAMELVER=NONE;" +
				"\r\n2.爱立信：修改B表27源（主叫签约触发），直接跳转至30源，不去触发SCP：" +
				"\r\n       ANBZI;" +
				"\r\n       ANBCI;" +
				"\r\n       ANBSI:B=27-0,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-1,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-2,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-3,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-4,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-5,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-6,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-7,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-8,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-9,F=30,L=3-23;" +
				"\r\n       ANBAI;",
				"contact":"联系方式:",
				"reportingTemplate":"上报信息模板:",
				"summaryTemplate":"总结模板:",
				"warningCases":"预警处理案例:",
				"emergencyPreparedness":"应急预案信息:"
		};
		private static var orangePlanData1:Object = {"triggeringConditions":"触发条件:\r\n交换机CPU过载>90%",
			"schedulingProcess":"调度流程:",
			"emergencyMeasures":"应急措施:" +
				"\r\n1.华为：修改增强流控门限，控制交换机CPU负荷工作在90％左右（华为端局） 。" +
				"\r\n2.爱立信：启动交换机流控，保证当前80%呼叫进程的业务疏通能力（爱立信端局）。",
				"rewindProcess":"倒回流程：",
				"actionScript":"操作脚本：" +
				"\r\n1.华为：修改多业务削峰最大CPU等效值" +
				"\r\nSET FCCFG: MSMC=120;" +
				"\r\n2.爱立信：" +
				"\r\n       ARLDP:APCLNK=ALL;" +
				"\r\n       检查当前APCLNK=MOC/MTE的SES值" +
				"\r\n       ARLDC:APCLNK=MOC,SMAX=<MOC_SES>*80%;" +
				"\r\n       ARLDC:APCLNK=MTE,SMAX=<MTE_SES>*80%;",
				"contact":"联系方式:",
				"reportingTemplate":"上报信息模板:",
				"summaryTemplate":"总结模板:",
				"warningCases":"预警处理案例:",
				"emergencyPreparedness":"应急预案信息:"
		};
		private static var yellowPlanData1:Object = {"triggeringConditions":"触发条件:\r\n交换机CPU过载>80%",
			"schedulingProcess":"调度流程:",
			"emergencyMeasures":"应急措施:" +
				"\r\n1.华为：" +
				"\r\n（1）修改部分通知音，采取直接释放措施。" +
				"\r\n（2）关闭彩铃功能。" +
				"\r\n（3）抑制短信呼和来电提醒(拦截13800XYZ301字冠)。" +
				"\r\n2.爱立信：" +
				"\r\n（1）修改部分通知音，采取直接释放措施。" +
				"\r\n（2）关闭彩铃功能。" +
				"\r\n（3）抑制短信呼和来电提醒(拦截13800XYZ301字冠)。",
				"rewindProcess":"倒回流程：",
				"actionScript":"操作脚本：" +
				"\r\n1.华为：" +
				"\r\n（1）ADD CFPRO: FCC=CV162, FSNAME=\"ALL\", PT=EFRLS, DCN=\"DEFAULT\";" +
				"\r\n       ADD CFPRO: FCC=CV166, FSNAME=\"ALL\", PT=EFRLS, DCN=\"DEFAULT\";" + 
				"\r\n       ADD CFPRO: FCC=CV170, FSNAME=\"ALL\", PT=EFRLS, DCN=\"DEFAULT\";" +
				"\r\n       ADD CFPRO: FCC=CV172, FSNAME=\"ALL\", PT=EFRLS, DCN=\"DEFAULT\";" +
				"\r\n（2）SET MAPPARA: COLORRINGCMCC=NO;" +
				"\r\n（3）MOD CNACLD: P=0, PFX=K'13800XYZ301, ADDR=ALL, CSA=INB, RSNAME=\"INVALID\";" +
				"\r\nMOD  CFPRO:FCC=CV45,FSNAME=\"0\",RUT=ALL,RMT=ALL,CSA=ALL,PT=EFRLS;" + 
				"\r\n2.爱立信：" +
				"\r\n（1）修改EOS表中常用的连接录音通知为直接释放的指令：" +
				"\r\n       ANEZI:ES=es；" +
				"\r\n       ANESI:ES=es,FRE；" +
				"\r\n       ANEAI:ES=es;" +
				"\r\n       常用的ES有：100,1676,2293,2298,2300,24,2576,266,2981,3377,3660,3669,3732,3736,3744,3745,3748,400,90" +
				"\r\n（2）修改B表64源彩铃分析源，使之强制释放；" +
				"\r\n       ANSBP:B=64-1;" +
				"\r\n       ANBZI；" +
				"\r\n       ANBCI;" +
				"\r\n       ANBSE:B=64-1；" +
				"\r\n       ANBSI:B=64-1,ES=555;" +
				"\r\n       ANBAI;" +
				"\r\n       ANEZI:ES=555；" +
				"\r\n       ANESI:ES=555,FRE；" +
				"\r\n       ANEAI:ES=555；" +
				"\r\n（3）修改B表，拦截13800XYZ301字冠（XYZ=本地区号）" +
				"\r\n       ANBZI;" +
				"\r\n       ANBCI;" +
				"\r\n       ANBSE:B=30-13800XYZ301;" +
				"\r\n       ANBSI:B=30-13800XYZ301,ES=555;" +
				"\r\n       ANBAI;" +
				"\r\n       ANEZI:ES=555；" +
				"\r\n       ANESI:ES=555,FRE；" +
				"\r\n       ANEAI:ES=555；",
				"contact":"联系方式:",
				"reportingTemplate":"上报信息模板:",
				"summaryTemplate":"总结模板:",
				"warningCases":"预警处理案例:",
				"emergencyPreparedness":"应急预案信息:"
		};
		
		private static var bluePlanData1:Object = {"triggeringConditions":"触发条件:\r\n交换机CPU过载>70%",
			"schedulingProcess":"调度流程:",
			"emergencyMeasures":"应急措施:" +
				"\r\n1.华为：" +
				"\r\n（1）缩短动态漫游号释放时长为10s。" +
				"\r\n（2）停止消息跟踪。" +
				"\r\n（3）关闭交换机二次寻呼。" +
				"\r\n（4）调整交换机鉴权策略开启1/15选择性鉴权。" +
				"\r\n（5）修改常用录音通知循环播放次数为1次。" +
				"\r\n（6）缩短A接口振铃时长至25s。" +
				"\r\n（7）抑制智能网CSI触发(需智能网专业确认执行，影响短号来显)。" +
				"\r\n（8）增加周期性位置更新时长为4小时(与无线专业配合完成)。" +
				"\r\n（9）短信中心关闭短信重发机制(通知短信专业执行)。" +
				"\r\n（10）紧急扩容VLR容量。" +
				"\r\n2.爱立信：" +
				"\r\n（1）缩短动态漫游号释放时长为10s。" +
				"\r\n（2）适当增扩产生告警的相关SAE的NI值。" +
				"\r\n（3）停止消息跟踪。" +
				"\r\n（4）关闭交换机二次寻呼。" +
				"\r\n（5）调整交换机鉴权策略开启1/15选择性鉴权。" +
				"\r\n（6）修改常用录音通知循环播放次数为1次" +
				"\r\n（7）缩短A接口振铃时长至25s。" +
				"\r\n（8）抑制智能网CSI触发(需智能网专业确认执行，影响短号来显)。" +
				"\r\n（9）增加周期性位置更新时长为4小时(与无线专业配合完成)。" +
				"\r\n（10）短信中心关闭短信重发机制(通知短信专业执行)。" +
				"\r\n（11）紧急扩容VLR容量。" +
				"\r\n（12）MGW话务容量比达到100%开始限呼的情况下，开启MGW紧急license（爱立信端局）。",
				"rewindProcess":"倒回流程：",
				"actionScript":"操作脚本：" +
				"\r\n1.华为：" +
				"\r\n（1）MOD VLRCFG: MSRNRT=10;" +
				"\r\n（2）图形界面操作。" +
				"\r\n（3）MOD PGCTRL: LAI=\"e\", TYPE=ALL, PRI=ALL, EMGSRVCTR=NO, TIMES=1;" +
				"\r\n（4）MOD AUTHCFG: EMGCSRVFLAG=NO, AUTHCLASS=EVTRLT, LOCALSUBINTERVLRLU=AUTH15, ROAMSUBINTERVLRLU=AUTH15, LOCALSUBINTRAVLRLU=AUTH15, ROAMSUBINTRAVLRLU=AUTH15, PERIODLU=AUTH15, LOCALSUBMO=AUTH15, ROAMSUBMO=AUTH15, LOCALSUBMT=AUTH15, LOCALSUBSMSMO=AUTH15, ROAMSUBSMSMO=AUTH15, LOCALSUBSMSMT=AUTH15, ROAMSUBSMSMT=AUTH15;" +
				"\r\n（5）MOD TONECFG:INTTID=TID3,CYCN=1;" +
				"\r\n       MOD TONECFG:INTTID=TID4,CYCN=1;" +
				"\r\n       MOD TONECFG:INTTID=TID5,CYCN=1;" +
				"\r\n       等" +
				"\r\n（6）ADD CFPRO: FCC=CV15, FSNAME=\"ALL\", PT=EFRLS, DCN=\"DEFAULT\";" +
				"\r\n       MOD TIMER: MPID=126, TMRIDX=0, TMRSEQ=7, TMRVAL=25;" +
				"\r\n（7）MOD MSFP: ID=P917, MODTYPE=P1, BIT=13, BITVAL=0;" +
				"\r\n（8）MOD VLRCFG: LOCUPDT=240;" +
				"\r\n（9）通知短信专业。" +
				"\r\n（10）增加VDB单板或者MOD VLRCFG: MAXUSR=250000;（注：只有R7C3版本可以通过MOD VLRCFG修改用户数从20W调到25W，且立即生效，升级到R7C5\R7C10后默认已是25W，无法再调高）。" +
				"\r\n2.爱立信：" +
				"\r\n（1）MGEPC:PROP=MSRNTCNTIME-10;" +
				"\r\n（2）DBTSP:TAB=SAACTIONS;" +
				"\r\n       AFTSP:TEST=110,LOG；" +
				"\r\n       根据以上指令输出结果检查相关SAE的当前NI值：" +
				"\r\n       SAAEP:SAE=sae,BLOCK=block；" +
				"\r\n       使用指令SAALI;进行自动增扩；" +
				"\r\n       或者在专家指导下使用指定NI值手工增扩指令：" +
				"\r\n       SAAII：BLOCK=block,SAE=sae,NI=new_ni；" +
				"\r\n（3）1、停止用户跟踪：" +
				"\r\n       MOSTE:TREF=ALL;" +
				"\r\n       2、停止TEST SYSTEM软件跟踪：" +
				"\r\n       ALLIP:ACL=O1；根据TEST SYSTEM产生的告警信息选择对应的操作维护端口号AD-xxx." +
				"\r\n       APLOC;" +
				"\r\n       mml –d  AD-xxx" +
				"\r\n       END TEST;指令退出。" +
				"\r\n       3、停止FORLOPP跟踪:" +
				"\r\n       SYFSC:FLSTATUS=PASSIVE;" +
				"\r\n       4、停止智能网CAMEL信令跟踪:" +
				"\r\n       dbtri;" +
				"\r\n       dbtsc:tab=shtdps,tdpsid=99,shs=1;" +
				"\r\n       dbtre:com;" +
				"\r\n（4）停止消息跟踪。" +
				"\r\n       DBTSP:TAB=AXEPARS,NAME=PAGREP1LA; " +
				"\r\n       DBTSP:TAB=AXEPARS,NAME=PAGREPGLOB;" +
				"\r\n       DBTRI;" +
				"\r\n       DBTSC:TAB=AXEPARS,SETNAME=GSMMMSC,NAME= PAGREP1LA,VALUE=0;" +
				"\r\n       DBTRE:COM;" +
				"\r\n       DBTRI;" +
				"\r\n       DBTSC:TAB=AXEPARS,SETNAME=GSMMMSC,NAME= PAGREPGLOB,VALUE=0;" +
				"\r\n       DBTRE:COM;" +
				"\r\n（5）DBTSP:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTH; ! 记录原值  !" +
				"\r\n       DBTRI;" +
				"\r\n       DBTSC:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTH,VALUE=1;" +
				"\r\n       DBTRE:COM;" +
				"\r\n       DBTSP:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHCIPNR;  !  记录原值  !" +
				"\r\n       DBTRI;" +
				"\r\n       DBTSC:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHCIPNR,VALUE=15;" +
				"\r\n       DBTRE:COM;" +
				"\r\n       DBTSP:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHSS; !  记录原值  !" +
				"\r\n       DBTRI;" +
				"\r\n       DBTSC:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHSS,VALUE=1;" +
				"\r\n       DBTRE:COM;" +
				"\r\n       DBTSP:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHLOCUP; !  记录原值 !" +
				"\r\n       DBTRI;" +
				"\r\n       DBTSC:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHLOCUP,VALUE=1;" +
				"\r\n       DBTRE:COM;" +
				"\r\n       DBTSP:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHCALL;   !  记录原值 !" +
				"\r\n       DBTRI;" +
				"\r\n       DBTSC:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHCALL,VALUE=1;" +
				"\r\n       DBTRE:COM;" +
				"\r\n       DBTSP:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHSMS;   !  记录原值 !" +
				"\r\n       DBTRI;" +
				"\r\n       DBTSC:TAB=AXEPARS,SETNAME=GSMMMSC,NAME=SELAUTHSMS,VALUE=1;" +
				"\r\n       DBTRE:COM;" +
				"\r\n（6）使用Mohsell工具在对应MGW上输入指令：" +
				"\r\n       lt all" +
				"\r\n       get ImBasicMessage=0 fileName" +
				"\r\n       get ImBasicMessage=0 iteration  （原值=2）" +
				"\r\n       set  ImBasicMessage=0 iteration 1" +
				"\r\n（7）DBTSP:TAB=AXEPARS,NAME=TIMANNATNRYM;" +
				"\r\n       DBTRI;" +
				"\r\n       DBTSC:TAB=AXEPARS,SETNAME=GSMMSSC,NAME=TIMANNATNRYM,VALUE=25;" +
				"\r\n       DBTRE:COM;" +
				"\r\n（8）1、抑制T-CSI触发:" +
				"\r\n       修改HLR寻访路由码RC=34的参数SI=1，抑制T-CSI触发流程：" +
				"\r\n       ANRSP:RC=34;" +
				"\r\n       ANRSI:RC=34,CCH=NO,P01=1,R=0GRI3,SP=MM1,SI=1,BNT=1,ESS=1,ESR=0;" +
				"\r\n       ANRAI:RC=34;" +
				"\r\n       2、O-CSI只触发5、6、7开始的被叫号码" +
				"\r\n       ANBZI;" +
				"\r\n       ANBCI;" +
				"\r\n       ANBSI:B=27-0,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-1,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-2,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-3,F=30,L=3-23;" +
				"\r\n       ANBSI:B=27-4,F=30,L=3-23;" +
				"\r\n       ANBAI;" +
				"\r\n（9）MGIDI:BTDM=240,GTDM=6;" +
				"\r\n（10）通知短信专业。" +
				"\r\n（11）VLR容量增扩到80万操作步骤：" +
				"\r\n       SAAII:SAE=579,BLOCK=MTRIP,NI=8000;" +
				"\r\n       SAAII:SAE=578,BLOCK=MTRIP,NI=8000;" +
				"\r\n       SAAII:SAE=577,BLOCK=MTRIP,NI=8000;" +
				"\r\n       SAAII:SAE=576,BLOCK=MTRIP,NI=8000;" +
				"\r\n       SAAII:SAE=575,BLOCK=MTRIP,NI=8000;" +
				"\r\n       SAAII:SAE=574,BLOCK=MTRIP,NI=8000;" +
				"\r\n       SAAII:SAE=573,BLOCK=MTRIP,NI=8000;" +
				"\r\n       SAAII:SAE=572,BLOCK=MTRIP,NI=8000;" +
				"\r\n       SAAII:SAE=571,BLOCK=MTRIP,NI=8000;" +
				"\r\n       SAAII:SAE=36,NI=8000;" +
				"\r\n（12）用Node Manager工具进入MGW图形界面，选择Resoursce View->System Configuration->Licensing,按右键出现菜单后选择Set Eemergency State，弹出框选Yes键确定。",
				"reportingTemplate":"上报信息模板:",
				"summaryTemplate":"总结模板:",
				"warningCases":"预警处理案例:",
				"emergencyPreparedness":"应急预案信息:"
		};
		
		private static var redPlanData2:Object = {"triggeringConditions":"触发条件:\r\n在执行了蓝色、黄色、橙色预警措施之后，BSC下出现大规模基站退服或BSC重启",
			"schedulingProcess":"调度流程:" +
			"\r\n步骤1：省监控发现网络负荷达到红色门限，紧急通知省无线室设备维护专业组长；无线专业组长立刻汇报省无线维护室经理，并启动应急响应流程；" +
			"\r\n步骤2：省无线室设备维护专业组长接到监控通知后立刻通知分公司红澄黄蓝应急接口人；分公司接口人立刻向所在地市网络部/工维部经理汇报，并按照预警级别组织现场应急工作，3分钟之内启动操作；",
			"emergencyMeasures":"应急措施:" +
				"\r\n1、逐步关闭部分BSC和除VVIP以外的基站。" +
				"\r\n2、锁定高负荷或已重启BSC的所有MTL信令，在BSC和BTS稳定后逐步解锁(moto)。",
				"rewindProcess":"倒回流程：接到省监控预警降级的通知后，省无线设备维护专业组长立刻将修改的参数倒回，基站重新激活。",
				"actionScript":"操作脚本：" +
				"\r\n卡特：1、在RNUSM窗口中lock BSS function以关闭BSC；在RNUSM窗口中对小区进行lock操作以关闭基站。" +
				"\r\n      2、在BSSUSM窗口中lock住所有的N7信令（最多16条），在设备状态稳定后逐步unlock。" +
				"\r\n爱立信：RLSBC:CELL=cell1，CB=YES;" +
				"\r\n华为：右击基站，“基站操作 〉配置基站激活状态 〉未激活 〉完成”，将基站关闭；或者“配置 〉批改基站属性 〉选择需要关闭的基站 〉下一步 〉激活状态 〉修改参数 〉批量值（未激活） 〉批修改 〉确定 〉完成”，将基站关闭。",
				"contact":"联系方式:1、爱立信、华为：翁娜云13905182685。" +
				"\r\n      2、卡特：仇宏剑13905180982。",
				"reportingTemplate":"上报信息模板:" +
				"\r\n全省受灾情况和网络运行情况，主要数据包括受影响的基站数（xx站停电，xx站退服，受影响最严重的3－5个地区，并通报退服的量），传输中断情况（xx2M中断，xx皮长公里线路受影响，受影响最严重的3－5个地区，并通报退服的量）。全省应急措施，动用多少物资和多少人员。受灾最严重地区的网络影响情况、应对措施和效果进行描述。",
				"summaryTemplate":"总结模板:" +
				"\r\n灾情情况：地区损失情况和公司损失情况。\r\n准备情况：主要包括领导部署和动员（人员投入情况）、资源调配（物资准备、应急设备的检测和预准备）、应急预案（救灾指挥现场、VIP基站、互联互通的通信保障）\r\n抢险保障实施情况：分专业将影响最严重的事件进行总结，主要将发生什么样的灾情，市公司采取了什么样的应对措施，实施效果如何。",
				"warningCases":"预警处理案例:" +
				"\r\n苏州分公司维护人员陆学兵，通过关闭所有非VIP小区，效果仍不明显，观察20分钟后，决定通过指令RLSBC:CELL=cell1，CB=YES;停闭所有非VVIP基站。",
				"emergencyPreparedness":"应急预案信息:"
		};
		private static var orangePlanData2:Object = {"triggeringConditions":"触发条件:\r\n在执行了蓝色、黄色预警措施之后，LAC寻呼量100%满负荷或BSC CP 满负荷。",
			"schedulingProcess":"调度流程:" +
			"\r\n步骤1：省监控发现网络负荷达到橙色门限，紧急通知省无线室设备维护专业组长；无线专业组长立刻汇报省无线维护室经理，并启动应急响应流程；\r\n步骤2：省无线室设备维护专业组长接到监控通知后立刻通知分公司红澄黄蓝应急接口人；分公司接口人立刻向所在地市网络部/工维部经理汇报，并按照预警级别组织现场应急工作，3分钟之内启动操作；",
			"emergencyMeasures":"应急措施:" +
				"\r\n1、针对高寻呼会导致高CPU负荷的BSC，关闭非VIP基站。\r\n2、针对高寻呼会导致高CPU负荷的BSC，割接部分VIP基站至空闲BSC。\r\n3、针对高寻呼会导致高CPU负荷的BSC，取消短信MT功能。\r\n4、提高切换电平或关闭切换。\r\n5、 LAC分裂。\r\n6、针对负荷高的BSC，关闭部分A接口信令\r\n。7、启用ACC（接入控制级别）分级功能，控制非重要用户接入。",
				"rewindProcess":"倒回流程：接到省监控预警降级的通知后，省无线设备维护专业组长立刻将修改的参数倒回。",
				"actionScript":"操作脚本：" +
				"\r\n卡特：\r\n1、在RNUSM窗口中对小区进行lock操作以关闭基站。\r\n2、a.传输跳线，同时在空闲BSC上创好VIP小区数据；b.传输连通，OML可用时，unlock BTS oml；c.BTS oml可用后，对BTS做HW audit；d.unlock BTS TEL。\r\n3、在RNUSM中选定小区-->edit cell，在HO&PC Thresholds中提高上下行切换电平；在HO parameters中关闭切换。\r\n4、将高负荷基站割接到新LAC所属的BSC上。\r\n5、在BSSUSM窗口中lock住部分N7信令。\r\n6、在RNUSM中选定小区-->edit cell，在cell information-->RACH Ctrl中进行ACC控制。" +
				"\r\n爱立信：\r\n1、RLSBC:CELL=cell1，CB=YES;\r\n2、RLSTC:CELL=cell，STATE＝HALT; \r\n传输割接\r\nRLSTC:CELL=cell，STATE＝ACTIVE;;\r\n3、RLNRC:CELL=cell ，CELLR=cell ，KHYST= ；\r\n4、RLDEC:CELL=cell,CGI=cgi;\r\n5、BLODI:DEV=RALT-X;\r\n6、RLDEC：Cell=***,ACC=***;" +
				"\r\n华为：\r\n1、右击基站，“基站操作 〉配置基站激活状态 〉未激活 〉完成”，将基站关闭。\r\n2、备份需要割接的BSC配置数据，离线打开该数据，将需要割接的VIP基站调整好端口，且调整好CGI，“配置 〉导入导出数据 〉导出基站数据 〉选择VIP基站 〉导出”；在另一BSC上，“配置 〉导入导出数据 〉导出基站数据 〉选择*.sxd文件 〉打开”；添加对应小区的PTPBVC，割传输。\r\n3、“配置 〉批改网优参数 〉选择相应的小区 〉下一步 〉切换数据 〉负荷切换接受门限 〉修改参数 〉输入批量值 〉批修改 〉确定 〉完成”。\r\n4、右击小区，“配置小区属性 〉选中小区 〉设置小区属性 〉输入新LAC 〉确定 〉完成”。\r\n5、“BSC维护 〉传输和信令维护 〉MTP3链路维护 〉MTP3操作 〉操作（去激活/禁止） 〉应用”，关闭部分A接口信令。",
				"contact":"联系方式:" +
				"\r\n1、爱立信、华为：翁娜云13905182685。" +
				"\r\n2、卡特：仇宏剑13905180982。",
				"reportingTemplate":"上报信息模板:" +
				"\r\n全省受灾情况和网络运行情况，主要数据包括受影响的基站数（xx站停电，xx站退服，受影响最严重的3－5个地区，并通报退服的量），传输中断情况（xx2M中断，xx皮长公里线路受影响，受影响最严重的3－5个地区，并通报退服的量）。全省应急措施，动用多少物资和多少人员。受灾最严重地区的网络影响情况、应对措施和效果进行描述。",
				"summaryTemplate":"总结模板:" +
				"\r\n灾情情况：地区损失情况和公司损失情况。\r\n准备情况：主要包括领导部署和动员（人员投入情况）、资源调配（物资准备、应急设备的检测和预准备）、应急预案（救灾指挥现场、VIP基站、互联互通的通信保障）。\r\n抢险保障实施情况：分专业将影响最严重的事件进行总结，主要将发生什么样的灾情，市公司采取了什么样的应对措施，实施效果如何。",
				"warningCases":"预警处理案例:" +
				"\r\n苏州分公司维护人员陆学兵，通过降低部分非VIP小区的发射功率，并关闭小部分非VIP小区，效果仍不明显，观察20分钟后，决定通过指令RLSBC:CELL=cell1，CB=YES;停闭所有非VIP基站。",
				"emergencyPreparedness":"应急预案信息:"
		};
		private static var yellowPlanData2:Object = {"triggeringConditions":"触发条件:\r\n在RNUSM窗口，edit cell--> GPRS-->Radio Res. Ctrl中减少PDCH信道配置数。",
			"schedulingProcess":"调度流程:" +
				"\r\n步骤1：省监控发现网络负荷达到黄色门限，紧急通知省无线室设备维护专业组长；无线专业组长立刻汇报省无线维护室经理，并启动应急响应流程；\r\n步骤2：省无线室设备维护专业组长接到监控通知后立刻通知分公司红澄黄蓝应急接口人；分公司接口人立刻向所在地市网络部/工维部经理汇报，并按照预警级别组织现场应急工作，3分钟之内启动操作；",
				"emergencyMeasures":"应急措施:" +
				"\r\n1、调整寻呼量控制参数，限制寻呼量。\r\n2、适当减少部分基站的SDCCH信道配置数。\r\n3、提高小区最小接入电平。\r\n4、降低部分小区的发射功率，直至关闭部分非VIP小区。",
				"rewindProcess":"倒回流程：接到省监控预警降级的通知后，省无线设备维护专业组长立刻将修改的参数倒回。",
				"actionScript":"操作脚本：" +
				"\r\n卡特：\r\n1、在RNUSM窗口中edit cell-->cell description中选择paging_barred。\r\n2、在RNUSM窗口，edit cell--> Radio Channel Config-->Timeslot Configuration中减少SDCCH信道配置数。\r\n3、在RNUSM窗口中点击小区edit cell,在cell selection中调整RXLEV_ACCESS_MIN。\r\n4、在RNUSM窗口中点击小区edit cell,在PC parameters中对小区发射功率进行调整。" +
				"\r\n爱立信：\r\n1、RAEPC:PROP=PAGLIMIT-X;\r\n2、RLCCC：Cell=cell, CHGR=**,TN=***,SDCCH=***;\r\n3、RLSSC:CELL=cell, ACCMIN=***;\r\n4、RLCPC：Cell=cell, MSTXPWR=**, BSPWRT=***, BSPWRB=***;\r\nRLSBC:CELL=cell1，CB=YES;" +
				"\r\n华为：\r\n1、BSC属性参数 〉BSC基本属性参数 〉流控数据 〉寻呼消息到达率统计周期内最大消息数”门限到150，最少到120，不可再少。\r\n2、右击载频，“配置信道属性 〉信道属性 〉信道类型”，做相应的修改。\r\n3、“配置 〉批改网优参数 〉选择相应的小区 〉下一步 〉呼叫控制 〉RACH最小接入电平 〉修改参数 〉输入批量值 〉批修改 〉确定 〉完成”。\r\n4、右击载频，“配置载频属性 〉配置载频属性 〉设备属性 〉功率等级”，做相应的修改。",
				"contact":"联系方式:" +
				"\r\n1、爱立信、华为：翁娜云13905182685。" +
				"\r\n2、卡特：仇宏剑13905180982。",
				"reportingTemplate":"上报信息模板:" +
				"\r\n全省受灾情况和网络运行情况，主要数据包括受影响的基站数（xx站停电，xx站退服，受影响最严重的3－5个地区，并通报退服的量），传输中断情况（xx2M中断，xx皮长公里线路受影响，受影响最严重的3－5个地区，并通报退服的量）。全省应急措施，动用多少物资和多少人员。受灾最严重地区的网络影响情况、应对措施和效果进行描述。",
				"summaryTemplate":"总结模板:" +
				"\r\n灾情情况：地区损失情况和公司损失情况。\r\n准备情况：主要包括领导部署和动员（人员投入情况）、资源调配（物资准备、应急设备的检测和预准备）、应急预案（救灾指挥现场、VIP基站、互联互通的通信保障）。\r\n抢险保障实施情况：分专业将影响最严重的事件进行总结，主要将发生什么样的灾情，市公司采取了什么样的应对措施，实施效果如何。",
				"warningCases":"预警处理案例:" +
				"\r\n无线室维护人员仇宏剑观察20分钟后，通过增加周期性位置性更新时间等操作效果不明显，立即通知苏州分公司维护人员陆学兵，通知其通过指令RLCPC：Cell=cell, MSTXPWR=**, BSPWRT=***, BSPWRB=***;降低部分非VIP小区的发射功率，并关闭小部分非VIP小区。",
				"emergencyPreparedness":"应急预案信息:"
		};
		
		private static var bluePlanData2:Object = {"triggeringConditions":"触发条件:\r\n BSC 寻呼超过满负荷的70%-80%或BSC CP负荷超过满负荷的70-80%；BSC话务负荷达到理论值的70-80%。",
			"schedulingProcess":"调度流程:" +
				"\r\n步骤1：省监控发现网络负荷达到蓝色门限，紧急通知省无线室设备维护专业组长；无线专业组长立刻汇报省无线维护室经理，并启动应急响应流程；\r\n步骤2：省无线室设备维护专业组长接到监控通知后立刻通知分公司红澄黄蓝应急接口人；分公司接口人立刻向所在地市网络部/工维部经理汇报，并按照预警级别组织现场应急工作，3分钟之内启动操作；",
				"emergencyMeasures":"应急措施:" +
				"\r\n1、针对高寻呼会导致ABIS信令高负荷，提高RSL信令带宽；\r\n2、针对高寻呼会导致ABIS信令高负荷，适当减少系统内部进程，降低信令负荷；\r\n3、针对高寻呼会导致高CPU负荷的BSC，将MS最大重发次数调整为1次，降低RACH信道负荷\r\n4、 针对高寻呼会导致高CPU负荷的BSC，修改T3122计数器到10-30秒以减少用户接入请求频度\r\n5、针对高寻呼会导致高CPU负荷的BSC，增加tx_integer，降低RACH信道负荷；\r\n6、 增加周期性位置更新时长；\r\n7、针对BSC CP高可以将，无线侧将“BTS测量报告预处理”设置为“是”，并且”预处理测量报告上报频率”为“每2秒1次”；\r\n8、开启重要客户的优先接入功能；\r\n9、关闭逻辑信道的自适应功能；\r\n10、 减少小区数据信道的配置，直至关闭部分小区GPRS功能；",
				"rewindProcess":"倒回流程：接到省监控预警降级的通知后，省无线设备维护专业组长立刻将修改的参数倒回。",
				"actionScript":"操作脚本：" +
				"\r\n卡特：\r\n1、在BSSUSM-->Abis topology view-->modify BTS Characteristics中更改RSL复用方式。\r\n2、在RNUSM中edit cell-->RACH Ctrl中减少MAX_RETRANS数。\r\n3、在RNUSM窗口edit cell-->timers中对Wait Indication Timers参数进行调整。\r\n4、在RNUSM中edit cell-->RACH Ctrl中增加tx_integer。\r\n5、在RNUSM中edit cell-->cell description中增加T3212值。\r\n6、在RNUSM中选定小区-->edit cell，在Ded. Radio Res中增大INTAVE值。\r\n7、在RNUSM中选定小区-->edit cell，在cell information-->RACH Ctrl中进行ACC控制。\r\n8、在RNUSM窗口，edit cell--> GPRS-->Radio Res. Ctrl中减少PDCH信道配置数。" +
				"\r\n爱立信：\r\n1、RLSBC：Cell=cell, MAXRET=1;\r\n2、RLSBC:CELL=cell,T3212=30;\r\n3、RLDEC：Cell=cell,ACC=***;\r\n4、RLAPE:CELL=cell;\r\n5、RLGSC：Cell=***，FPDCH=0;\r\nRLGSE:CELL=cell;" +
				"\r\n华为：\r\n1、在传输资源充足的情况下，尽量采用非4：1 复用组网方式。\r\n2、在“本地维护终端”上执行命令MOD CELLIDLEBASIC，设置“接入允许保留块数”为1；在“本地维护终端”上执行命令MOD CELLIDLEBASIC，设置“相同寻呼间帧数编码”为2_M_PERIOD(2 个复帧周期)；在“本地维护终端”上执行命令MOD CELLCCCH，设置“CCCH 负荷门限”为100。\r\n3、设置“小区属性参数 〉呼叫控制参数 〉呼叫控制基本参数 〉允许重指配”为“否”，设置“小区属性参数 〉呼叫控制参数 〉呼叫控制基本参数 〉MS最大重发次数”为1。\r\n4、小区属性参数 〉其他属性参数 〉高级参数 〉T3122(秒)设置为30s。\r\n5、“BSC属性参数 〉BSC基本属性参数 〉软参 〉随机接入中一个周期允许的最大个数”，默认值15，参考修改值12。\r\n6、设置“小区属性参数 〉空闲模式参数 〉空闲基本参数 〉周期位置更新周期（6分钟）”为30。\r\n7、小区属性参数 〉切换参数 〉切换高级参数 〉BTS测量报告预处理”为“是”，设置“小区属性参数 〉切换参数 〉切换高级参数 〉预处理测量报告上报频率”为“每2秒一次”。\r\n8、“小区属性参数 〉基本属性参数 〉SDCCH动态分配允许”为“否”。\r\n9、“小区属性参数 〉基本属性参数 〉GPRS允许”，关闭GPRS功能。",
				"contact":"联系方式:" +
				"\r\n1、爱立信、华为：翁娜云13905182685。" +
				"\r\n2、卡特：仇宏剑13905180982。",
				"reportingTemplate":"上报信息模板:" +
				"\r\n全省受灾情况和网络运行情况，主要数据包括受影响的基站数（xx站停电，xx站退服，受影响最严重的3－5个地区，并通报退服的量），传输中断情况（xx2M中断，xx皮长公里线路受影响，受影响最严重的3－5个地区，并通报退服的量）。全省应急措施，动用多少物资和多少人员。受灾最严重地区的网络影响情况、应对措施和效果进行描述。",
				"summaryTemplate":"总结模板:" +
				"\r\n灾情情况：地区损失情况和公司损失情况。\r\n准备情况：主要包括领导部署和动员（人员投入情况）、资源调配（物资准备、应急设备的检测和预准备）、应急预案（救灾指挥现场、VIP基站、互联互通的通信保障）。\r\n抢险保障实施情况：分专业将影响最严重的事件进行总结，主要将发生什么样的灾情，市公司采取了什么样的应对措施，实施效果如何。",
				"warningCases":"预警处理案例:" +
				"\r\n无线室维护人员仇宏剑收到蓝色预警信息，影响苏州相城区北部部分用户寻呼困难。立即登录OSS，针对高话务负荷可能导致SZM04B4的话务拥塞导致高掉话，立即通过指令RLSBC：Cell=cell, MAXRET=1;将MS最大重发次数调整为1次，降低RACH信道负荷。通过指令RLSBC:CELL=cell,T3212=30;增加周期性位置更新时长，通过指令RLAPE:CELL=cell;关闭逻辑信道自适应功能等操作，降低高话务负荷可能带来的全阻风险，处理时长约20分钟。",
				"emergencyPreparedness":"应急预案信息:"
		};
		
		
		public static var MSCdatas:Object = {"red":redPlanData1,
			"orange":orangePlanData1,
			"yellow":yellowPlanData1,
			"blue":bluePlanData1};
		public static var BSCdatas:Object = {"red":redPlanData2,
			"orange":orangePlanData2,
			"yellow":yellowPlanData2,
			"blue":bluePlanData2};
	}
}