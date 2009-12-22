package view.plant 
{
	import com.utils.DebugTrace;
	import data.DataConst;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import socket.RequestToServer;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class PlantInstance extends MovieClip 
	{
		private var displayMc:MovieClip;//显示的mc
		private var wilt_mc:Wilt;
		private var worm_mc:Worm;
		private var _plantId:int;
		private var _row:int;
		private var _cols:int;
		private var _status:int;//当前状态
		
		private var _plantName:String;//植物名字
		private var periodNum:int;//几季植物
		
		private var _periodTime:int;//阶段成熟剩余的时间
		
		private var timer:Timer;
		private var requestToServer:RequestToServer;
		public function PlantInstance(mc:MovieClip)
		{
			this.displayMc = mc;
			worm_mc = new Worm();
			wilt_mc = new Wilt();
			mouseChildren = false;
			mouseEnabled = false;
			addChild(mc);
			addChild(worm_mc);
			requestToServer = RequestToServer.getInstance();
		}
		private function addTimer():void {
			timer = new Timer(1000, 0);
			timer.addEventListener(TimerEvent.TIMER, decreasePeriodTim);
			timer.start();
		}
		private function decreasePeriodTim(e:TimerEvent):void {
			if (_periodTime > 0) {
				_periodTime--;
			}else {
				_periodTime = 0;
				removeTimer();
				DebugTrace.dtrace("code info PlantInstance.as:植物成熟了.")
			}
		}
		private function removeTimer():void {
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, decreasePeriodTim);
		}
		/**
		 * 成熟了，收获，并显示枯萎 否者，提示
		 */
		public function reap():void {
			if (_status == 6) {
				requestToServer.req_reap(DataConst.CURR_FARM_ID, _row, _cols);
			}else {
				DebugTrace.dtrace("code info Plant.as:没有成熟，无法采摘。")
			}
		}
		/**
		 * 杀虫
		 */
		public function killWorm():void {
			if (worm_mc.currentFrame != 1) {
				requestToServer.req_killWeed(DataConst.CURR_FARM_ID,_row,_cols);
			}else {
				DebugTrace.dtrace("code info Plant.as:没有虫可以杀。")
			}
		}
		/**
		 * 放虫
		 */
		public function putWorm():void {
			if (worm_mc.currentFrame != 4) {
				requestToServer.req_putWorm(DataConst.CURR_FARM_ID, _row, _cols);
			}else {
				DebugTrace.dtrace("code info Plant.as:虫的数量够三只了，不能再放了。")
			}
		}
		/**
		 * 删除
		 */
		public function delThis():void {
			if(_status==7){
				parent.removeChild(this);
				removeTimer();
			}else {
				DebugTrace.dtrace("code info PlantInstance.as:确定删除该植物？");
			}
		}
		public function addWorm():void {
			if (worm_mc.currentFrame!= 4) {
				worm_mc.nextFrame();
			}else {
				DebugTrace.dtrace("code info PlantInstance.as:虫子的数量太多了。")
			}
		}
		public function delWorm():void {
			if (worm_mc.currentFrame!= 1) {
				worm_mc.prevFarm();
			}else {
				DebugTrace.dtrace("code info PlantInstance.as:虫子已经杀光了")
			}
		}
		public function wormStatus(num:int):void {
			worm_mc.gotoAndStop(num + 1);
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
			if(value<7){
				displayMc.gotoAndStop(value);
			}else {
				removeChild(displayMc);
				addChild(wilt_mc);
			}
		}
		
		public function get periodTime():int { return _periodTime; }
		
		public function set periodTime(value:int):void 
		{
			_periodTime = value;
			addTimer();
		}
		
		public function get plantName():String { return _plantName; }
		
		public function set plantName(value:String):void 
		{
			_plantName = value;
		}
		
		public function get plantId():int { return _plantId; }
		
		public function set plantId(value:int):void 
		{
			_plantId = value;
		}
		
	}
	
}