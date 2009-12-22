package view 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import socket.RequestToServer;
	import view.shop.ShopChildPanel;
	import view.shop.ShopPanel;
	
	/**
	 * 显示商店，我的农场，按钮
	 * @author zhengzihua
	 */
	public class ToolBar extends MovieClip
	{
		private var toServer:RequestToServer;
		public function ToolBar(cx:int, cy:int)
		{
			x = cx;
			y = cy;
			addEvent();
			toServer = RequestToServer.getInstance();
		}
		private function addEvent():void {
			shopBtn.addEventListener(MouseEvent.CLICK, onShopClick);
			storehouseBtn.addEventListener(MouseEvent.CLICK, onStoreHouseClick);
			myfarmBtn.addEventListener(MouseEvent.CLICK, onMyFarmClick);
		}
		
		private function onMyFarmClick(e:MouseEvent):void 
		{
			toServer.req_farmInfo(0);
		}
		
		private function onStoreHouseClick(e:MouseEvent):void 
		{
			toServer.req_storeHouse();
		}
		
		private function onShopClick(e:MouseEvent):void 
		{
			var mainView:MainView = MainView.getInstance();
			var shop:ShopPanel = new ShopPanel();
			mainView.shopContain.addChild(shop);
			//toServer.req_shop();
		}
		
	}
	
}