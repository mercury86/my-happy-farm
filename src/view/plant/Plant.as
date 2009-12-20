package view.plant 
{
	import com.utils.DebugTrace;
	import flash.display.MovieClip;
	
	/**
	 * Plant类用来将所有植物的共性集合起来
	 * @author zhengzihua
	 */
	public class Plant extends MovieClip
	{
		private var _row:int;
		private var _cols:int;
		private var _status:int;
		private var displayMc:MovieClip;
		public function Plant(mc:MovieClip) 
		{
			displayMc = mc;
		}
		/**
		 * 挖掉
		 * 如果已经枯萎了，直接挖掉
		 * 如果还没有被采摘，弹出提示框。
		 */
		public function hoeing():void {

		}
		/**
		 * 采摘
		 * 如果是成熟状态了，直接采摘
		 * 如果还没有成熟，提示无法采摘，或者不提示
		 */
		public function reap():void {
			if (_status == 6) {
				//植物到枯萎状态
				//通知后台，采摘
			}else {
				DebugTrace.dtrace("code info Plant.as:没有成熟，无法采摘。")
			}
		}
		/**
		 * 杀虫
		 * 如果有虫，杀掉
		 * 没有虫，则提示。
		 * @param	worm
		 */
		public function killWorm(worm:MovieClip):void {
			if (worm.currentFrame != 1) {
				worm.prevFrame();
			}else {
				DebugTrace.dtrace("code info Plant.as:没有虫可以杀。")
			}
		}
		public function putWorm(worm:MovieClip):void {
			if (worm.currentFrame != 4) {
				worm.nextFrame();
			}else {
				DebugTrace.dtrace("code info Plant.as:虫的数量够三只了，不能再放了。")
			}
		}
		public function gotoStatus():void {
			
		}
		public function delThis():void {
			
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
		
		public function get status():int { return _status; }
		
		public function set status(value:int):void 
		{
			_status = value;
			displayMc.gotoAndStop(value);
		}
		
	}
	
}