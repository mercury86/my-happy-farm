package view 
{
	import com.event.EventZheng;
	import data.EventConst;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import view.plant.Plant;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class FieldArea extends Sprite implements ITips
	{
		private var _field:Field;
		private var _crop:Plant;
		private var _row:int;
		private var _cols:int;
		//tips提示框
		private var tips:FieldTips;
		private var tipsX:int= 50;
		private var tipsY:int = -80;
		
		public function FieldArea(sx:int,sy:int)
		{
			tips = new FieldTips();
			_row = sx;
			_cols = sy;
			name = "fa" + sx + "_" + sy;
			addEvent();
		}
		private function addEvent():void {
			addEventListener(MouseEvent.ROLL_OVER, onOver);
			addEventListener(MouseEvent.ROLL_OUT, onOut);
		}
		
		private function onOut(e:MouseEvent):void 
		{
			hideTips();
		}
		
		private function onOver(e:MouseEvent):void 
		{
			showTips("");
		}
		
		public function hoeing():void {
			field.hoeing();
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
			crop.reap();
		}
		public function killWorm():void {
			crop.killWorm();
		}
		public function putWorm():void {
			crop.putWorm();
		}
		public function showTips(obj:Object):void {
			parent.parent.addChild(tips);
			tips.x = parent.x+this.x+tipsX;
			tips.y = parent.y+this.y+tipsY;
			tips.showTips(obj);
		}
		public function hideTips():void {
			parent.parent.removeChild(tips);
			tips.hideTips();
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
		
		public function get crop():Plant { return _crop; }
		
		public function set crop(value:Plant):void 
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