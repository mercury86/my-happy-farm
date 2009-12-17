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
		
		private static var mainView:MainView
		private static var mySend:LocalConnection;
		private static var myRec:LocalConnection;
		public function ServerInfoDeal() 
		{
			
		}
		public static function connectServer() {
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
			mainView = MainView.getInstance();
			dealInfo(mainView, obj);
		}
		public static function dealInfo(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info SeverInfoDeal.as:收到信息编号为-----------" + obj.resType);
			switch(obj.resType) {
				case 10001://登陆信息
					var dealLoginInfo:DealLoginInfo=DealLoginInfo.getInstance();
					dealLoginInfo.dealLogin(obj);
					break;
				case 10002://用户信息
					var dealUserInfo:DealUserInfo = DealUserInfo.getInstance();
					dealUserInfo.dealUserInfo(mainView, obj);
					break;
				case 10003://农田信息
					var dealFarmInfo:DealFarmInfo = DealFarmInfo.getInstance();
					dealFarmInfo.layoutFarm(mainView,obj);
					break;
				case 10006://刷新好友列表
					
					break;
				case 30001://浇水
					var dealWatering:DealField = DealField.getInstance();
					dealWatering.dealWatering(mainView,obj);
					break;
				case 30002://施肥
					var dealFertilize:DealField = DealField.getInstance();
					dealFertilize.dealFertilize(mainView,obj);
					break;
				case 30003://除草
					var dealWeed:DealField = DealField.getInstance();
					dealWeed.dealKillWeed(mainView,obj);
					break;
				case 30004://杀虫
				
					break;
				case 30005://放虫
				
					break;
				case 30006://放草
				
					break;
				case 30007://收获
				
					break;
				case 30008://一键摘取
				
					break;
				case 30009://扩建
				
					break;
				//case 30010:
				//
					//break;
				//case 30011:
				//
					//break;
				case 30012://播种
				
					break;
				default:
					DebugTrace.dtrace("code error ServerInfoDeal.as:没有的类型.")
					break;			
			}
		}
		public static function sendMsg(obj:Object) {
			var str:String = JSON.encode(obj);
			try{
				mySend.send("localImitation", "imitationDeal", str);
			}catch (e:Error) {
				DebugTrace.dtrace("error code LocalComm:" + e);
			}
		}
		
	}
	
}
