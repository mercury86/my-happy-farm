package view.shop{
	import view.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	public class ShopPanel extends DialogBase {

		public function ShopPanel() {
			this.dialogMcName="shop";
			this.showCloseBtn=true;

		}
		override protected function main():void {
			super.main();
			var shoptabarr:Array=["种子","道具","装饰"];
			

			for (var i:int=0; i<3; i++) {

				var shoptabtxtfield:TextField=new TextField;
				shoptabtxtfield.selectable=false;
				var txtFmat:TextFormat=new TextFormat;
				txtFmat.color=0x888888;
				txtFmat.size=14;
				shoptabtxtfield.defaultTextFormat=txtFmat;
				shoptabtxtfield.text=shoptabarr[i];
				dialogMc["shoptab" + i].addChild(shoptabtxtfield);

			}
			//dialogMc.shoptab0.gotoAndStop(2);
			//trace(dialogMc.shoptab0.tabtxt)
		}
		override protected function addEventFun():void {

			super.addEventFun();

		}
	}
}