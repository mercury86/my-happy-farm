package  
{
	import com.event.EventZheng;
	import data.EventConst;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * 负责修改数据,界面如果有互动，直接调用该类中的方法
	 * @author zhengzihua
	 */
	public class MainController
	{
		private var mainData:MainData;
		public function MainController(mainData:MainData) 
		{
			this.mainData = mainData;
		}
		public function onAreaClick(e:MouseEvent):void 
		{
			//查看当前是什么操作。
			var type:String = mainData.operate;
			switch(type) {
				case "":
				
					break;
				case "":
					break;
			}
		}
		public function changeLogin(b:Boolean):void {
			mainData.login = b;
		}
		public function changeIsMyFarm(b:Boolean):void {
			mainData.isMyFarm = b;
		}
		public function changeOperate(str:String):void {
			mainData.operate = str;
		}
	}
	
}