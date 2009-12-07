package  
{
	import com.event.EventZheng;
	import data.EventConst;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * 接收界面元素抛出的事件信息，经过判断后，修改相关数据
	 * @author zhengzihua
	 */
	public class MainController extends EventDispatcher
	{
		private var mainData:MainData;
		public function MainController(mainData:MainData) 
		{
			this.mainData = mainData;
		}
		private function addEvent():void {
			addEventListener(EventConst.EVENT_CLICK_AREA, onAreaClick);
		}
		
		private function onAreaClick(e:EventZheng):void 
		{
			//查看当前是什么操作。
		}
		
	}
	
}