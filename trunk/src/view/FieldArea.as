package view 
{
	import com.event.EventZheng;
	import com.utils.DebugTrace;
	import data.EventConst;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.ColorMatrixFilter;
	import socket.RequestToServer;
	import view.plant.PlantInstance;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class FieldArea extends Sprite 
	{
		private var _field:Field;
		private var _crop:PlantInstance;
		private var _row:int;
		private var _cols:int;
		//tips提示框
		private var tips:FieldTips;
		private var tipsX:int= 50;
		private var tipsY:int = -80;
		
		public function FieldArea(sx:int,sy:int)
		{
			tips = new FieldTips();
			tips.name = "tips";
			tips.mouseEnabled = false;
			_row = sx;
			_cols = sy;
			name = "fa" + sx + "_" + sy;
			addEvent();
			txt.text = sx + "," + sy;
		}
		private function addEvent():void {
			addEventListener(MouseEvent.ROLL_OVER, onOver);
			addEventListener(MouseEvent.ROLL_OUT, onOut);
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			var mainView:MainView = MainView.getInstance();
			var type:String = mainView.mainData.operate;
			switch(type) {
				case "select":
					
					break;
				case "hoeing":
					hoeing();
					break;
				case "watering":
					watering();
					break;
				case "killWorm":
					killWorm();
					break;
				case "putWorm":
					putWorm();
					break;
				case "killWeed":
					killWeed();
					break;
				case "putWeed":
					putWeed();
					break;
				case "reap":
					reap();
					break;
				case "fertilize":
					fertilize();
					break;
				default:
					DebugTrace.dtrace("code info FieldArea.as:没有该操作。")
			}
		}
		
		private function onOut(e:MouseEvent):void 
		{
			if (crop != null) {
				colorBack(crop);
			}
			if (parent.parent.getChildByName("tips")!=null) {
				hideTips();
			}else {
				//DebugTrace.dtrace("code info FieldArea.as:场景中没有tips")
			}
			
		}
		
		private function onOver(e:MouseEvent):void 
		{
			
			if(crop!=null){
				showTips();
				colorChange(crop);
			}else {

			}
		}
		private function colorChange(mc:MovieClip):void {
			var matrix:Array = new Array();
            matrix = matrix.concat([1, 0, 0, 0.1, 0]); // red
            matrix = matrix.concat([0, 1, 0, 0.1, 0]); // green
            matrix = matrix.concat([0, 0, 1, 0.1, 0]); // blue
            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			
			var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
            var filters:Array = new Array();
            filters.push(filter);
			mc.filters = filters;
		}
		private function colorBack(mc:MovieClip):void {
			var matrix:Array = new Array();
            matrix = matrix.concat([1, 0, 0, 0, 0]); // red
            matrix = matrix.concat([0, 1, 0, 0, 0]); // green
            matrix = matrix.concat([0, 0, 1, 0, 0]); // blue
            matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			
			var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
            var filters:Array = new Array();
            filters.push(filter);
			mc.filters = filters;
		}
		public function hoeing():void {
			if(crop!=null){
				var requestToServer:RequestToServer = RequestToServer.getInstance();
				requestToServer.req_hoeing(_row, _cols);
			}else {
				DebugTrace.dtrace("code info FieldArea.as:没有农作物可以挖。")
			}
		}
		public function delPlant():void {
			if (crop != null) {
				crop.delThis();
				crop = null;
			}else {
				DebugTrace.dtrace("code info FieldArea.as:没有农作物可以挖2。")
			}
		}
		public function watering():void {
			field.watering();
		}
		public function killWeed():void {
			field.killWeed();
		}
		public function putWeed():void {
			field.putWeed();
		}
		public function reap():void {
			if (crop != null) {
				crop.reap();
			}else {
				
			}	
		}
		public function killWorm():void {
			if(crop!=null){
				crop.killWorm();
			}else {
				DebugTrace.dtrace("code info FieldArea.as:这块土地上没有植物。");
			}
		}
		public function putWorm():void {
			if(crop!=null){
				crop.putWorm();
			}else {
				
			}
		}
		public function fertilize():void {
			field.fertilize();
		}
		public function showTips():void {
			parent.parent.addChild(tips);
			tips.x = parent.x+this.x+tipsX;
			tips.y = parent.y+this.y+tipsY;
			layoutTips();
		}
		public function hideTips():void {
			parent.parent.removeChild(tips);
		}
		public function layoutTips():void {
			tips.upTxt.text = crop.plantName;
			tips.downTxt.text = String(crop.periodTime);
		}
		public function get row():int { return _row; }
		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
		public function get cols():int { return _cols; }
		
		public function set cols(value:int):void 
		{
			_cols = value;
		}
		
		public function get crop():PlantInstance { return _crop; }
		
		public function set crop(value:PlantInstance):void 
		{
			_crop = value;
		}
		
		public function get field():Field { return _field; }
		
		public function set field(value:Field):void 
		{
			_field = value;
		}
	}
	
}