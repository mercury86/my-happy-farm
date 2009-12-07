package  
{
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
		
	}
	
}