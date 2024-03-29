﻿package socket 
{	
	import com.utils.DebugTrace;
	/**
	 * 向服务器发送命令
	 * @author zhengzihua
	 */
	public class RequestToServer 
	{
		private static var instance:RequestToServer
		public function RequestToServer(signleton:SingletonRequest) 
		{
			
		}
		public static function getInstance():RequestToServer {
			if (instance == null) {
				instance = new RequestToServer(new SingletonRequest());
			}else {
				DebugTrace.dtrace("code info RequestToServer.as:已经实例化")
			}
			return instance;
		}
		/**
		 * 
		 * @param	uid	用户的id，从网页中获取
		 */
		public  function req_login(uid:int):void {
			ServerInfoDeal.sendMsg({"reqType":10001,"uid":uid});
		}
		public function req_userInfo(uid:int):void {
			ServerInfoDeal.sendMsg( { "reqType":10002,"uid":uid } );
		}
		public function req_farmInfo(uid:int):void {
			ServerInfoDeal.sendMsg( { "reqType":10003,"uid":uid } );
		}
		public function req_friendList(uid):void {
			ServerInfoDeal.sendMsg( { "reqType":10006,"uid":uid} );
		}
		//仓库，商店，背包
		public function req_pocket():void {
			ServerInfoDeal.sendMsg( { "reqType":20001, "uid":0 } );
		}
		public function req_shop():void {
			ServerInfoDeal.sendMsg( { "reqType":20002, "uid":0 } );
		}
		public function req_storeHouse():void {
			ServerInfoDeal.sendMsg( { "reqType":20003, "uid":0 } );
		}
		//操作类--------------------------------------------
		public function req_watering(id:int,row:int,cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30001,"uid":id,"param":{"x":row,"y":cols}} );
		}
		public function req_feitilize(id:int,row:int,cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30002,"uid":id,"param":{"x":row,"y":cols} });
		}
		public function req_killWeed(id:int,row:int,cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30003,"uid":id,"param":{"x":row,"y":cols}} );
		}
		public function req_killWorm(id:int,row:int,cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30004,"uid":id,"param":{"x":row,"y":cols} });
		}
		public function req_putWorm(id:int,row:int,cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30005,"uid":id,"param":{"x":row,"y":cols}} );
		}
		public function req_putWeed(id:int,row:int,cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30006,"uid":id,"param":{"x":row,"y":cols}} );
		}
		public function req_reap(id:int,row:int,cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30007,"uid":id,"param":{"x":row,"y":cols}} );
		}
		public function req_quickReap(id:int,row:int,cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30008,"uid":id,"param":{"x":row,"y":cols}} );
		}
		public function req_expendLand():void {
			ServerInfoDeal.sendMsg( { "reqType":30009,"uid":0} );
		}
		public function req_seed(row:int, cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30012,"uid":0,"param":{"x":row,"y":cols}} );
		}
		public function req_hoeing(row:int, cols:int):void {
			ServerInfoDeal.sendMsg( { "reqType":30014,"uid":0,"param":{"x":row,"y":cols}} );
		}
	}
	
}
class SingletonRequest{}