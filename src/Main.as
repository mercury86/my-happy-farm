package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import view.BottomBar;
	import view.TopBar;
	
	/**
	 *重写happyfarm，比较纠结，这个游戏已经出现这么久了，还有开发的必要么？ 
	 * Main文件只用做初始布局，不打算做其他的操作。
	 ** @author zhengzihua
	 */
	public class Main extends Sprite 
	{
		
		private var mainStage:Sprite;
		private var topBar:Sprite;
		private var bottomBar:Sprite;
		
		public const var mainControl:MainController;
		private var mainData:MainData;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// all start at this--------------------------------------------------
			mainData = new MainData();
			mainControl = new MainController(mainData);
			
			layout();
		}
		private function layout():void {
			topBar = new TopBar();
			bottomBar = new BottomBar();
		}
	}
	
}