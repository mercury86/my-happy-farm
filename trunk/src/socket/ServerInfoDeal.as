package socket 
{
	import com.adobe.serialization.json.JSON;
	import com.utils.DebugTrace;
	import flash.events.AsyncErrorEvent;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class ServerInfoDeal 
	{
		
		private static var mySend:LocalConnection;
		private static var myRec:LocalConnection;
		public function ServerInfoDeal() 
		{
			
		}
		public static function connectServer():void {
			myRec = new LocalConnection();
			mySend = new LocalConnection();
			myRec.connect("localFarm");
			myRec.client = ServerInfoDeal;
			mySend.addEventListener(StatusEvent.STATUS,onStatus);
		}
		
		static private function onStatus(e:StatusEvent):void 
		{
			switch (e.level) {
				case "status" :
					DebugTrace.dtrace("suc-----------------");
					break;
				case "error" :
					DebugTrace.dtrace("error---------------");
					break;
			}	
		}
		public static function farmDeal(str:String):void {
			DebugTrace.dtrace("code info ServerInfoDeal.as:收到信息：" + str)
			var obj:Object = JSON.decode(str);
			if (obj.status == 1) {
				dealInfo(obj);
			}else {
				//显示错误提示
				DebugTrace.dtrace("code info ServerInfoDeal.as:操作失败---" + obj.error);
				return;
			}		
		}
		/**
		 * 
		 * @param	allInfo对象有四个键，分别是resType,status,error,data
		 */
		public static function dealInfo(allInfo:Object):void {
			DebugTrace.dtrace("code info SeverInfoDeal.as:收到信息编号为-----------" + allInfo.resType);
			var obj:Object = allInfo.data;	
			if (allInfo.status != 1) {
				DebugTrace.dtrace("code info ServerInfoDeal.as:异常----" + allInfo.error);
				return;
			}	
			switch(allInfo.resType) {
				case 10001://登陆信息
					var dealLoginInfo:DealLoginInfo=DealLoginInfo.getInstance();
					dealLoginInfo.dealLogin(obj);
					break;
				case 10002://用户信息
					var dealUserInfo:DealUserInfo = DealUserInfo.getInstance();
					dealUserInfo.dealUserInfo(obj);
					break;
				case 10003://农田信息
					var dealFarmInfo:DealFarmInfo = DealFarmInfo.getInstance();
					dealFarmInfo.layoutFarm(obj);
					break;
				case 10006://刷新好友列表
					
					break;
				//操作----------------------------------------------------
				case 30001://浇水
					var dealWatering:DealField = DealField.getInstance();
					dealWatering.dealWatering(obj);
					break;
				case 30002://施肥
					var dealFertilize:DealField = DealField.getInstance();
					dealFertilize.dealFertilize(obj);
					break;
				case 30003://除草
					var dealWeed:DealField = DealField.getInstance();
					dealWeed.dealKillWeed(obj);
					break;
				case 30004://杀虫
					var dealKillWorm:DealPlant = DealPlant.getInstance();
					dealKillWorm.dealKillWorm(obj);
					break;
				case 30005://放虫
					var dealPutWorm:DealPlant = DealPlant.getInstance();
					dealPutWorm.dealPutWorm(obj);
					break;
				case 30006://放草
					var putWeed:DealField = DealField.getInstance();
					putWeed.dealPutWeed(obj);
					break;
				case 30007://收获
					var reap:DealPlant = DealPlant.getInstance();
					reap.dealReap(obj);
					break;
				case 30008://一键摘取
				
					break;
				case 30009://扩建
					var dealExpand:DealField = DealField.getInstance();
					dealExpand.dealExpand(obj);
					break;    
				//case 30010:
				//
					//break;
				//case 30011:
				//
					//break;
				case 30012://播种
				
					break;
				case 30014://挖掉
					var dealHoeing:DealField = DealField.getInstance();
					dealHoeing.dealHoeing(obj);
				   break;
				   
				case 40001://改变土地状态
					var fieldStatus:DealField = DealField.getInstance();
					fieldStatus.fieldStatus(obj);
					break;
				case 40002://虫的状态
					var wormStatus:DealPlant = DealPlant.getInstance();
					wormStatus.wormStatus(obj);
					break;
				case 40003://草的状态
					var weedStatus:DealField = DealField.getInstance();
					weedStatus.weedStatus(obj);
					break;
				case 40004:
					var cropStatus:DealPlant = DealPlant.getInstance();
					cropStatus.cropStatus(obj);
					break;
				default:
					DebugTrace.dtrace("code error ServerInfoDeal.as:没有的类型.")
					break;			
			}
		}
		public static function sendMsg(obj:Object):void {
			var str:String = JSON.encode(obj);
			try{
				mySend.send("localImitation", "imitationDeal", str);
			}catch (e:Error) {
				DebugTrace.dtrace("error code LocalComm:" + e);
			}
		}
		
	}
	
}
