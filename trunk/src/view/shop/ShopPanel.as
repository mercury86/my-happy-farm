package view.shop{
	import view.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import view.warehouse.*;
	import data.vo.*;
	import utils.grid.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class ShopPanel extends DialogBase {
		private var nowtab:int=0;
		public function ShopPanel() {

			this.dialogMcName="shop";
			this.showCloseBtn=true;

		}
		override protected function main():void {
			super.main();
			var shoptabarr:Array=["种子","道具","装饰"];

			for (var i:int=0; i < 3; i++) {

				dialogMc["shoptab" + i].tabtxt.text=shoptabarr[i];
				dialogMc["shoptab" + i].tabtxt.selectable=false;
				dialogMc["shoptab" + i].tabtxt.mouseEnabled=false;

			}
			dialogMc["shoptab" + nowtab].gotoAndStop(2);
			var arr:Array=new Array;
			createTab(arr,"seed_mc");
		}
		private function createTab(arr:Array,paraname:String):void {

           
			for (var j:int=0; j < 14; j++) {
				var gridDataDispVO:GridDataDispVO=new GridDataDispVO;
				gridDataDispVO.item_bg_mc=GetMovieClip.getMovieClip(paraname);
				switch (paraname) {
					case "seed_mc" :
						gridDataDispVO.item=new ProductsData();
						gridDataDispVO.item_bg_mc.money.text=gridDataDispVO.item.buyprice;
						gridDataDispVO.item_bg_mc.level.text="level?"
						break;

					case "tool_mc" :
						gridDataDispVO.item=new ProductsData();
						gridDataDispVO.item_bg_mc.money.text=gridDataDispVO.item.buyprice;
						gridDataDispVO.item_bg_mc.sellornot.text="sell?"
						break;

					case "zhuangshi_mc" :
						gridDataDispVO.item=new ProductsData();
						gridDataDispVO.item_bg_mc.money.text=gridDataDispVO.item.buyprice;
						
						break;
				}

				arr.push(gridDataDispVO);
			}
			createChild(arr);
		}
		private function createChild(array:Array):void {
			var grid:Grid=new Grid(this.dialogMc.width,this.dialogMc.height);
			grid.x=10;
			grid.y=100;
			grid.rowDist=12;
			grid.colDist=20;
			grid.dataProvider=array;
			this.dialogMc.addChild(grid);

			grid.addEventListener(MouseEvent.CLICK,ongridDataClick);


			grid.validateNow();
		}
		override protected function addEventFun():void {

			super.addEventFun();
			for (var j:int=0; j < 3; j++) {
				dialogMc["shoptab" + j].addEventListener(MouseEvent.CLICK,ontabClick);

			}
		}
		private function ontabClick(e:MouseEvent):void {

			if (int(e.target.name.charAt(7)) != nowtab) {
				dialogMc["shoptab" + nowtab].gotoAndStop(1);
				nowtab=int(e.target.name.charAt(7));
				dialogMc["shoptab" + nowtab].gotoAndStop(2);
				dialogMc.removeChildAt(6);

				switch (int(e.target.name.charAt(7))) {
					case 0 :
						var arr0:Array=new Array;
						createTab(arr0,"seed_mc");
						break;
					case 1 :
						var arr1:Array=new Array;
						createTab(arr1,"tool_mc");
						break;
					case 2 :
						var arr2:Array=new Array;
						createTab(arr2,"zhuangshi_mc");
						break;
				}
			}
		}
		private function ongridDataClick(e:MouseEvent):void {

			var thegriditem:GridItem=e.target  as  GridItem;
			if (thegriditem == null) {
				return;
			}
			var datahere:ProductsData=thegriditem.gridDataDispVO.item as ProductsData;
			trace(datahere);
			var shopchildpanel:ShopChildPanel=new ShopChildPanel;
			this.addChild(shopchildpanel);
		}
	}
}