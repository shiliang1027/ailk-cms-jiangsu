package com.linkage.module.cms.scenedaily.serv.kqikpipi
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.kqikpipi.IKQIKPIPIDao;
	import com.linkage.module.cms.scenedaily.domain.kqikpipi.KQIKPIPIDM;
	import com.linkage.module.cms.scenedaily.event.kqikpipi.KQIKPIPIEvent;

	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class KQIKPIPICmd
	{
		private var log:ILogger = Log.getLoggerByClass(KQIKPIPICmd);

		private var testXml:XML = <KPI name="感知接通率" id="001" type="KQI" color="0" leafNum="10">
				<KPI name="短信接通率" id="002" type="KPI" color="0" leafNum="1">
					<KPI name="指标001" id="002001" type="KPI" color="0"/>
				</KPI>
				<KPI name="彩信接通率" id="003" type="KPI" color="0" leafNum="8">
					<KPI name="指标002" id="002003" type="KPI" color="0xFF0000"/>
					<KPI name="指标003" id="002003" type="KPI" color="0"/>
					<KPI name="指标004" id="002003" type="KPI" color="0" leafNum="6">
						<KPI name="指标004001" id="002003" type="KPI" color="0"/>
						<KPI name="指标004002" id="002003" type="PI" color="0"/>
						<KPI name="指标004003" id="002003" type="PI" color="0"/>
						<KPI name="指标004001" id="002003" type="PI" color="0"/>
						<KPI name="指标004002" id="002003" type="PI" color="0"/>
						<KPI name="很长很长很长很长很长很长很长很长的指标名" id="002003" type="PI" color="0xFF0000"/>
					</KPI>
				</KPI>
				<KPI name="GPRS接通率" id="004" type="PI" color="0" leafNum="1" badLevel="0">
					<KPI name="指标005" id="002004" type="PI" color="0xFF0000" badLevel="1"/>
				</KPI>
			</KPI>;

		[Inject("kQIKPIPIDao")]
		public var dao:IKQIKPIPIDao;

		[Inject("kQIKPIPIDM")]
		[Bindable]
		public var dm:KQIKPIPIDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;


		public function execute(e:KQIKPIPIEvent):AsyncToken
		{
			log.info("KQIKPIPICmd execute:" + e.kpiId);
			return dao.getKqiKpiPiRelation(e.kpiId);
		}

		public function result(data:Object):void
		{
			log.debug("KQIKPIPICmd 加载关联数据成功：" + data.result);
			dm.xmlData = new XML(data.result);

			dm.colorMap = {"KQI": "0x68caff", "KPI": "0xff9291", "PI": "0x70cd6c"};
			if(data.kqi)
				dm.colorMap['KQI'] = "0x" + data.kqi;
			if(data.kpi)
				dm.colorMap['KPI'] = "0x" + data.kpi;
			if(data.pi)
				dm.colorMap['PI'] = "0x" + data.pi;

			log.debug(dm.colorMap);

			log.info("KQIKPIPICmd 派发处理数据的事件：DEAL_KQIKPIPI_DATA");
			msgDispatcher(new KQIKPIPIEvent(KQIKPIPIEvent.DEAL_KQIKPIPI_DATA));
		}

		public function error(f:Fault):void
		{
			log.error("KQIKPIPICmd 加载关联数据失败：" + f.faultString + "\n" + f.faultDetail);
//
//			dm.xmlData = testXml;
//
//			log.info("KQIKPIPICmd 派发处理数据的事件：DEAL_KQIKPIPI_DATA");
//			msgDispatcher(new KQIKPIPIEvent(KQIKPIPIEvent.DEAL_KQIKPIPI_DATA));
		}
	}
}

