package view 
{
	import com.event.EventZheng;
	import data.EventConst;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import socket.RequestToServer;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class BottomBar extends MovieClip
	{
		private var _operate:String="";
		public function BottomBar(cx:int,cy:int) 
		{
			x = cx;
			y = cy;
			addEvent();
		}
		private function addEvent():void {
			
			select_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "select" } );
			hoeing_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "hoeing" } );
			watering_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "watering"} );
			killWorm_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "killWorm" } );
			killWeed_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "killWeed" } );
			reap_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "reap" } );
			
			//仓库
			storeHouse_mc.addEventListener(MouseEvent.CLICK, onStoreHouse);
		}
		
		private function onStoreHouse(e:MouseEvent):void 
		{
			//仓库应该是一个单例模式，
			//获取仓库对象
			//添加到显示列表，应该和buttomBar在同一级别
			var toServer:RequestToServer = RequestToServer.getInstance();
			toServer.req_storeHouse();
		}
		public function get operate():String { return _operate; }
		
		public function set operate(value:String):void 
		{
			_operate = value;
			var mainView:MainView = MainView.getInstance();
			mainView.mainData.operate = value;
		}
		
	}
	
}