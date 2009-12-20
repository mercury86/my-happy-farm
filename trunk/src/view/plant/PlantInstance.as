package view.plant 
{
	import com.utils.DebugTrace;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class PlantInstance extends MovieClip implements IPlant
	{
		private var parentPlant:Plant;
		private var displayMc:MovieClip;//显示的mc
		private var worm_mc:Worm;
		private var _status:int;//当前状态
		
		private var plantName:String;//植物名字
		private var periodNum:int;//几季植物
		private var _periodTime:int;//阶段成熟剩余的时间
		
		private var timer:Timer;
		public function PlantInstance(mc:MovieClip)
		{
			this.displayMc = mc;
			parentPlant = new Plant(mc);
			worm_mc = new Worm();
			addChild(mc);
			addChild(worm_mc);
		}
		private function addTimer():void {
			timer = new Timer(1000, 0);
			timer.addEventListener(TimerEvent.TIMER, decreasePeriodTim);
			timer.start();
		}
		private function decreasePeriodTim(e:TimerEvent):void {
			if (_periodTime < 0) {
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
		public function hoeing():void {
			parentPlant.hoeing();
		}
		public function reap():void {
			parentPlant.reap();
		}
		public function killWorm():void {
			parentPlant.killWorm(worm_mc);
		}
		public function putWorm():void {
			parentPlant.putWorm(worm_mc);
		}
		public function delThis():void {
			parentPlant.delThis();
			removeTimer();
		}
		
		public function get row():int { return parentPlant.row; }
		
		public function set row(value:int):void 
		{
			parentPlant.row = value;
			
		}
		
		public function get cols():int { return parentPlant.cols; }
		
		public function set cols(value:int):void 
		{
			parentPlant.cols = value;
		}
		
		public function get status():int { return parentPlant.status; }
		
		public function set status(value:int):void 
		{
			_status = value;
			parentPlant.status = value;
		}
		
		public function get periodTime():int { return _periodTime; }
		
		public function set periodTime(value:int):void 
		{
			_periodTime = value;
			addTimer();
		}
		
	}
	
}