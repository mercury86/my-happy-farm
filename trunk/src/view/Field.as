package view 
{
	import flash.display.MovieClip;
	
	/**
	 * 农田
	 * @author zhengzihua
	 */
	public class Field extends MovieClip
	{
		private var _row:int;
		private var _cols:int;
		private var _status:int;
		public function Field(sx:int,sy:int) 
		{
			_row = sx;
			_cols = sy;
			name = "f" + sx + "_" + sy;
		}
		public function watering():void {
			
		}
		public function killWeed():void {
			
		}
		public function putWeed():void {
			
		}
		
		public function get cols():int { return _cols; }
		
		public function set cols(value:int):void 
		{
			_cols = value;
		}
		
		public function get row():int { return _row; }
		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
		public function get status():int { return _status; }
		
		public function set status(value:int):void 
		{
			_status = value;
			gotoAndStop(value);
		}
		
	}
	
}