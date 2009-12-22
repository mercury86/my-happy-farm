package view 
{
	import com.event.EventZheng;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	
	/**
	 * 鼠标跟随显示的图标
	 * @author zhengzihua
	 */
	public class MouseFollow extends MovieClip
	{
		private var timer:Timer = new Timer(50, 0);
		private var operate:String;
		public function MouseFollow() 
		{	
			Mouse.hide();
			timer.addEventListener(TimerEvent.TIMER, mcFollow);
			timer.start();
		}
		public function changeIcon(e:EventZheng):void {
			var type:String = e.obj.operate;
			operate = type;
			gotoAndStop(type);
		}
		public function mcFollow(e:TimerEvent):void {
				x = parent.mouseX+5;
				y = parent.mouseY+5;
			if (parent.mouseY > 50 && parent.mouseY < 550) {
				gotoAndStop(operate);
			}else {
				gotoAndStop("select");
			}
		}
		public function iconHide():void {
			Mouse.show();
			visible = false;
		}
		public function iconShow():void {
			Mouse.hide();
			visible = true;
		}

	}
	
}